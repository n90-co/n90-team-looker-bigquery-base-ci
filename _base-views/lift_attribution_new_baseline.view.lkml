# The name of this view in Looker is "Lift Attribution New Baseline"
view: lift_attribution_new_baseline {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `next90-core-applications.omniData.lift_attribution_new_baseline` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Affiliate" in Explore.

  dimension: affiliate {
    type: string
    sql: ${TABLE}.affiliate ;;
  }

  dimension: baseline_session_count {
    type: number
    sql: ${TABLE}.baseline_session_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_baseline_session_count {
    type: sum
    view_label: "{% parameter view_label_3 %}"
    sql: ${baseline_session_count} ;;  }
  measure: average_baseline_session_count {
    type: average
    view_label: "{% parameter view_label_3 %}"
    sql: ${baseline_session_count} ;;
    value_format: "#,##0.0"}

  dimension: baseline_sessions_per_second {
    type: number
    sql: ${TABLE}.baseline_sessions_per_second ;;
  }

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id ;;
  }

  dimension: callsign {
    type: string
    sql: ${TABLE}.callsign ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: detection_timezone {
    type: string
    sql: ${TABLE}.detection_timezone ;;
  }

  dimension: dma_id {
    type: string
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    type: string
    sql: ${TABLE}.dma_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time ;;
  }

  dimension: event_length {
    type: number
    sql: ${TABLE}.event_length ;;
  }

  dimension: event_lift {
    type: number
    sql: ${TABLE}.event_lift ;;
  }

  measure: total_event_lift {
    type: sum
    view_label: "{% parameter view_label_3 %}"
    sql: ${event_lift} ;;  }
  measure: average_event_lift {
    type: average
    view_label: "{% parameter view_label_3 %}"
    sql: ${event_lift} ;;
    value_format: "#,##0.0"}

  dimension_group: event_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_start_time ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: is_powermoment {
    type: yesno
    sql: ${TABLE}.is_powermoment ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: orig_event_id {
    type: string
    sql: ${TABLE}.orig_event_id ;;
  }

  dimension: page_view_count {
    type: number
    sql: ${TABLE}.page_view_count ;;
  }
  measure: total_page_view_count {
    type: sum
    view_label: "{% parameter view_label_3 %}"
    sql: ${page_view_count} ;;  }

  dimension: percent_lift_increase {
    type: number
    sql: ${TABLE}.percent_lift_increase ;;
  }

  measure: average_lift_increase {
    type: average
    view_label: "{% parameter view_label_3 %}"
    sql: ${TABLE}.percent_lift_increase ;;
    value_format: "0.0\%"
  }

  dimension: program_uuid {
    type: string
    sql: ${TABLE}.program_uuid ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  measure: total_session_count {
    type: sum
    view_label: "{% parameter view_label_3 %}"
    sql: ${session_count} ;;  }
  measure: average_session_count {
    type: average
    view_label: "{% parameter view_label_3 %}"
    sql: ${session_count} ;;
    value_format: "#,##0.0"}

  dimension: sub_trigger_id {
    type: string
    sql: ${TABLE}.sub_trigger_id ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [dma_name]
  }
}