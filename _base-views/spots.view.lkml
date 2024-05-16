# The name of this view in Looker is "Spots"
view: spots {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.spots` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Aeis ID" in Explore.

  dimension: aeis_id {
    type: string
    description: "Advocado ID"
    sql: ${TABLE}.aeis_id ;;
  }

  dimension: brand_id {
    type: string
    description: "Advocado ID"
    sql: ${TABLE}.brand_id ;;
  }

  dimension: creative_name {
    type: string
    description: "Creative name if updated in Advocado portal, otherwise will default to ISCI"
    sql: ${TABLE}.creative_name ;;
  }

  dimension: is_removed {
    type: yesno
    description: "TRUE if this spot has been removed from trigger"
    sql: ${TABLE}.is_removed ;;
  }

  dimension: isci {
    type: string
    description: "ISCI"
    sql: ${TABLE}.isci ;;
  }

  dimension: kantar_encoding_id {
    type: string
    description: "Advocado ID"
    sql: ${TABLE}.kantar_encoding_id ;;
  }

  dimension: length {
    type: number
    description: "length of ad"
    sql: ${TABLE}.length ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_length {
    type: sum
    sql: ${length} ;;  }
  measure: average_length {
    type: average
    sql: ${length} ;;  }

  dimension: module {
    type: string
    sql: ${TABLE}.module ;;
  }

  dimension: trigger_id {
    type: string
    description: "Advocado ID"
    sql: ${TABLE}.trigger_id ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [creative_name]
  # }
}