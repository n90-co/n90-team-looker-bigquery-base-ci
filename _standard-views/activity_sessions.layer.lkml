## Created by: Mary
## Last edited: 2/15/24 by Mary

include: "/_base-views/activity_sessions.view.lkml"
include: "/_standard-views/ext_schema_change.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"
include: "/_standard-views/ext_adv_brand_filter.view.lkml"

view: +activity_sessions {
  extends: [ext_partitions,ext_schema_change,ext_dry_label,ext_adv_brand_filter]

  sql_table_name: `bigquery-sandbox-393916.{% parameter activity_sessions.demo_schema %}{% parameter activity_sessions.dynamic_schema %}looker.activity_sessions` ;;

#FILTERS{
  filter: local_created_date_filter {
    label: "Date Range Filter"
    description: "This is a required filter that is used to specify what time range of data you would like to view. This is based off the local time of where the session was initiated."
    view_label: "{% parameter view_label_4 %}"
    type: date
    suggest_dimension: local_created_date
  }
  dimension: filter_session_start_date {
    hidden: yes
    type: date
    sql: COALESCE({% date_start local_created_date_filter %}, TIMESTAMP '2022-10-01');;
  }
  dimension: filter_session_end_date {
    hidden: yes
    type: date
    sql: COALESCE({% date_end local_created_date_filter %}, CURRENT_TIMESTAMP);;
  }
#}

  dimension_group: local_created {
    label: "Session Created (in Local)"
    description: "Session timestamp from first page view of this session. This is based off the local time of where the session was initiated."
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
    sql: TIMESTAMP(DATETIME(${created_raw}, ${dmas.timezone}));;
    # at_timezone(with_timezone(${created_raw}, 'UTC'), ${dmas.timezone}) ;;
  }

  dimension: hour_of_day_am_pm {
    label: "Hour of Day AM/PM (in local time)"
    description: "Returns the local hour of the day in 12-hour AM/PM format."
    view_label: "{% parameter view_label_6 %}"
    convert_tz: no
    type: string
    sql: FORMAT_TIMESTAMP('%l %p', DATETIME_TRUNC(CAST(${local_created_raw} AS TIMESTAMP), HOUR)) ;;
    order_by_field: local_created_hour_of_day
  }

#Navigation Links{
  dimension: sess_to_first_party_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::firstparty_micromoment_attribution_dashboard?Brand+Filter={{ _filters['brands.brand_filter'] | url_encode }}&Airing+Type=1st+Party&Date+Filter+in+Local+Time={{_filters['activity_sessions.local_created_date_filter'] | url_encode }}&Customer+Markets={{_filters['market_grouping.customer_markets'] | url_encode }}&Power-Moment+Type={{_filters['activity_sessions.powermoment_type'] | url_encode }}&Spot+Length=&Weekday%2FWeekend={{_filters['activity_sessions.weekday_or_weekend'] | url_encode }}&Day+of+Week={{_filters['activity_sessions.local_created_day_of_week'] | url_encode }}&DMA%20Name%2FMedia%20Type={{_filters['dmas.name'] | url_encode }}" target="_blank" rel="noopener noreferrer">
      <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    # <img src="" title="{{value}}" /></a>;;
    sql: "First-Party Attribution Dashboard" ;;
  }
  dimension: sess_to_comp_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::competitive_micromoment_attribution_dashboard?Brand+Filter={{ _filters['brands.brand_filter'] | url_encode }}&Airing+Type=Competitive&Date+Filter+in+Local+Time={{_filters['activity_sessions.local_created_date_filter'] | url_encode }}&Customer+Markets={{_filters['market_grouping.customer_markets'] | url_encode }}&Power-Moment+Type={{_filters['activity_sessions.powermoment_type'] | url_encode }}&Spot+Length=&Weekday%2FWeekend={{_filters['activity_sessions.weekday_or_weekend'] | url_encode }}&Day+of+Week={{_filters['activity_sessions.local_created_day_of_week'] | url_encode }}&DMA%20Name%2FMedia%20Type={{_filters['dmas.name'] | url_encode }}" target="_blank" rel="noopener noreferrer">
      <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    sql: "Competitive Attribution Dashboard" ;;
  }
  dimension: return_to_welcome_dash_button {
    hidden: yes
    html: <a href= "https://{{_user_attributes['instance']}}.cloud.looker.com/dashboards/bigquery_dashboards::welcome_to_guac" target="_blank" rel="noopener noreferrer">
      <button style="background-color:#787878; border:none; color:white; border-radius:4px">{{value}}</button></a>;;
    sql: "Return to Welcome Dashboard" ;;
  }
#}

