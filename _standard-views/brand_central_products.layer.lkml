## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/brand_central_products.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +brand_central_products {
  extends: [ext_dry_label]

  sql_table_name: `bigquery-sandbox-393916.looker.brand_central_products` ;;

  dimension: orig_product_id {
    description: "Kantar ID. The oproduct_id in data activity tables reflects the original product as it was captured. Changes may be made to the original product table that reflect the current product_id as it is currently reported in the system. This allows updates to any of the product information to be reported at the most recent stage reflected in our syndicated reporting without needing to re-send the activity tables. Join from activity table to oproduct, via oproduct_id. Then use product_id to join to product table for current information."
    hidden: yes
    primary_key: yes
  }

#Hiding/Renaming/Relabeling Dimensions{
  dimension: advertiser_id {
    description: "Kantar ID"
    hidden: yes
  }
  dimension: advertiser_name {
    description: "Advertiser is used to identify the payer of a given occurrence. In cases where ‘Who’ is paying is the same as ‘Who’ is advertising, the Advertiser and Brand share the same name. An Advertiser can be associated with multiple Parent Companies, Subsidiaries, Brands, Products, and Categories."
    hidden: yes
  }
  dimension: brand_id {
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: brand_name {
    description: "The Brand field identifies who is advertising. The Brand name can include sub-brands and brand lines. A Brand can be associated with multiple Parent Companies, Subsidiaries, Advertisers, Products, and Categories."
    hidden: yes
  }
  dimension: category_name {
    description: "Category is a Kantar grouping of similar Products. The Category level is below the Major level. Some Categories are divided into further levels of detail as Subcategories and Microcategories. Each product belongs to only one category."
    hidden: yes
  }
  dimension: industry_name {
    description: "Industry is the highest level of Kantar category classification. Industries are one level above majors.  Each product belongs to only one industry."
    hidden: yes
  }
  dimension_group: last_aired_utc {
    description: "The last time this particular Kantar product_id aired in our dataset"
    hidden: yes
  }
  dimension: major_name {
    description: "Major is the second-highest level of Kantar category classification. Majors are below the Industry level and above the Category level. Each product belongs to only one major."
    hidden: yes
  }
  dimension: micro_category_name {
    description: "Microcategory is the lowest level of categorization within the Kantar hierarchy. Microcategories are only broken out for certain Subcategories. When the Microcategory level is not broken out, it has the same name as the Subcategory above it for reporting purposes and contains the same products as the Subcategory."
    hidden: yes
  }
  dimension: parent_name {
    description: "The Parent identifies the company which owns an advertised Product."
    hidden: yes
  }
  dimension: product_descriptor {
    description: "Indicates additional descriptive details about the product that do not belong in the Product Name, such as form, flavor or model.  Included for products within specific categories."
    hidden: yes
  }
  dimension: product_id {
    description: "Kantar Product ID"
    hidden: yes
  }
#HIDDEN BY DEFAULT IN BASE VIEW:
  # dimension: product_markets__list {
  #   hidden: yes
  # }
  dimension: product_name {
    description: "The name of the Product being advertised."
    hidden: yes
  }
  dimension: product_type {
    description: "A generic term that indicates what the product is, often reflecting the category of the Product."
    hidden: yes
  }
  dimension: section_name {
    hidden: yes
  }
  dimension: sub_category_name {
    description: "Subcategory is the second-lowest level of categorization within the Kantar hierarchy. The Subcategory level is below the Category level and above the Microcategory level. Subcategories are only broken out for certain Categories. When the Subcategory level is not broken out, the Subcategory has the same name as the Category above it for reporting purposes and contains the same products as the Category"
    hidden: yes
  }
  dimension: subsidiary_name {
    description: "The Subsidiary is the immediate owner of an advertised Product. The Subsidiary is one level below the Parent level."
    hidden: yes
  }
  dimension: ultimate_owner_name {
    description: "The Ultimate Owner is the highest-level owner of the advertised product. In most cases, the Ultimate Owner and Parent will be the same. It is intended to handle special situations where a lesser known corporate entity owns companies commonly recognized as parent companies in their own right."
    hidden: yes
  }
#}
}

view: +brand_central_products__product_markets__list {

  dimension: element {
    hidden: yes
  }
}
