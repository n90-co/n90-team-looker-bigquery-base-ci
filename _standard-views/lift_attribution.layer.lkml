## Created by: Mary
## Last edited: 2/27/24 by Mary

include: "/_base-views/lift_attribution.view.lkml"
include: "/_standard-views/ext_schema_change.view.lkml"
include: "/_standard-views/ext_competitor_info.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"
include: "/_standard-views/ext_adv_brand_filter.view.lkml"

view: +lift_attribution {
  extends: [ext_partitions,ext_schema_change,ext_competitor_info,ext_dry_label,ext_adv_brand_filter]

# Overriding table name to allow dynamic schema
  sql_table_name: `bigquery-sandbox-393916.{% parameter lift_attribution.demo_schema %}{% parameter lift_attribution.dynamic_schema %}looker.lift_attribution`;;

#PRIMARY KEY{
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${orig_event_id}, ${geo}, ${lead_source}, ${brand_id}) ;;
  }
#}

#DATE FILTER{
  filter: local_start_date_filter {
    label: "Date Filter in Local Time"
    view_label: "{% parameter view_label_6 %}"
    description: "This is a required filter that is used to specify what time range of data you would like to view. This is based off the local time of where the airing occurred."
    type: date
    suggest_dimension: local_start_date
  }
  dimension: filter_start_date {
    hidden: yes
    type: date
    sql: COALESCE({% date_start local_start_date_filter %}, TIMESTAMP '2022-10-01');;
  }
  dimension: filter_end_date {
    hidden: yes
    type: date
    sql: COALESCE({% date_end local_start_date_filter %}, CURRENT_TIMESTAMP);;
  }
  dimension_group: local_start {
    description: "The local timestamp when the airing began"
    label: "Event Start (in Local)"
    view_label: "{% parameter view_label_6 %}"
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(DATETIME(${event_start_raw}, ${dmas.timezone}));;
    # TIMESTAMP(${event_start_raw}, ${dmas.timezone});;
    # at_timezone(with_timezone(${event_start_raw}, 'UTC'), ${dmas.timezone}) ;;
  }

  dimension: hour_of_day_am_pm {
    label: "Hour of Day AM/PM (in local time)"
    description: "Returns the local hour of the day in 12-hour AM/PM format."
    view_label: "{% parameter view_label_6 %}"
    convert_tz: no
    type: string
    sql: FORMAT_TIMESTAMP('%l %p', DATETIME_TRUNC(CAST(${local_start_raw} AS TIMESTAMP), HOUR)) ;;
    order_by_field: local_start_hour_of_day
  }
#}

#WEEKDAY/WEEKEND{
  dimension: is_weekday {
    type: yesno
    hidden: yes
    sql: ${local_start_day_of_week} in ('Monday','Tuesday','Wednesday','Thursday','Friday') ;;
  }

  dimension: is_weekend {
    type: yesno
    hidden: yes
    sql: ${local_start_day_of_week} in ('Saturday','Sunday') ;;
  }

  dimension: weekday_or_weekend {
    label: "Weekday/Weekend"
    view_label: "{% parameter view_label_6 %}"
    description: "Denotes if the event occurred on a weekday or weekend."
    type: string
    case: {
      when: {
        label: "Weekday"
        sql: ${is_weekday};;
      }
      when: {
        label: "Weekend"
        sql: ${is_weekend};;
      }
      else: "Error"
    }
  }
#}

#Navigation Links{
  dimension: first_party_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::firstparty_micromoment_attribution_dashboard?Brand+Filter={{ _filters['brands.brand_filter'] | url_encode }}&Airing+Type=1st+Party&Date+Filter+in+Local+Time={{_filters['lift_attribution.local_start_date_filter'] | url_encode }}&Customer+Markets={{_filters['market_grouping.customer_markets'] | url_encode }}&Power-Moment+Type={{_filters['lift_attribution.powermoment_type'] | url_encode }}&Spot+Length=&Weekday%2FWeekend={{_filters['lift_attribution.weekday_or_weekend'] | url_encode }}&Day+of+Week={{_filters['lift_attribution.local_start_day_of_week'] | url_encode }}&DMA%20Name%2FMedia%20Type={{_filters['dmas.name'] | url_encode }}" target="_blank" rel="noopener noreferrer">
          <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    sql: "First-Party Attribution Dashboard" ;;
  }

