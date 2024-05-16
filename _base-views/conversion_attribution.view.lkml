# The name of this view in Looker is "Conversion Attribution"
view: conversion_attribution {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.conversion_attribution` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Affiliate" in Explore.

  dimension: affiliate {
    type: string
    description: "Affiliate of the event if applicable"
    sql: ${TABLE}.affiliate ;;
  }

  dimension: brand_id {
    type: string
    description: "Advocado Brand Id"
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension: conversion_count {
    type: number
    description: "Count of attributed conversions"
    sql: ${TABLE}.conversion_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_conversion_count {
    type: sum
    sql: ${conversion_count} ;;  }
  measure: average_conversion_count {
    type: average
    sql: ${conversion_count} ;;  }

  dimension: detection_timezone {
    type: string
    description: "Timezone of the original detection"
    sql: ${TABLE}.detection_timezone ;;
  }

  dimension: dma_id {
    type: string
    description: "Market ID of the event"
    # hidden: yes
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    type: string
    description: "Name of the market"
    sql: ${TABLE}.dma_name ;;
  }

  dimension: event_length {
    type: number
    description: "Length of the event (in seconds)"
    sql: ${TABLE}.event_length ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_start {
    type: time
    description: "Timestamp of the event"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_start_time ;;
  }

  dimension: event_type {
    type: string
    description: "Type of event with detection source"
    sql: ${TABLE}.event_type ;;
  }

  dimension: geo {
    type: string
    description: "Geography of the original event (DMA, Zip Code, …)"
    sql: ${TABLE}.geo ;;
  }

  dimension: goal_id {
    type: string
    description: "Advocado ID of the goal reached for the attributed conversion"
    sql: ${TABLE}.goal_id ;;
  }

  dimension: goal_name {
    type: string
    description: "Name of the goal reached for the attributed conversion"
    sql: ${TABLE}.goal_name ;;
  }

  dimension: hour {
    type: number
    description: "hour partition"
    sql: ${TABLE}.hour ;;
  }

  dimension: lead_source {
    type: string
    description: "Source of the attributed sessions"
    sql: ${TABLE}.lead_source ;;
  }

  dimension: orig_event_id {
    type: string
    description: "A unique identifier by Advocado that groups together detections into a single event."
    sql: ${TABLE}.orig_event_id ;;
  }

  dimension: program_uuid {
    type: string
    description: "ID to link to WWTV program data"
    sql: ${TABLE}.program_uuid ;;
  }

  dimension: sub_trigger_id {
    type: string
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    sql: ${TABLE}.sub_trigger_id ;;
  }
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#   dma_name,
#   goal_name,
#   brands.brand_name,
#   brands.brand_id,
#   dmas.dma_id,
#   dmas.name
#   ]
#   }

}