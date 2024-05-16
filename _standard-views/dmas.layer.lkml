## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/dmas.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +dmas {
  extends: [ext_dry_label]

  sql_table_name: `bigquery-sandbox-393916.looker.dmas` ;;

#Hiding/Renaming/Relabeling Dimensions{
  dimension: dma_id {
    description: "Advocado's Market ID"
    hidden: yes
  }
  dimension: kantar_region {
    description: "Geographic Region"
    hidden: yes
  }
  dimension: name {
    description: "{% if _explore._name == 'activity_sessions' %}DMA Name{% else %}Market name for local market airings or Media Type (Network TV, Cable TV, etc.) for National airings{% endif %}"
    # hidden: yes
    label: "{% if _explore._name == 'lift_attribution' %}DMA Name/Media Type{% else %}DMA Name{% endif %}"
    # label: "DMA Name/Media Type"
    view_label: "{% parameter view_label_2 %}"
    # sql: CASE WHEN ${TABLE}.name in ('DISH','DIRECTV','HISPANIC TV','CABLE TV','NETWORK TV') THEN 'US National'
    #           WHEN ${TABLE}.name = 'CANADIAN SPECL' THEN 'Canadian National'
    #           ELSE ${TABLE}.name
    #           END;;
  }
  dimension: neustar_id {
    description: "Neustar DMA ID"
    hidden: yes
  }
  dimension: timezone {
    description: "{% if _explore._name == 'activity_sessions' %}Timezone where the session was initiated{% else %}Timezone where the advertisement aired{% endif %}"
    # hidden: yes
    view_label: "{% parameter view_label_2 %}"
  }
#}

}