#WEEKDAY/WEEKEND{
  dimension: is_weekday {
    type: yesno
    hidden: yes
    sql: ${local_created_day_of_week} in ('Monday','Tuesday','Wednesday','Thursday','Friday') ;;
  }

  dimension: is_weekend {
    type: yesno
    hidden: yes
    sql: ${local_created_day_of_week} in ('Saturday','Sunday') ;;
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

#DIMENSIONS{
  dimension: micromoment_type{
    label: "Micro-Moment Type"
    view_label: "{% parameter view_label_4 %}"
    description: "Indicates if this session happened in a 1st party Micro-Moment, a competitive Micro-Moment, or outside of any tv occurrence(Non-Micro-Moment)."
    case: {
      when: {
        label: "1st Party"
        sql: ${joined_implicit_attribution.event_type} in ('airing','ota_postlog_airing') ;;
      }
      when: {
        label: "Competitive"
        sql: ${joined_implicit_attribution.event_type} in ('acr_airing') ;;
      }
      else: "Non-Micro-Moment"
    }
  }

  dimension: powermoment_type {
    label: "Power-Moment Type"
    view_label: "{% parameter view_label_4 %}"
    description: "Indicates whether the airing was boosted(Power-Moment) or unboosted"
    case: {
      when: {
        sql: ${joined_implicit_attribution.is_powermoment} ;;
        label: "Power-Moment"
      }
      else: "Unboosted Micro-Moment"
    }
  }

  dimension: lat_lon_location {
    hidden: yes
    type: location
    sql_latitude:${lat} ;;
    sql_longitude:${lon} ;;
  }
#}

#MEASURES {
  measure: session_count{
    label: "Number of Sessions"
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the total number of sessions that occurred"
    type: count_distinct
    sql: ${id} ;;
    value_format: "#,##0"
  }

  measure: percent_of_total_sessions{
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the percentage of all the sessions that occurred"
    type: percent_of_total
    sql: ${session_count};;
    value_format: "0.0\%"
  }

  measure: number_of_pageviews{
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the total number of pageviews from sessions that occurred"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${num_pvs} ;;
    value_format: "#,##0"
  }

  measure: first_party_session_count{
    label: "Number of First-Party Micro-Moment Sessions"
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the total number of first-party micro-moment sessions that occurred"
    type: count_distinct
    filters: [micromoment_type: "1st Party"]
    sql: ${id} ;;
    value_format: "#,##0"
  }

  measure: competitive_session_count{
    label: "Number of Competitive Micro-Moment Sessions"
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the total number of competitive micro-moment sessions that occurred"
    type: count_distinct
    filters: [micromoment_type: "Competitive"]
    sql: ${id} ;;
    value_format: "#,##0"
  }

  measure: non_mm_session_count{
    label: "Number of Non-Micro-Moment Sessions"
    view_label: "{% parameter view_label_3 %}"
    description: "Calculates the total number of sessions not linked to any type of micro-moment"
    type: count_distinct
    filters: [micromoment_type: "Non-Micro-Moment"]
    sql: ${id} ;;
    value_format: "#,##0"
  }
#}

#Hiding/Renaming/Relabeling Dimensions{
  dimension: id {
    label: "Session ID"
    view_label: "{% parameter view_label_5 %}"
    description: "Advocado's session ID. This session ID is attached to pageviews that fall within a rolling 30 minute window from the same IP address."
    # hidden: yes
  }
  dimension: brand_id {
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: calculated_source {
    label: "Lead Source"
    view_label: "{% parameter view_label_4 %}"
    description: "The calculated source Advocado determined the Session originated from"
    # hidden: yes
  }
  dimension_group: created {
    label: "Session Created (in UTC)"
    view_label: "{% parameter view_label_6 %}"
    description: "Session timestamp in UTC from the first pageview of this session"
    # hidden: yes
  }
  dimension: device_model {
    description: "Device Model as reported by the User Agent"
    hidden: yes
  }
  dimension: device_type {
    description: "Device Type as reported by the User Agent"
    hidden: yes
  }
  dimension: domain {
    view_label: "{% parameter view_label_4 %}"
    description: "Domain for the first pageview of this session"
    # hidden: yes
  }
  dimension: fb_ad_id {
    description: "Facebook Ad ID"
    hidden: yes
  }
  dimension: fb_ad_set_id {
    description: "Facebook Ad Set ID"
    hidden: yes
  }
  dimension: fb_campaign_id {
    description: "Facebook Campaign ID"
    hidden: yes
  }
  dimension: gclid {
    description: "Google Click ID"
    hidden: yes
  }
  dimension: hour {
    hidden: yes
  }
  dimension: is_bot {
    description: "Marked true if this session came from a suspected bot"
    hidden: yes
  }
  dimension: lat {
    view_label: "{% parameter view_label_2 %}"
    label: "Latitude"
    description: "Latitude reported by our GeoIP Provider"
    hidden: yes
  }
  dimension: lon {
    view_label: "{% parameter view_label_2 %}"
    label: "Longitude"
    description: "Longitude reported by our GeoIP Provider"
    hidden: yes
  }
  dimension: neustar_country {
    label: "Country"
    view_label: "{% parameter view_label_2 %}"
    description: "Country reported by our GeoIP Provider"
    hidden: yes
  }
  dimension: neustar_dma_id {
    description: "Neustar's Market ID"
    # hidden: yes
  }
  dimension: neustar_state {
    label: "State Abbreviation"
    view_label: "{% parameter view_label_2 %}"
    description: "Abbreviation for the state where session was initiated reported by our GeoIP Provider"
    # hidden: yes
  }
  dimension: num_pvs {
    description: "Count of pageviews generated during the session"
    hidden: yes
  }
  dimension: session_id {
    hidden: yes
  }
  dimension: snap_ad_id {
    description: "Snapchat Ad ID"
    hidden: yes
  }
  dimension: snap_ad_squad_id {
    description: "Snapchat Ad Squad (Ad Group) ID"
    hidden: yes
  }
  dimension: snap_campaign_id {
    description: "Snapchat Campaign ID"
    hidden: yes
  }
  dimension: tw_campaign_id {
    description: "Twitter Campaign ID"
    hidden: yes
  }
  dimension: tw_line_item_id {
    description: "Twitter Line Item (Ad) ID"
    hidden: yes
  }
  dimension: url {
    label: "URL"
    view_label: "{% parameter view_label_5 %}"
    description: "URL from the first pageview of this session"
    # hidden: yes
  }
  dimension: uuid {
    description: "A unique ID generated by this user’s browser.  This stays the same across sessions unless browsing data is cleared"
    hidden: yes
  }
  dimension: zip_code {
    view_label: "{% parameter view_label_2 %}"
    description: "Zip Code where session was initiated reported by our GeoIP Provider"
    # hidden: yes

  }
#}

}
