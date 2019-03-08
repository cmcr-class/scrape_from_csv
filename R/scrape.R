library(tidyverse)
library(rvest)

links_data <- read_csv("data/vaccine_weChat.csv") %>% 
    mutate(file = 1:nrow(.))

links_with_articles <- map_dfr(links_data$url, function(x) {
    links_data %>%
        filter(url == x) %>% 
        mutate(article_text = read_html(x) %>% 
                   html_nodes(".rich_media_content") %>% 
                   html_text() %>% 
                   str_replace_all("[\r\n]", ""))
})

save(links_with_articles, "links_with_articles.rda")