# Remove Competitive Link
  # dimension: comp_dash_button {
  #   hidden: yes
  #   html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::competitive_micromoment_attribution_dashboard?Brand+Filter={{ _filters['brands.brand_filter'] | url_encode }}&Airing+Type=Competitive&Date+Filter+in+Local+Time={{_filters['lift_attribution.local_start_date_filter'] | url_encode }}&Customer+Markets={{_filters['market_grouping.customer_markets'] | url_encode }}&Power-Moment+Type={{_filters['lift_attribution.powermoment_type'] | url_encode }}&Spot+Length=&Weekday%2FWeekend={{_filters['lift_attribution.weekday_or_weekend'] | url_encode }}&Day+of+Week={{_filters['lift_attribution.local_start_day_of_week'] | url_encode }}&DMA%20Name%2FMedia%20Type={{_filters['dmas.name'] | url_encode }}" target="_blank" rel="noopener noreferrer">
  #         <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
  #   sql: "Competitive Attribution Dashboard" ;;
  # }
  dimension: session_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::web_sessions_dashboard?Micro-Moment%20Type={{_filters['lift_attribution.airing_type'] | url_encode }}&Brand+Filter={{ _filters['brands.brand_filter'] | url_encode }}&Date%20Range%20Filter={{_filters['lift_attribution.local_start_date_filter'] | url_encode }}&Customer%20Markets={{_filters['market_grouping.customer_markets'] | url_encode }}&Power-Moment%20Type={{_filters['lift_attribution.powermoment_type'] | url_encode }}&Lead%20Source%20Rank=5&Weekday%2FWeekend={{_filters['lift_attribution.weekday_or_weekend'] | url_encode }}&Day%20of%20Week={{_filters['lift_attribution.local_start_day_of_week'] | url_encode }}&DMA={{_filters['dmas.name'] | url_encode }}" target="_blank" rel="noopener noreferrer">
          <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    sql: "Web Sessions Dashboard" ;;
  }
  dimension: return_to_welcome_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::welcome_to_guac" target="_blank" rel="noopener noreferrer">
      <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    sql: "Return to Welcome Dashboard" ;;
  }
#}

#Welcome Dashboard{
  dimension: welcome_dash_brand_links {
    hidden: yes
    link: {
      label: "First Party Micro-Moment® Attribution Dashboard"
      url: "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::firstparty_micromoment_attribution_dashboard?Brand+Filter={{ value }}&Airing+Type=1st+Party"
    }
    # link: {
    #   label: "Competitive Micro-Moment® Attribution Dashboard"
    #   url: "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::competitive_micromoment_attribution_dashboard?Brand+Filter={{ value }}&Airing+Type=Competitive"
    # }
    link: {
      label: "Web Session Dashboard"
      url: "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::web_sessions_dashboard?Brand+Filter={{ value }}"
    }
    sql: ${brands.brand_name} ;;
  }

  measure: measure {
    hidden: yes
    type: number
    sql: 1 ;;
  }
#}

