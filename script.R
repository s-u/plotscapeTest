# dir.create("inst/htmlwidgets/plotscapeTest")
download.file("https://raw.githubusercontent.com/bartonicek/plotscape/main/dist/bundle.js",
              "inst/htmlwidgets/plotscapeTest/bundle.js")

library(magrittr)
usethis::use_pipe()
devtools::load_all()

dataMtcars <- jsonlite::toJSON(mtcars, dataframe = "columns")
scene1 <- scene(dataMtcars)

scene1 <- scene1  %>%
  add_plot_wrapper("scatter", list(x = "wt", y = "mpg")) %>%
  add_plot_wrapper("histo", list(x = "disp", y = "_indicator"))

scene1
