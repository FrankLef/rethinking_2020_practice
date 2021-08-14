
# declarations ------------------------------------------------------------

tmp <- new.env()

# khroma
# color that are distinct for all people, including color-blind readers

# jcolors
# very nice

fishualize::fishualize(n= 8, option = "Bodianus_rufus")
fishualize::fishualize(n= 8, option = "Scarus_quoyi")
fishualize::fishualize(n= 8, option = "Hypsypops_rubicundus")
fishualize::fishualize(n= 8, option = "Cirrhilabrus_solorensis")

# discrete ----------------------------------------------------------------

unique(paletteer::palettes_d_names$package)
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "fishualize"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "grDevices"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "lisa"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "ggsci"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "ggthemr"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "ggthemes"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "khroma"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "awtools"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "futurevisions"]
paletteer::palettes_d_names$palette[paletteer::palettes_d_names$package == "Manu"]

tmp$pal <- paletteer::paletteer_d("futurevisions::cancri")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("ggthemes::Classic_Cyclic")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("ggthemes::stata_economist")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("tvthemes::WaterTribe")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("LaCroixColoR::PassionFruit")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("awtools::a_palette")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("pals::alphabet")
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_d("ggthemes::calc")
scales::show_col(tmp$pal)

# very nice rainbow-like
tmp$pal <- paletteer::paletteer_d("fishualize::Bodianus_rufus")
scales::show_col(tmp$pal)

# very nice
tmp$pal <- paletteer::paletteer_d("fishualize::Scarus_quoyi")
scales::show_col(tmp$pal)

# very nice rainbow-like
tmp$pal <- paletteer::paletteer_d("fishualize::Hypsypops_rubicundus")
scales::show_col(tmp$pal)

# very nice
tmp$pal <- paletteer::paletteer_d("fishualize::Cirrhilabrus_solorensis")
scales::show_col(tmp$pal)

# few colors with good contrast
tmp$pal <- paletteer::paletteer_d("khroma::vibrant")
scales::show_col(tmp$pal)

# continuous --------------------------------------------------------------


unique(paletteer::palettes_c_names$package)
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "palr"]
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "pals"]
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "scico"]
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "grDevices"]
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "futurevisions"]
paletteer::palettes_c_names$palette[paletteer::palettes_c_names$package == "Manu"]

# other gradual scales for green and red in this
tmp$pal <- paletteer::paletteer_c("oompaBase::bluescale", n = 16)
scales::show_col(tmp$pal)

# very nice rainbow-like
tmp$pal <- paletteer::paletteer_c("oompaBase::jetColors", n = 30)
scales::show_col(tmp$pal)

# very nice rainbow-like wider range of colors . . .except for the blacks are both extremes
tmp$pal <- paletteer::paletteer_c("palr::chl_pal", n = 16)
scales::show_col(tmp$pal)

# very nice black to white
tmp$pal <- paletteer::paletteer_c("palr::bathy_deep_pal", n = 16)
scales::show_col(tmp$pal)

# also use coolwarm for gradients
tmp$pal <- paletteer::paletteer_c("pals::warmcool", n = 20)
scales::show_col(tmp$pal)

# super nice gradients gradients
tmp$pal <- paletteer::paletteer_c("pals::jet", n = 16)
scales::show_col(tmp$pal)

# nice gradients gradients
tmp$pal <- paletteer::paletteer_c("pals::isol", n = 16)
scales::show_col(tmp$pal)

# nice gradients gradients
tmp$pal <- paletteer::paletteer_c("pals::ocean.phase", n = 16)
scales::show_col(tmp$pal)

# scico
tmp$pal <- paletteer::paletteer_c("scico::roma", n = 16)
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_c("scico::berlin", n = 16)
scales::show_col(tmp$pal)



tmp$pal <- paletteer::paletteer_c("grDevices::Inferno", n = 16)
scales::show_col(tmp$pal)

tmp$pal <- paletteer::paletteer_c("grDevices::Tropic", n = 16)
scales::show_col(tmp$pal)


# clients -----------------------------------------------------------------

# create the client palette
# tmp$pal <- paletteer::paletteer_d("LaCroixColoR::PassionFruit")
# clients_pal <- col_factor(
#   palette = as.character(tmp$pal),
#   domain = NULL)(levels(clean_projets$clientgrp1_desc))
# scales::show_col(clients_pal)
# clients_pal

# create the clients by year palette
# clients_years_pal <- lapply(clients_pal, FUN = function(x, amt = 0.25) {
#   c(colorspace::lighten(x, amount = amt),
#     x,
#     colorspace::darken(x, amount = amt))
# })
# clients_years_pal
# clients_years_pal <- unlist(clients_years_pal)
# scales::show_col(clients_years_pal)

# create the clients by value by year palette
# clients_years_val_pal <- lapply(clients_years_pal, FUN = function(x, amt = 0.3) {
#   col <- c(colorspace::lighten(x, amount = amt),
#            x)
# })
# clients_years_val_pal
# clients_years_val_pal <- unlist(clients_years_val_pal)
# clients_years_val_pal
# scales::show_col(clients_years_val_pal)


# machine clusters --------------------------------------------------------

# clus_mach <- c("clust 1", "clus 2", " clus 3")


# finalize ----------------------------------------------------------------

rm(tmp)
