# The name of this view in Looker is "Wwtv Programs"
view: wwtv_programs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.wwtv_programs` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Affiliate" in Explore.

  dimension: affiliate {
    type: string
    sql: ${TABLE}.affiliate ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: air_datetime_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.air_datetime_utc ;;
  }

  dimension: call_sign {
    type: string
    sql: ${TABLE}.call_sign ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
  }

  dimension: daylight_saving {
    type: yesno
    sql: ${TABLE}.daylight_saving ;;
  }

  dimension: descriptions {
    type: string
    sql: ${TABLE}.descriptions ;;
  }

  dimension_group: end_datetime_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_datetime_utc ;;
  }

  dimension: episode_number {
    type: string
    sql: ${TABLE}.episode_number ;;
  }

  dimension: episode_title {
    type: string
    sql: ${TABLE}.episode_title ;;
  }

  dimension: full_station_name {
    type: string
    sql: ${TABLE}.full_station_name ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: gmt_offset {
    type: number
    sql: ${TABLE}.gmt_offset ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_gmt_offset {
    type: sum
    sql: ${gmt_offset} ;;  }
  measure: average_gmt_offset {
    type: average
    sql: ${gmt_offset} ;;  }

  dimension: master_channel_id {
    type: string
    sql: ${TABLE}.master_channel_id ;;
  }

  dimension: monitored_channel_id {
    type: string
    sql: ${TABLE}.monitored_channel_id ;;
  }

  dimension: mpaa_rating {
    type: string
    sql: ${TABLE}.mpaa_rating ;;
  }

  dimension: new_repeat {
    type: string
    sql: ${TABLE}.new_repeat ;;
  }

  dimension_group: orig_airdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.orig_airdate ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: program_id {
    type: number
    sql: ${TABLE}.program_id ;;
  }

  dimension: program_uuid {
    type: string
    sql: ${TABLE}.program_uuid ;;
  }

  dimension: runtime {
    type: string
    sql: ${TABLE}.runtime ;;
  }

  dimension: season_ep_number {
    type: string
    sql: ${TABLE}.season_ep_number ;;
  }

  dimension: season_finale {
    type: yesno
    sql: ${TABLE}.season_finale ;;
  }

  dimension: season_premiere {
    type: yesno
    sql: ${TABLE}.season_premiere ;;
  }

  dimension: series_finale {
    type: yesno
    sql: ${TABLE}.series_finale ;;
  }

  dimension: series_premiere {
    type: yesno
    sql: ${TABLE}.series_premiere ;;
  }

  dimension: show_type {
    type: string
    sql: ${TABLE}.show_type ;;
  }

  dimension: stat_type {
    type: string
    sql: ${TABLE}.stat_type ;;
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  dimension: station_of_origination {
    type: string
    sql: ${TABLE}.station_of_origination ;;
  }

  dimension: syn_type {
    type: string
    sql: ${TABLE}.syn_type ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: tvrating {
    type: string
    sql: ${TABLE}.tvrating ;;
  }
  measure: count {
    type: count
    drill_fields: [full_station_name]
  }
}