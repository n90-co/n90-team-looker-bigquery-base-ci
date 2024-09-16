# The name of this view in Looker is "Lift Attribution"
view: lift_attribution {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.lift_attribution_no_directv_dish` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Affiliate" in Explore.

  dimension: affiliate {
    type: string
    description: "TV Affiliate where the event aired"
    sql: ${TABLE}.affiliate ;;
  }

  dimension: baseline_session_count {
    type: number
    description: "Count of sessions during the baseline period (5 minutes before ad)"
    sql: ${TABLE}.baseline_session_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_baseline_session_count {
    type: sum
    sql: ${baseline_session_count} ;;  }
  measure: average_baseline_session_count {
    type: average
    sql: ${baseline_session_count} ;;  }

  dimension: baseline_sessions_per_second {
    type: number
    description: "Sessions per second during the baseline period"
    sql: ${TABLE}.baseline_sessions_per_second ;;
  }

  dimension: brand_id {
    type: string
    description: "Advocado Brand ID"
    sql: ${TABLE}.brand_id ;;
  }

  dimension: callsign {
    type: string
    description: "Station Call Sign where the event aired"
    sql: ${TABLE}.callsign ;;
  }

  dimension: detection_timezone {
    type: string
    description: "Timezone of the event"
    sql: ${TABLE}.detection_timezone ;;
  }

  dimension: dma_id {
    type: string
    description: "Advocado Market ID"
    # hidden: yes
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    type: string
    description: "Market Name"
    sql: ${TABLE}.dma_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    description: "End Timestamp of this event"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time ;;
  }

  dimension: event_length {
    type: number
    description: "Length of the event"
    sql: ${TABLE}.event_length ;;
  }

  dimension_group: event_start {
    type: time
    description: "Start time of the event"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_start_time ;;
  }

  dimension: event_type {
    type: string
    description: "Type of event with detection source"
    sql: ${TABLE}.event_type ;;
  }

  dimension: ga_baseline_session_count {
    type: number
    description: "Baseline session count based off of Google Analytics data instead of our tracking tag"
    sql: ${TABLE}.ga_baseline_session_count ;;
  }

  dimension: ga_baseline_sessions_per_second {
    type: number
    description: "Baseline sessions per second based off of Google Analytics data instead of our tracking tag"
    sql: ${TABLE}.ga_baseline_sessions_per_second ;;
  }

  dimension: ga_raw_lift {
    type: number
    description: "Raw lift based off of Google Analytics data instead of our tracking tag"
    sql: ${TABLE}.ga_raw_lift ;;
  }

  dimension: ga_unadjusted_lift {
    type: number
    description: "Unadjusted lift based off of Google Analytics data instead of our tracking tag"
    sql: ${TABLE}.ga_unadjusted_lift ;;
  }

  dimension: ga_weighted_lift {
    type: number
    description: "Weighted lift based off of Google Analytics data instead of our tracking tag"
    sql: ${TABLE}.ga_weighted_lift ;;
  }

  dimension: geo {
    type: string
    description: "Geographic area of the event (zip code, market, …)"
    sql: ${TABLE}.geo ;;
  }

  dimension: hour {
    type: number
    description: "hour partition"
    sql: ${TABLE}.hour ;;
  }

  dimension: is_powermoment {
    type: yesno
    description: "Indicates if an event triggered a campaign automation action"
    sql: ${TABLE}.is_powermoment ;;
  }

  dimension: lead_source {
    type: string
    description: "Calculated source of the attributed sessions. By default, this is populated by the UTM parameter from the referring URL. However, you may create custom lead sources in the Advocado portal by working with your customer success manager."
    sql: ${TABLE}.lead_source ;;
  }

  dimension: orig_event_id {
    type: string
    description: "A unique identifier by Advocado that groups together detections into a single event."
    sql: ${TABLE}.orig_event_id ;;
  }

  dimension: page_view_count {
    type: number
    description: "Number of pageviews attributed to this event"
    sql: ${TABLE}.page_view_count ;;
  }

  dimension: program_uuid {
    type: string
    description: "ID to link to WWTV program data"
    sql: ${TABLE}.program_uuid ;;
  }

  dimension: raw_lift {
    type: number
    description: "Raw increase in pageviews from the expected based on baseline period"
    sql: ${TABLE}.raw_lift ;;
  }

  dimension: session_count {
    type: number
    description: "Number of sessions attributed to this event"
    sql: ${TABLE}.session_count ;;
  }

  dimension: sub_trigger_id {
    type: string
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    sql: ${TABLE}.sub_trigger_id ;;
  }

  dimension: unadjusted_lift {
    type: number
    description: "Raw lift before negatives were removed - before PitStop Release"
    sql: ${TABLE}.unadjusted_lift ;;
  }

  dimension: weighted_lift {
    type: number
    description: "Fraction of lift that can be attributed to this event alone (raw_lift split between overlapping events by relative reach)"
    sql: ${TABLE}.weighted_lift ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [dma_name, dmas.dma_id, dmas.name]
  # }
}
