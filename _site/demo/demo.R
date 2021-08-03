library(bsselectR)
library(tidyverse)
library(ggiraph)

set.seed(123456)

example_data <- tibble(
  A = sample(1:1000, 100, replace = TRUE),
  B = sample(1:1000, 100, replace = TRUE),
  C = sample(1:1000, 100, replace = TRUE),
  D = sample(1:1000, 100, replace = TRUE),
  id = 1:100
)

# Make some plots and save them out
walk(c("B", "C", "D"), ~{
  gg <- ggplot(example_data, aes_string(x = "A", y = .x)) +
    geom_point_interactive(aes(data_id = id)) +
    theme_minimal()

  ggi <- girafe(ggobj = gg)

  htmlwidgets::saveWidget(ggi, file = glue::glue("{.x}.html"))
})

