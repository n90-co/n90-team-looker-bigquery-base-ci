# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: brand_central_products {
  hidden: yes
    join: brand_central_products__product_markets__list {
      view_label: "Brand Central Products: Product Markets List"
      sql: LEFT JOIN UNNEST(${brand_central_products.product_markets__list}) as brand_central_products__product_markets__list ;;
      relationship: one_to_many
    }
}
# The name of this view in Looker is "Brand Central Products"
view: brand_central_products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `next90-core-applications.omniData.brand_central_products` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Advertiser ID" in Explore.

  dimension: advertiser_id {
    type: number
    description: "Kantar ID"
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: advertiser_name {
    type: string
    description: "Advertiser is used to identify the payer of a given occurrence. In cases where ‘Who’ is paying is the same as ‘Who’ is advertising, the Advertiser and Brand share the same name. An Advertiser can be associated with multiple Parent Companies, Subsidiaries, Brands, Products, and Categories."
    sql: ${TABLE}.advertiser_name ;;
  }

  dimension: brand_id {
    type: number
    description: "Next90 ID"
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    description: "The Brand field identifies who is advertising. The Brand name can include sub-brands and brand lines. A Brand can be associated with multiple Parent Companies, Subsidiaries, Advertisers, Products, and Categories."
    sql: ${TABLE}.brand_name ;;
  }

  dimension: category_name {
    type: string
    description: "Category is a Kantar grouping of similar Products. The Category level is below the Major level. Some Categories are divided into further levels of detail as Subcategories and Microcategories. Each product belongs to only one category."
    sql: ${TABLE}.category_name ;;
  }

  dimension: industry_name {
    type: string
    description: "Industry is the highest level of Kantar category classification. Industries are one level above majors.  Each product belongs to only one industry."
    sql: ${TABLE}.industry_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_aired_utc {
    type: time
    description: "The last time this particular Kantar product_id aired in our dataset"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_aired_utc ;;
  }

  dimension: major_name {
    type: string
    description: "Major is the second-highest level of Kantar category classification. Majors are below the Industry level and above the Category level. Each product belongs to only one major."
    sql: ${TABLE}.major_name ;;
  }

  dimension: micro_category_name {
    type: string
    description: "Microcategory is the lowest level of categorization within the Kantar hierarchy. Microcategories are only broken out for certain Subcategories. When the Microcategory level is not broken out, it has the same name as the Subcategory above it for reporting purposes and contains the same products as the Subcategory."
    sql: ${TABLE}.micro_category_name ;;
  }

  dimension: orig_product_id {
    type: number
    description: "Kantar ID. The oproduct_id in data activity tables reflects the original product as it was captured. Changes may be made to the original product table that reflect the current product_id as it is currently reported in the system. This allows updates to any of the product information to be reported at the most recent stage reflected in our syndicated reporting without needing to re-send the activity tables. Join from activity table to oproduct, via oproduct_id. Then use product_id to join to product table for current information."
    sql: ${TABLE}.orig_product_id ;;
  }

  dimension: parent_name {
    type: string
    description: "The Parent identifies the company which owns an advertised Product."
    sql: ${TABLE}.parent_name ;;
  }

  dimension: product_descriptor {
    type: string
    description: "Indicates additional descriptive details about the product that do not belong in the Product Name, such as form, flavor or model.  Included for products within specific categories."
    sql: ${TABLE}.product_descriptor ;;
  }

  dimension: product_id {
    type: number
    description: "Kantar Product ID"
    sql: ${TABLE}.product_id ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: product_markets__list {
    hidden: yes
    sql: ${TABLE}.product_markets.list ;;
    group_label: "Product Markets"
    group_item_label: "List"
  }

  dimension: product_name {
    type: string
    description: "The name of the Product being advertised."
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_type {
    type: string
    description: "A generic term that indicates what the product is, often reflecting the category of the Product."
    sql: ${TABLE}.product_type ;;
  }

  dimension: section_name {
    type: string
    sql: ${TABLE}.section_name ;;
  }

  dimension: sub_category_name {
    type: string
    description: "Subcategory is the second-lowest level of categorization within the Kantar hierarchy. The Subcategory level is below the Category level and above the Microcategory level. Subcategories are only broken out for certain Categories. When the Subcategory level is not broken out, the Subcategory has the same name as the Category above it for reporting purposes and contains the same products as the Category"
    sql: ${TABLE}.sub_category_name ;;
  }

  dimension: subsidiary_name {
    type: string
    description: "The Subsidiary is the immediate owner of an advertised Product. The Subsidiary is one level below the Parent level."
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: ultimate_owner_name {
    type: string
    description: "The Ultimate Owner is the highest-level owner of the advertised product. In most cases, the Ultimate Owner and Parent will be the same. It is intended to handle special situations where a lesser known corporate entity owns companies commonly recognized as parent companies in their own right."
    sql: ${TABLE}.ultimate_owner_name ;;
  }
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#   parent_name,
#   industry_name,
#   category_name,
#   section_name,
#   brand_name,
#   major_name,
#   product_name,
#   subsidiary_name,
#   ultimate_owner_name,
#   micro_category_name,
#   sub_category_name,
#   advertiser_name
#   ]
#   }

}

# The name of this view in Looker is "Brand Central Products Product Markets List"
view: brand_central_products__product_markets__list {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Element" in Explore.

  dimension: element {
    type: string
    sql: ${TABLE}.element ;;
  }
}