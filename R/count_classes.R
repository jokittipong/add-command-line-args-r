# author: Kittipong Wongwipasamitkun
# date: 2023-11-27

"This script counts the classes for a specified column
from specified file_path

Usage: count_classes.R <file_path> <class_col> <output_file>
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(file_path, class_col, output_file) {
  # read in wisconsin breast cancer data
  data <- read_csv(opt$file_path)

  result <- data |> 
    group_by(opt$class_col) |> 
    summarize(Count = n()) |> 
    rename_at(1, ~ "class")

  write.csv(result, opt$output_file)
}

main()
