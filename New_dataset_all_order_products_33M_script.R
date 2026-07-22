library(tidyverse)
library(readr)
data_raw<- read_csv(file.choose())
data_raw
glimpse(data_raw)
final_amazon_order_33M_data<- data_raw %>% distinct() %>%
  mutate(
    order_id = as.integer(order_id),
    product_id = as.integer(product_id),
    add_to_cart_order = as.integer(add_to_cart_order)
  ) %>% filter(product_id > 20000 & add_to_cart_order > 4 &
                 order_id > 5) %>%
  select(order_id,product_id,add_to_cart_order)
final_amazon_order_33M_data
write.csv(final_amazon_order_33M_data,
          'New_dataset_all_order_products_33M_data.csv',
          row.names = FALSE)
getwd()
