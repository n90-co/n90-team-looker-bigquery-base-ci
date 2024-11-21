## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/market_grouping.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +market_grouping {
  extends: [ext_dry_label]

## Overriding the table name to allow for demo schema, no matter which explore.
  sql_table_name: `next90-core-applications.{% parameter lift_attribution.demo_schema %}{% parameter conversion_attribution.demo_schema %}{% parameter activity_sessions.demo_schema %}omniData.market_grouping` ;;

  dimension: customer_markets {
    view_label: "{% parameter view_label_2 %}"
    description: "Customized naming for a market or group of markets that this Brand is interested in having quick access to. Speak with your Customer Service Manager to customize your market groupings."
    sql: COALESCE(${market_grouping},'Other') ;;
  }

#Hiding/Renaming/Relabeling Dimensions{
  dimension: brand_id {
    description: "A unique identifier by Next90 for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: brand_name {
    description: "Name of brand that that is being advertised."
    hidden: yes
  }
  dimension: dma_id {
    description: "Next90's Market ID"
    hidden: yes
  }
  dimension: dma_name {
    description: "Market Name"
    hidden: yes
  }
  dimension: market_grouping {
    description: "Customized naming for a market or group of markets that this Brand is interested in having quick access to. Speak with your Customer Service Manager to customize your market groupings."
    hidden: yes
  }
  dimension: neustar_id {
    description: "Neustar's Market ID"
    hidden: yes
  }
#}
}