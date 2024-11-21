# The name of this view in Looker is "Kinetiq Occurrences"
view: kinetiq_occurrences {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `next90-core-applications.omniData.kinetiq_occurrences` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Adjusted Broadcast Media Value" in Explore.

  dimension: adjusted_broadcast_media_value {
    type: number
    sql: ${TABLE}.adjusted_broadcast_media_value ;;
  }

  dimension: adjusted_media_value {
    type: number
    sql: ${TABLE}.adjusted_media_value ;;
  }

  dimension: affiliate {
    type: string
    sql: ${TABLE}.affiliate ;;
  }

  dimension: affiliate_category {
    type: string
    sql: ${TABLE}.affiliate_category ;;
  }

  dimension: airing_type {
    type: string
    sql: ${TABLE}.airing_type ;;
  }

  dimension: as_run_url {
    type: string
    sql: ${TABLE}.as_run_url ;;
  }

  dimension: audience {
    type: number
    sql: ${TABLE}.audience ;;
  }

  dimension: audience_hh {
    type: number
    sql: ${TABLE}.audience_hh ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id ;;
  }

  dimension: broadcast_media_value {
    type: number
    sql: ${TABLE}.broadcast_media_value ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_id {
    type: string
    sql: ${TABLE}.category_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_time_utc ;;
  }

  dimension_group: creative_changed_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creative_changed_time_utc ;;
  }

  dimension_group: creative_created_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creative_created_time_utc ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: creative_resource_id {
    type: string
    sql: ${TABLE}.creative_resource_id ;;
  }

  dimension: creative_start_offset {
    type: string
    sql: ${TABLE}.creative_start_offset ;;
  }

  dimension: creative_start_offset_ticks {
    type: number
    sql: ${TABLE}.creative_start_offset_ticks ;;
  }

  dimension: creative_stop_offset {
    type: string
    sql: ${TABLE}.creative_stop_offset ;;
  }

  dimension: creative_stop_offset_ticks {
    type: number
    sql: ${TABLE}.creative_stop_offset_ticks ;;
  }

  dimension: day_of_week_local {
    type: string
    sql: ${TABLE}.day_of_week_local ;;
  }

  dimension: day_of_week_local_numeric {
    type: number
    sql: ${TABLE}.day_of_week_local_numeric ;;
  }

  dimension: day_of_week_utc {
    type: string
    sql: ${TABLE}.day_of_week_utc ;;
  }

  dimension: day_of_week_utc_numeric {
    type: number
    sql: ${TABLE}.day_of_week_utc_numeric ;;
  }

  dimension: day_part {
    type: string
    sql: ${TABLE}.day_part ;;
  }

  dimension: distinct_markets {
    type: number
    sql: ${TABLE}.distinct_markets ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration {
    type: sum
    sql: ${duration} ;;  }
  measure: average_duration {
    type: average
    sql: ${duration} ;;  }

  dimension_group: end_time_local {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time_local ;;
  }

  dimension_group: end_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time_utc ;;
  }

  dimension: external_as_run_url {
    type: string
    sql: ${TABLE}.external_as_run_url ;;
  }

  dimension: first_occurrence {
    type: yesno
    sql: ${TABLE}.first_occurrence ;;
  }

  dimension: iqcc_key {
    type: string
    sql: ${TABLE}.iqcc_key ;;
  }

  dimension: is_full_hit {
    type: string
    sql: ${TABLE}.is_full_hit ;;
  }

  dimension: is_national {
    type: yesno
    sql: ${TABLE}.is_national ;;
  }

  dimension: is_promo {
    type: yesno
    sql: ${TABLE}.is_promo ;;
  }

  dimension: is_syndicated {
    type: yesno
    sql: ${TABLE}.is_syndicated ;;
  }

  dimension: is_visible {
    type: yesno
    sql: ${TABLE}.is_visible ;;
  }

  dimension: kiq_brand_id {
    type: string
    sql: ${TABLE}.kiq_brand_id ;;
  }

  dimension: kiq_category_id {
    type: string
    sql: ${TABLE}.kiq_category_id ;;
  }

  dimension: kiq_product_id {
    type: string
    sql: ${TABLE}.kiq_product_id ;;
  }

  dimension: kiq_subcategory_id {
    type: string
    sql: ${TABLE}.kiq_subcategory_id ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: market_id {
    type: number
    sql: ${TABLE}.market_id ;;
  }

  dimension: master_channel_id {
    type: string
    sql: ${TABLE}.master_channel_id ;;
  }

  dimension: media_value {
    type: number
    sql: ${TABLE}.media_value ;;
  }

  dimension_group: modified_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modified_time_utc ;;
  }

  dimension: parent_company {
    type: string
    sql: ${TABLE}.parent_company ;;
  }

  dimension: parent_company_id {
    type: number
    sql: ${TABLE}.parent_company_id ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: program_category {
    type: string
    sql: ${TABLE}.program_category ;;
  }

  dimension: program_description {
    type: string
    sql: ${TABLE}.program_description ;;
  }

  dimension: program_id {
    type: string
    sql: ${TABLE}.program_id ;;
  }

  dimension: program_title {
    type: string
    sql: ${TABLE}.program_title ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }

  dimension: retailer {
    type: string
    sql: ${TABLE}.retailer ;;
  }

  dimension: retailer_url {
    type: string
    sql: ${TABLE}.retailer_url ;;
  }

  dimension: start_point {
    type: number
    sql: ${TABLE}.start_point ;;
  }

  dimension_group: start_time_local {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time_local ;;
  }

  dimension_group: start_time_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time_utc ;;
  }

  dimension: station {
    type: string
    sql: ${TABLE}.station ;;
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}.station_id ;;
  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.station_name ;;
  }

  dimension: station_resource_id {
    type: string
    sql: ${TABLE}.station_resource_id ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: subcategory_id {
    type: string
    sql: ${TABLE}.subcategory_id ;;
  }

  dimension: thumbnail_url {
    type: string
    sql: ${TABLE}.thumbnail_url ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: universe {
    type: number
    sql: ${TABLE}.universe ;;
  }

  dimension: video_url {
    type: string
    sql: ${TABLE}.video_url ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [id, station_name]
  # }
}