#Lift numbers that become aggregates{
  #Weighted Lift{
  dimension: weighted_lift {
    label: "Weighted Lift with Negatives"
    description: "This field can be negative in the raw data. Should use 'Weighted Session Lift (lead source level)' under 'Raw Data' at lead-source level reporting because the negative has been zeroed out. Fraction of lift that can be attributed to this event alone (raw_lift split between overlapping events by relative reach)"
    required_access_grants: [n90_emp]
    view_label: "{% parameter view_label_7 %}"
    #This field can be negative in the raw data. Should use weighted_session_lift below at lead-source level reporting because the negative has been zeroed out.
    # hidden: yes
  }

  # REMOVED because we want to zero weighted_lift AFTER we SUM all lead sources to make the raw_lift/weighted_lift for the spot.
  # dimension: is_weighted_lift {
  #   hidden: yes
  #   type: yesno
  #   sql: ${weighted_lift} >=0 ;;
  # }

  dimension: weighted_session_lift {
    label: "Weighted Session Lift (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. Fraction of lift that can be attributed to this event alone (raw_lift split between overlapping airings)"
    # hidden: yes
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
    type: number
    # value_format: "0.#"
    # removed ^^ so that raw report will include all decimals
    sql: if(${TABLE}.weighted_lift<0, 0, ${weighted_lift}) ;;
  }

  measure: event_weighted_lift{
    label: "Weighted Session Lift (Spot-Centric)"
    hidden: yes
    type: sum
    # filters: [is_weighted_lift: "Yes"] -- REMOVED because we want to zero weighted_lift AFTER we SUM all lead sources to make the raw_lift/weighted_lift for the spot.
    sql: ${weighted_lift} ;;
  }

  measure: total_weighted_session_lift {
    description: "The incremental increase in sessions that occurred during the Micro-Moment. Sessions are split with equal weight in the occurrence of overlapping sessions"
    # hidden: yes
    view_label: "{% parameter view_label_3 %}"
    type: sum
    # filters: [is_weighted_lift: "Yes"] -- REMOVED because we want to zero weighted_lift AFTER we SUM all lead sources to make the raw_lift/weighted_lift for the spot.
    sql: ${ndt_orig_event_aggregates.event_weighted_lift} ;;
    value_format: "#,##0.0"
  }
  #}

  #Percent Lift{
  dimension: percent_lift {
    label: "Percent Lift  (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. The percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
    # hidden: yes
    type: number
    value_format: "0.0\%"
    sql: if(${baseline_sessions_per_second}>0,${weighted_session_lift}/(${baseline_sessions_per_second}*(300+${event_length}))*100,${weighted_session_lift}*100);;
  }

  dimension: event_percent_lift {
    label: "Percent Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    value_format: "0.0\%"
    sql: if(${ndt_orig_event_aggregates.event_baseline_sessions_per_second}>0,${ndt_orig_event_aggregates.event_weighted_lift}/(${ndt_orig_event_aggregates.event_baseline_sessions_per_second}*(300+${event_length}))*100,${ndt_orig_event_aggregates.event_weighted_lift}*100);;
  }

  measure: average_percent_lift_per_detection{
    view_label: "{% parameter view_label_3 %}"
    description: "The average percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
    type: average
    sql: ${event_percent_lift} ;;
    value_format: "0.0\%"
  }
  #}

  #Baseline Counts/Rates{
  dimension: baseline_session_count {
    # hidden: yes
    label: "Baseline Session Count (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. Count of sessions during the baseline period (5 minutes before ad)"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
  }

  measure: event_baseline_session_count{
    description: "The total number of web sessions initiated on the website in the 5 minutes before an airing event across all lead sources."
    hidden: yes
    type: sum
    value_format: "#,##0"
    sql: ${baseline_session_count} ;;
  }

  dimension: baseline_sessions_per_second {
    # hidden: yes
    label: "Baseline Sessions per Second (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. This is calculated by taking the baseline session count and dividing by 300 (or 5 minutes). This rate is then used to calculate a baseline that is representative of the total micro-moment length, which may differ by event depending on event length."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
  }

  measure: event_baseline_sessions_per_second {
    description: "Baseline sessions per second by detection. This is calculated by taking the baseline session count and dividing by 300 (or 5 minutes). This rate is then used to calculate a baseline that is representative of the total micro-moment length, which may differ by event depending on event length."
    hidden: yes
    type: sum
    sql: ${baseline_sessions_per_second} ;;
    value_format: "0.####"
  }

  #Session Counts{
  dimension: session_count {
    # hidden: yes
    label: "Session Count (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. Number of sessions attributed to this event"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
  }

  measure: event_session_count{
    description: "The total number of web sessions initiated on the website in the 5 minutes before an airing event across all lead sources."
    hidden: yes
    type: sum
    value_format: "#,##0"
    sql: ${session_count} ;;
  }
  #}

  #Raw Lift{
  dimension: raw_lift {
    label: "Raw Lift with Negatives"
    description: "This field can be negative in the raw data. Should use 'Raw Lift (lead source level)' under 'Raw Data' at lead-source level reporting because the negative has been zeroed out. Fraction of lift that can be attributed to this event alone (raw_lift split between overlapping events by relative reach)"
    # hidden: yes
    required_access_grants: [n90_emp]
    view_label: "{% parameter view_label_7 %}"
  }

  dimension: corrected_raw_lift {
    label: "Raw Lift (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. Raw increase in sessions from the projected baseline"
    # hidden: yes
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
    type: number
    sql: if(${TABLE}.raw_lift<0, 0, ${raw_lift}) ;;
  }

  measure: event_raw_lift{
    label: "Raw Lift (Spot-Centric)"
    hidden: yes
    type: sum
    sql: ${raw_lift} ;;
  }

  # measure: total_raw_lift {
  #   description: "Total raw increase in sessions from the projected baseline"
  #   # hidden: yes
  #   view_label: "{% parameter view_label_3 %}"
  #   type: sum
  #   sql: ${ndt_orig_event_aggregates.event_raw_lift} ;;
  #   value_format: "#,##0.0"
  # }
  #}

  #}

  #Other MEASURES{
  measure: count_detections {
    label: "Number of Detections"
    view_label: "{% parameter view_label_3 %}"
    description: "The number of times the Advocado system received and recorded a signal that your watermarked commercial is airing on a specific TV station"
    type: count_distinct
    value_format: "#,##0"
    # sql: ${orig_event_id} ;;
    sql: CASE
          WHEN (${dma_name} = 'DIRECTV') THEN ''
          WHEN (${dma_name} = 'DISH') THEN ''
          WHEN (${affiliate} = 'ION' and ${dma_id} IS NOT NULL) THEN ''
          ELSE ${orig_event_id}
       END ;;

  }

  measure: event_page_view_count {
    hidden: yes
    type: sum
    value_format: "#,##0"
    sql: ${page_view_count} ;;
  }
  #}
