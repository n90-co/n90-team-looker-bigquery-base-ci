include: "/_base-views/dmas.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +dmas {
  extends: [ext_dry_label]

  sql_table_name: `next90-core-applications.omniData.dmas` ;;


  # Hiding/Renaming/Relabeling Dimensions
  dimension: dma_id {
    description: "Next90's Market ID"
    hidden: yes
  }

  dimension: kantar_region {
    description: "Geographic Region"
    hidden: yes
  }

  dimension: name {
    description: "{% if _explore._name == 'activity_sessions' %}DMA Name{% else %}Market name for local market airings or Media Type (Network TV, Cable TV, etc.) for National airings{% endif %}"
    label: "{% if _explore._name == 'lift_attribution' %}DMA Name/Media Type{% else %}DMA Name{% endif %}"
    view_label: "{% parameter view_label_2 %}"  # Ensure that the parameter 'view_label_2' exists and is properly defined elsewhere
  }

  dimension: neustar_id {
    label: "DMA"
    description: "Neustar DMA ID"
    hidden: no
    map_layer_name: combined_us_canada_dmas
  }

  dimension: timezone {
    description: "{% if _explore._name == 'activity_sessions' %}Timezone where the session was initiated{% else %}Timezone where the advertisement aired{% endif %}"
    view_label: "{% parameter view_label_2 %}"  # Ensure the 'view_label_2' parameter exists in the model
  }
}