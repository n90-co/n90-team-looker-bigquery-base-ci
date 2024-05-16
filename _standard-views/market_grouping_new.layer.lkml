## Created by: Mary
## Last edited: 1/10/24 by Mary

## Use once we have partitioned market groupings in mongo copy

include: "/_base-views/market_grouping.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +market_grouping {
  extends: [ext_dry_label]

## Overriding the table name to allow for demo schema, no matter which explore.
  sql_table_name: `bigquery-sandbox-393916.{% parameter lift_attribution.demo_schema %}{% parameter conversion_attribution.demo_schema %}{% parameter activity_sessions.demo_schema %}{% parameter lift_attribution.dynamic_schema %}{% parameter conversion_attribution.dynamic_schema %}{% parameter activity_sessions.dynamic_schema %}looker.market_grouping` ;;

  dimension: customer_markets {
    view_label: "{% parameter view_label_2 %}"
    description: "Customized naming for a market or group of markets that this Brand is interested in having quick access to. Speak with your Customer Service Manager to customize your market groupings."
    sql: COALESCE(${market_grouping},'Other') ;;
  }

  #Created this field to match previous table's schema.
  dimension: market_grouping {
    description: "Customized naming for a market or group of markets that this Brand is interested in having quick access to. Speak with your Customer Service Manager to customize your market groupings."
    hidden: yes
    sql: ${TABLE}.market_group_name ;;
  }

#Hiding/Renaming/Relabeling Dimensions{
  dimension: brand_id {
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  # NEW Market Groups file does not have this field
  # dimension: brand_name {
  #   description: "Name of brand that that is being advertised."
  #   hidden: yes
  # }
  dimension: dma_id {
    description: "Advocado's Market ID"
    hidden: yes
  }
  dimension: dma_name {
    description: "Market Name"
    hidden: yes
  }
  dimension: market_group_id {
    hidden: yes
  }
  dimension: market_group_name {
    hidden: yes
  }
  dimension: neustar_id {
    description: "Neustar's Market ID"
    hidden: yes
  }
  measure: count {
    hidden: yes
  }
#}
}
