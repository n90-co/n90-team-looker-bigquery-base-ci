# The name of this view in Looker is "Kinetiq Creatives"
view: kinetiq_creatives {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `next90-core-applications.omniData.kinetiq_creatives` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    description: "Advertiser Brand"
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_id {
    type: string
    description: "Kinetiq ID"
    sql: ${TABLE}.brand_id ;;
  }

  dimension: category {
    type: string
    description: "Advertiser Category"
    sql: ${TABLE}.category ;;
  }

  dimension: creative_resource_id {
    type: string
    description: "Kinetiq unique ID for a creative"
    sql: ${TABLE}.creative_resource_id ;;
  }

  dimension: parent_company {
    type: string
    description: "Parent Company of the brand"
    sql: ${TABLE}.parent_company ;;
  }

  dimension: parent_company_id {
    type: number
    description: "Kinetiq ID"
    sql: ${TABLE}.parent_company_id ;;
  }

  dimension: product {
    type: string
    description: "Product sub of brand. Can be same or different depending on brand-product relationship"
    sql: ${TABLE}.product ;;
  }

  dimension: product_id {
    type: string
    description: "Kinetiq ID"
    sql: ${TABLE}.product_id ;;
  }

  dimension: subcategory {
    type: string
    description: "SubCategory extension from category"
    sql: ${TABLE}.subcategory ;;
  }

  dimension: subcategory_id {
    type: string
    description: "Kinetiq ID"
    sql: ${TABLE}.subcategory_id ;;
  }

  dimension: thumbnail_url {
    type: string
    description: "URL of a thumbnail of a frame of the advertisement"
    sql: ${TABLE}.thumbnail_url ;;
  }

  dimension: video_url {
    type: string
    description: "URL of creative video"
    sql: ${TABLE}.video_url ;;
  }
  # measure: count {
  #   type: count
  # }
}