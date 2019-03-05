library(tidyverse)
library(rvest)

links_data <- read_csv("data/vaccine_weChat.csv") %>% 
    mutate(file = 1:nrow(.)) %>% 
    head(n = 10)

link_number = 0

walk2(links_data$url, links_data$file, function(x, y) {
    read_html(x) %>% 
        html_text() %>% 
    writeLines(con = file.path("raw_files", paste0("file", y, ".txt")))
})

