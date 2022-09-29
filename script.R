# dir.create("inst/htmlwidgets/plotscapeTest")
# download.file("https://raw.githubusercontent.com/bartonicek/plotscape/main/dist/bundle.js",
#               "inst/htmlwidgets/plotscapeTest/bundle.js")

devtools::load_all()

scene(mtcars, 900, 600) |>
  add_plot_wrapper("scatter", list(x = "wt", y = "mpg")) |>
  add_plot_wrapper("histo", list(x = "drat", y = "_indicator")) |>
  add_plot_wrapper("bar", list(x = "am", y = "_indicator")) |>
  add_plot_wrapper("scatter", list(x = "disp", y = "qsec"))

scene(iris, 900, 300) |>
  add_plot_wrapper("scatter", list(x = "Sepal.Width", y = "Sepal.Length")) |>
  add_plot_wrapper("bar", list(x = "Species", y = "_indicator")) |>
  add_plot_wrapper("scatter", list(x = "Petal.Width", y = "Sepal.Length"))

s1 <- scene(anscombe, 1000, 1000)
for (i in 1:4) {
  mapping <- list(x = paste0("x", i), y = paste0("y", i))
  s1 <- s1 |> add_plot_wrapper("scatter", mapping)
}
s1

scene(MASS::Boston, 900, 500) |>
  add_plot_wrapper("scatter", list(x = "rm", y = "medv")) |>
  add_plot_wrapper("scatter", list(x = "age", y = "dis")) |>
  add_plot_wrapper("histo", list(x = "crim", y = "_indicator")) |>
  add_plot_wrapper("bar", list(x = "chas", y = "_indicator"))
