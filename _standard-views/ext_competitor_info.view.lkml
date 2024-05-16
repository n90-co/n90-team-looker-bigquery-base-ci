view: ext_competitor_info {
  extension: required

  dimension: competitor_advertiser {
    label: "Competitor Advertiser"
    view_label: "{% parameter view_label_1 %}"
    group_label: "Competitor Info"
    description: "Advertiser is used to identify the payer of a given occurrence. In cases where ‘Who’ is paying is the same as ‘Who’ is advertising, the Competitor Advertiser and Competitor Name will be the same. A Competitor Advertiser can be associated with multiple Competitor Names, Products, and Categories."
    sql:
        CASE
          WHEN ${event_start_raw} < TIMESTAMP '2023-08-21 00:00:00' THEN ${brand_central_products.advertiser_name}
          WHEN ${event_start_raw} >= TIMESTAMP '2023-08-21 00:00:00' THEN ${pdt_kinetiq_creatives.parent_company}
        END ;;
  }

# event_start_time < TIMESTAMP '2023-08-21 00:00:00'
# event_start_time >= TIMESTAMP '2023-08-21 00:00:00'

  dimension: competitor_name {
    label: "Competitor Name"
    view_label: "{% parameter view_label_1 %}"
    group_label: "Competitor Info"
    description: "Competitor Name is used to identify who is advertising. In cases where ‘Who’ is paying is the same as ‘Who’ is advertising, the Competitor Advertiser and Competitor Name will be the same. A Competitor Name can be associated with multiple Competitor Products and Categories."
    sql:
        CASE
          WHEN ${event_start_raw} < TIMESTAMP '2023-08-21 00:00:00' THEN ${brand_central_products.brand_name}
          WHEN ${event_start_raw} >= TIMESTAMP '2023-08-21 00:00:00' THEN ${pdt_kinetiq_creatives.brand}
        END ;;
  }

  dimension: competitor_product {
    label: "Competitor Product"
    view_label: "{% parameter view_label_1 %}"
    group_label: "Competitor Info"
    description: "The name of the Product being advertised."
    sql:
        CASE
          WHEN ${event_start_raw} < TIMESTAMP '2023-08-21 00:00:00' THEN ${brand_central_products.product_name}
          WHEN ${event_start_raw} >= TIMESTAMP '2023-08-21 00:00:00' THEN ${pdt_kinetiq_creatives.product}
        END ;;
  }

  dimension: competitor_category {
    label: "Competitor Category"
    view_label: "{% parameter view_label_1 %}"
    group_label: "Competitor Info"
    description: "Category is a grouping of similar Products. Each product belongs to only one category."
    sql:
        CASE
          WHEN ${event_start_raw} < TIMESTAMP '2023-08-21 00:00:00' THEN ${brand_central_products.category_name}
          WHEN ${event_start_raw} >= TIMESTAMP '2023-08-21 00:00:00' THEN ${pdt_kinetiq_creatives.category}
        END ;;
  }
}