#}

#Created Dimensions{
  filter: include_post_log_attribution {
    label: "Post Log Filter"
    description: "Filter to include/not include post-log data"
    view_label: "{% parameter view_label_1 %}"
    type: string
    sql: {% condition include_post_log_attribution %} ${include_post_log} {% endcondition %} ;;
    suggest_dimension: include_post_log
    }

  dimension: include_post_log {
    hidden: yes
    type: string
    sql: CASE ${event_type}
          WHEN 'airing' THEN 'watermark only'
          WHEN 'ota_postlog_airing' THEN 'post log only'
         END;;
  }

  dimension: updated_affiliate {
    label: "Affiliate"
    description: "Affiliate where the event aired"
    # hidden: yes
    view_label: "{% parameter view_label_1 %}"
    sql: CASE WHEN ${affiliate} = 'IND' THEN CONCAT(${affiliate},' (',${callsign},')')
              ELSE ${affiliate}
              END  ;;
  }

  dimension: spot_length {
    type: string
    hidden: yes
    sql: CONCAT(${event_length},"") ;;
    # This dimension was created so that event_length could be turned into a string so it could be a filter. Number dimension filters are weird.
    view_label: "{% parameter view_label_1 %}"
    description: "Length of the event"
  }

  dimension: airing_type {
    description: "Denotes if airing was a 1st party or competitive ad"
    view_label: "{% parameter view_label_1 %}"
    type: string
    case: {
      when: {
        label: "1st Party"
        sql: ${event_type} in ('airing','ota_postlog_airing') ;;
      }
      when: {
        label: "Competitive"
        sql: ${event_type} in ('acr_airing') ;;
      }
    }
    suggestions: ["1st Party","Competitive"]
  }

  dimension: powermoment_type {
    label: "Power-Moment Type"
    description: "Indicates whether the airing was boosted(Power-Moment) or unboosted"
    view_label: "{% parameter view_label_1 %}"
    case: {
      when: {
        sql: ${is_powermoment} ;;
        label: "Power-Moment"
      }
      else: "Unboosted Micro-Moment"
    }
  }

  dimension: day_part{
    description: "A broadcast time period or segment."
    view_label: "{% parameter view_label_6 %}"
    type: string
    drill_fields: [local_start_hour_of_day,hour_of_day_am_pm]
    case: {
      when: {
        label: "Late Fringe (12am-1am)"
        sql: ${local_start_hour_of_day} in (0) ;;
      }
      when: {
        label: "Post Late Fringe (1am-2am)"
        sql: ${local_start_hour_of_day} in (1) ;;
      }
      when: {
        label: "Overnight (2am-6am)"
        sql: ${local_start_hour_of_day} in (2,3,4,5) ;;
      }
      when: {
        label: "Early Morning (6am-10am)"
        sql: ${local_start_hour_of_day} in (6,7,8,9) ;;
      }
      when: {
        label: "Daytime (10am-5pm)"
        sql: ${local_start_hour_of_day} in (10,11,12,13,14,15,16) ;;
      }
      when: {
        label: "Early Fringe (5pm-7pm)"
        sql: ${local_start_hour_of_day} in (17,18) ;;
      }
      when: {
        label: "Prime Access (7pm-8pm)"
        sql: ${local_start_hour_of_day} in (19) ;;
      }
      when: {
        label: "Prime Time (8pm-11pm)"
        sql: ${local_start_hour_of_day} in (20,21,22) ;;
      }
      when: {
        label: "Late News (11pm-12am)"
        sql: ${local_start_hour_of_day} in (23) ;;
      }
      else: "Error"
    }
  }

