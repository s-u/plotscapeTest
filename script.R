# dir.create("inst/htmlwidgets/plotscapeTest")
# download.file("https://raw.githubusercontent.com/bartonicek/plotscape/main/dist/bundle.js",
#               "inst/htmlwidgets/plotscapeTest/bundle.js")

devtools::load_all()

scene(mtcars, 1000, 1000)  |>
  add_plot_wrapper("scatter", list(x = "wt", y = "mpg")) |>
  add_plot_wrapper("histo", list(x = "qsec", y = "_indicator")) |>
  add_plot_wrapper("bar", list(x = "am", y = "_indicator"))

# scene(iris, 1000, 1000)  |>
#   add_plot_wrapper("scatter", list(x = "Sepal.Width", y = "Sepal.Length")) |>
#   add_plot_wrapper("scatter", list(x = "Petal.Width", y = "Petal.Length")) |>
#   add_plot_wrapper("bar", list(x = "Species", y = "_indicator"))

