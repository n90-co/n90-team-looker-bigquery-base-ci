## Created by: Mary
## Last edited: 2/2/24 by Mary

view: pdt_kinetiq_creatives {
  derived_table: {
    sql:  SELECT creative_resource_id,
                MAX(parent_company) as parent_company,
                MAX(brand)          as brand,
                MAX(product)        as product,
                MAX(category)       as category,
                MAX(subcategory)    as subcategory,
                MAX(thumbnail_url)  as thumbnail_url,
                MAX(video_url)      as video_url
          FROM `next90-core-applications.omniData.kinetiq_creatives`
          GROUP BY creative_resource_id ;;
  }

  dimension: creative_resource_id {
    hidden: yes
    type: string
    description: "Kinetiq unique ID for a creative"
    sql: ${TABLE}.creative_resource_id ;;
  }
  dimension: brand {
    hidden: yes
    type: string
    description: "Advertiser Brand"
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    hidden: yes
    type: string
    description: "Advertiser Category"
    sql: ${TABLE}.category ;;
  }
  dimension: parent_company {
    hidden: yes
    type: string
    description: "Parent Company of the brand"
    sql: ${TABLE}.parent_company ;;
  }
  dimension: product {
    hidden: yes
    type: string
    description: "Product sub of brand. Can be same or different depending on brand-product relationship"
    sql: ${TABLE}.product ;;
  }
  dimension: subcategory {
    hidden: yes
    type: string
    description: "SubCategory extension from category"
    sql: ${TABLE}.subcategory ;;
  }
  dimension: thumbnail_url {
    hidden: yes
    type: string
    description: "URL of a thumbnail of a frame of the advertisement"
    sql: ${TABLE}.thumbnail_url ;;
  }
  dimension: video_url {
    hidden: yes
    type: string
    description: "URL of creative video"
    sql: ${TABLE}.video_url ;;
  }
}