#}

#HIDING DEFAULT MEASURES FROM BASE VIEW
  measure: total_baseline_session_count {
    hidden: yes
    type: sum
    sql: ${baseline_session_count} ;;  }
  measure: average_baseline_session_count {
    hidden: yes
    type: average
    sql: ${baseline_session_count} ;;  }
#}


#Hiding/Renaming/Relabeling Dimensions{
  dimension: affiliate {
    description: "TV Affiliate where the event aired"
    hidden: yes
    view_label: "{% parameter view_label_1 %}"
  }
  dimension: brand_id {
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: callsign {
    description: "Station Call Sign where the event aired"
    # hidden: yes
    view_label: "{% parameter view_label_1 %}"
  }
  dimension: detection_timezone {
    description: "Timezone of the event"
    hidden: yes
    view_label: "{% parameter view_label_2 %}"
  }
  dimension: dma_id {
    description: "Advocado's Market ID"
    hidden: yes
  }
  dimension: dma_name {
    description: "Market Name"
    hidden: yes
  }
  dimension_group: end {
    description: "End Timestamp of this event"
    hidden: yes
  }
  dimension: event_length {
    description: "Length of the event in seconds"
    # hidden: yes
    label: "Ad Length"
    view_label: "{% parameter view_label_1 %}"
  }
  dimension_group: event_start {
    description: "Start time of the event"
    # hidden: yes
    label: "Event Start (in UTC)"
    view_label: "{% parameter view_label_6 %}"
  }
  dimension: event_type {
    description: "Type of event with detection source"
    hidden: yes
  }
  dimension: ga_baseline_session_count {
    description: "Baseline session count based off of Google Analytics data instead of our tracking tag"
    hidden: yes
  }
  dimension: ga_baseline_sessions_per_second {
    description: "Baseline sessions per second based off of Google Analytics data instead of our tracking tag"
    hidden: yes
  }
  dimension: ga_raw_lift {
    description: "Raw lift based off of Google Analytics data instead of our tracking tag"
    hidden: yes
  }
  dimension: ga_unadjusted_lift {
    description: "Unadjusted lift based off of Google Analytics data instead of our tracking tag"
    hidden: yes
  }
  dimension: ga_weighted_lift {
    description: "Weighted lift based off of Google Analytics data instead of our tracking tag"
    hidden: yes
  }
  dimension: geo {
    description: "Geographic area of the event (zip code, market, …)"
    # hidden: yes
    label: "Geographic Location"
    view_label: "{% parameter view_label_2 %}"
  }
  dimension: hour {
    hidden: yes
  }
  dimension: is_powermoment {
    description: "Indicates if an event triggered a campaign automation action"
    hidden: yes
  }
  dimension: lead_source {
    description: "Calculated source of the attributed sessions. By default, this is populated by the UTM parameter from the referring URL. However, you may create custom lead sources in the Advocado portal by working with your customer success manager."
    # hidden: yes
    view_label: "{% parameter view_label_5 %}"
  }
  dimension: orig_event_id {
    description: "A unique identifier by Advocado that groups together detections into a single event."
    # hidden: yes
    label: "Event ID"
    view_label: "{% parameter view_label_5 %}"
  }
  dimension: page_view_count {
    # hidden: yes
    label: "Number of Page Views (lead source level)"
    description: "Use ONLY for lead-source level raw data reports. Number of pageviews attributed to this event."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Lead Source Level Data"
  }
  dimension: program_uuid {
    description: "ID to link to WWTV program data"
    hidden: yes
  }
  dimension: sub_trigger_id {
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    hidden: yes
  }
  dimension: unadjusted_lift {
    description: "Raw lift before negatives were removed - before PitStop Release"
    hidden: yes
  }
#}

}
