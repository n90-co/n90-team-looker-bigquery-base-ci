## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/spots.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +spots {
  extends: [ext_dry_label]

## Overriding the table name to allow for demo schema, no matter which explore.
  sql_table_name: `next90-core-applications.{% parameter lift_attribution.demo_schema %}{% parameter conversion_attribution.demo_schema %}{% parameter activity_sessions.demo_schema %}looker.spots_condensed` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${trigger_id}, ${aeis_id}, ;;
  }

  dimension: creative_name {
    description: "Creative name if updated in Next90 portal, otherwise will default to ISCI"
    view_label: "{% parameter view_label_1 %}"
    sql: COALESCE(${TABLE}.creative_name, ${isci}) ;;
  }

#MEASURES{
#Default Measures from Base View
  measure: total_length {
    hidden: yes
    type: sum
    sql: ${length} ;;  }
  measure: average_length {
    hidden: yes
    type: average
    sql: ${length} ;;  }
#}

#Hiding/Renaming/Relabeling Dimensions{
  dimension: aeis_id {
    description: "Next90's watermark ID"
    hidden: yes
  }
  dimension: brand_id {
    description: "A unique identifier by Next90 for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: is_removed {
    description: "TRUE if this spot has been removed from trigger"
    hidden: yes
  }
  dimension: isci {
    label: "ISCI"
    description: "Industry Standard Coding Identification, also known as Industry Standard Commercial Identification"
    # hidden: yes
    view_label: "{% parameter view_label_1 %}"
  }
  dimension: kantar_encoding_id {
    hidden: yes
  }
  dimension: length {
    hidden: yes
  }
  dimension: module {
    hidden: yes
  }
  dimension: trigger_id {
    hidden: yes
  }
#}
}