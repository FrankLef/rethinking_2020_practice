#' Format a gt table for posterior summary
#' 
#' Format a gt table for posterior summary. Usually from `quap`, `brm`
#' and `inla`.
#' 
#' The format will rename the quantiles based on the `qtl` argument which
#' must have the same number of element as the corresponding columns.
#'
#' @param df Dataframe. Posterior summary.
#' @param var_col Name of the column with the variables.
#' @param labs List with the following items
#' \describe{
#'   \item{title}{Title of the gt tableau}
#'   \item{subtitle}{Subtitle of the gt tableau}
#' @param qtl List used to change the name of the quantile columns. Should
#'   be formatted as, for example, 
#'   list(`0.025quant` = "2.5%", `0.975quant` = "97.5%").
#' @param clrs List of colors defined as follows with default
#' \decribe{
#'   \item{data}{Use with data_color(), "mintcream"}
#'   \item{heading.background.color}{Used with tab_options(), "lavender"}
#'   \item{heading.title.font.weight}{Used with tab_options(), "bold"}
#'   \item{heading.subtitle.font.weight}{Used with tab_options(), "bold"}
#'   \item{column_labels.background.color}{Used with tab_options(), "oldlace"}
#'   \item{column_labels.font.weight}{Used with tab_options(), "bold"}
#'   \item{stub.background.color}{Used with tab_options(), "oldlace"}
#' }
#' @param digits Integer. Digits used to format data numbers.
#'
#' @return gt table
#' @export
gt_posterior <- function(df, var_col = "var",
                         labs = list(title = "Posterior Summary",
                                     subtitle = "Practice"),
                         qtl = NULL, clrs = NULL, digits = 2L) {
  
  # use default color values if NULL is given
  the_colors <- list(data = "mintcream",
                     heading.background.color = "lavender",
                     heading.title.font.weight = "bold",
                     heading.subtitle.font.weight = "bold",
                     column_labels.background.color = "oldlace",
                     column_labels.font.weight = "bold",
                     stub.background.color = "oldlace")
  # add default color when item is missing
  clrs <- append(x = clrs, 
                 values = the_colors[!(names(the_colors) %in% names(clrs))])
  
  # create the gt table
  df %>%
    tibble::rownames_to_column(var = var_col) %>%
    gt::gt(rowname_col = var_col) %>%
    tab_header(title = labs$title,
               subtitle = labs$subtitle) %>%
    cols_label(.list = qtl) %>%
    cols_align(align = "center", columns = everything()) %>%
    fmt_number(columns = everything(), decimals = digits) %>%
    data_color(columns = everything(), color = clrs$data) %>%
    tab_options(
      heading.background.color = clrs$heading.background.color,
      heading.title.font.weight = clrs$heading.title.font.weight,
      heading.subtitle.font.weight = clrs$heading.subtitle.font.weight,
      column_labels.background.color = clrs$column_labels.background.color,
      column_labels.font.weight = clrs$column_labels.font.weight,
      stub.background.color = clrs$stub.background.color)
}

#' Create a `gt` table comparing posteriors
#' 
#' Create a `gt` table comparing posteriors. Usually from `quap`, `brm`
#' and `inla`.
#' 
#' The list of summaries must meet these conditions
#' \itemize{
#'   \item The summary called "var_df" in the list will be used to name the rows
#'   \item All summaries must have the rows in the same order
#'   \item All summaries must have the same column names
#' }
#'
#' @param dfs List of dataframes with posterior summaries.
#' @param var_df Name of the summary to use as a reference for variable names.
#' @param var_col Name of the column with the variables.
#' @param labs List with the following items
#' \describe{
#'   \item{title}{Title of the gt tableau}
#'   \item{subtitle}{Subtitle of the gt tableau}
#' }
#' @param clrs List of colors defined as follows with default
#' \decribe{
#'   \item{data}{Use with data_color(), "mintcream"}
#'   \item{heading.background.color}{Used with tab_options(), "darkslategray"}
#'   \item{heading.title.font.weight}{Used with tab_options(), "bold"}
#'   \item{heading.subtitle.font.weight}{Used with tab_options(), "bold"}
#'   \item{column_labels.background.color}{Used with tab_options(), "seashell"}
#'   \item{column_labels.font.weight}{Used with tab_options(), "bold"}
#'   \item{stub.background.color}{Used with tab_options(), "seashell"}
#' }
#' @param digits Integer. Digits used to format data numbers.
#'
#' @return gt table
#' @export
gt_posterior_compare <- function(dfs, var_df = names(dfs)[1], var_col = "var",
                                 labs = list(title = "Posterior Summary Comparison",
                                             subtitle = "Practice"),
                                 clrs = NULL, digits = 2L) {
  stopifnot(var_df %in% names(dfs))
  
  
  # use default color values if NULL is given
  the_colors <- list(data = "mintcream",
                     heading.background.color = "darkslategray",
                     heading.title.font.weight = "bold",
                     heading.subtitle.font.weight = "bold",
                     column_labels.background.color = "seashell",
                     column_labels.font.weight = "bold",
                     stub.background.color = "seashell")
  # add default color when item is missing
  clrs <- append(x = clrs, 
                 values = the_colors[!(names(the_colors) %in% names(clrs))])
  
  # combine the dataframes
  out <- lapply(X = names(dfs), FUN = function(x) {
    # keep the "var" column only for the first dataframe
    if (x != var_df) dfs[[x]] <- dfs[[x]][, names(dfs[[x]]) != var_col]
    # add the name of the method to the variables except for the var_col
    sel <- names(dfs[[x]]) != var_col
    names(dfs[[x]])[sel] <- paste(names(dfs[[x]])[sel], x, sep = "_")
    dfs[[x]]
  })
  out <- bind_cols(out)
  
  # create the gt table
  out %>% 
    gt::gt(rowname_col = "var") %>%
    tab_header(title = labs$title,
               subtitle = labs$subtitle) %>%
    tab_spanner_delim(delim = "_", columns = everything(), split = "first") %>%
    cols_align(align = "center", columns = everything()) %>%
    fmt_number(columns = everything(), decimals = digits) %>%
    data_color(columns = everything(), color = clrs$data) %>%
    tab_options(
      heading.background.color = clrs$heading.background.color,
      heading.title.font.weight = clrs$heading.title.font.weight,
      heading.subtitle.font.weight = clrs$heading.subtitle.font.weight,
      column_labels.background.color = clrs$column_labels.background.color,
      column_labels.font.weight = clrs$column_labels.font.weight,
      stub.background.color = clrs$stub.background.color)
}
