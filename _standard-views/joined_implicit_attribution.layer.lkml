## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/joined_implicit_attribution.view.lkml"
include: "/_standard-views/ext_schema_change.view.lkml"
include: "/_standard-views/ext_competitor_info.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: +joined_implicit_attribution {
  extends: [ext_partitions,ext_schema_change,ext_competitor_info,ext_dry_label]

# Overriding table name to allow dynamic schema
  sql_table_name: `bigquery-sandbox-393916.{% parameter activity_sessions.demo_schema %}{% parameter activity_sessions.dynamic_schema %}looker.joined_implicit_attribution_no_directv_dish` ;;

#PRIMARY KEY{
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${orig_event_id},${activity_session_id},${page_view_id}) ;;
  }
#}

#FILTERS{
  filter: local_start_date_filter {
    hidden: yes
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
    sql: COALESCE({% date_end local_start_date_filter %}, CURRENT_DATE);;
  }
  filter: local_created_date_filter {
    label: "Local Session Date"
    hidden: yes
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
    sql: COALESCE({% date_end local_created_date_filter %}, CURRENT_DATE);;
  }
#}

  dimension_group: local_start {
    description: "The timestamp in local time when the airing began"
    hidden: yes
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
    # at_timezone(with_timezone(${event_start_raw}, 'UTC'), ${dmas.timezone}) ;;
  }

  dimension_group: local_created {
    description: "Session Timestamp in local time for the first pageview of this session"
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(DATETIME(${session_created_raw}, ${dmas.timezone}));;
    # at_timezone(with_timezone(${session_created_raw}, 'UTC'), ${dmas.timezone}) ;;
  }

#MEASURES{
#DEFAULT CREATED IN BASE VIEWS
  measure: total_number_of_page_views {
    hidden: yes
    type: sum
    sql: ${number_of_page_views} ;;  }
  measure: average_number_of_page_views {
    hidden: yes
    type: average
    sql: ${number_of_page_views} ;;  }
#}

#Hiding/Renaming/Relabeling Dimensions{
  dimension: activity_session_id {
    description: "ID of the session attributed to this event"
    hidden: yes
  }
  dimension: affiliate {
    description: "Affiliate of the event if applicable"
    hidden: yes
  }
  dimension: area_code {
    description: "Estimated phone area code"
    hidden: yes
  }
  dimension: brand_id {
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: cid {
    description: "Click ID"
    hidden: yes
  }
  dimension: city {
    description: "Estimated City"
    hidden: yes
  }
  dimension: continent {
    description: "Estimated Location, Continent"
    hidden: yes
  }
  dimension: country {
    description: "Estimated country"
    hidden: yes
  }
  dimension: country_code {
    description: "Estimated country code"
    hidden: yes
  }
  dimension: customer_id {
    description: "Google Ads Customer ID (If google click)"
    hidden: yes
  }
  dimension: detection_timezone {
    description: "Timezone of the original detection"
    hidden: yes
  }
  dimension: device_model {
    description: "Device Model (From User Agent)"
    hidden: yes
  }
  dimension: device_type {
    description: "Device Type (From User Agent)"
    hidden: yes
  }
  dimension: dma_id {
    description: "Advocado's Market ID"
    hidden: yes
  }
  dimension: dma_name {
    description: "Market Name"
    hidden: yes
  }
  dimension: domain_name {
    description: "Domain of this pageview"
    hidden: yes
  }
  dimension: event_length {
    description: "Length of the event (in seconds)"
    hidden: yes
  }
  dimension_group: event_start {
    description: "Timestamp of the event"
    hidden: yes
  }
  dimension: event_type {
    description: "Type of event with detection source"
    hidden: yes
  }
  dimension: fb_pixel_id {
    description: "Facebook pixel ID (If installed)"
    hidden: yes
  }
  dimension: gclid {
    description: "Google Click ID"
    hidden: yes
  }
  dimension: geo {
    description: "Geography of the original event (DMA, Zip Code, …)"
    hidden: yes
  }
  dimension: hour {
    hidden: yes
  }
  dimension: hubspotutk {
    description: "HubSpot ID"
    hidden: yes
  }
  dimension: ip_address {
    description: "IP Address"
    hidden: yes
  }
  dimension: ip_connection_type {
    description: "Type of Internet Connection (DSL, Fiber, …)"
    hidden: yes
  }
  dimension: ip_dma {
    hidden: yes
  }
  dimension: ip_info_id {
    description: "IP information record ID"
    hidden: yes
  }
  dimension: ip_line_speed {
    description: "Approximate Internet Speed"
    hidden: yes
  }
  dimension: ip_routing_type {
    hidden: yes
  }
  dimension: is_powermoment {
    description: "Indicates if an event triggered a campaign automation action"
    hidden: yes
  }
  dimension: lat {
    description: "Estimated latitude"
    hidden: yes
  }
  dimension: lead_source {
    description: "Estimated source of this session"
    hidden: yes
  }
  dimension: lon {
    description: "Estimated longitude"
    hidden: yes
  }
  dimension: msa {
    description: "Metro-Statistical-Area (US Census Metro ID)"
    hidden: yes
  }
  dimension: number_of_page_views {
    description: "Count of pageviews resulting from this session"
    hidden: yes
  }
  dimension: orig_event_id {
    description: "A unique identifier by Advocado that groups together detections into a single event."
    hidden: yes
  }
  dimension: page_title {
    description: "Name of the page"
    hidden: yes
  }
  dimension: page_view_id {
    description: "ID of the pageview attributed to this event"
    hidden: yes
  }
  dimension_group: page_view_timestamp {
    description: "Timestamp of the pageview"
    hidden: yes
  }
  dimension: page_view_url {
    description: "URL of the pageview"
    hidden: yes
  }
  dimension_group: partition {
    description: "partition timestamp"
    hidden: yes
  }
  dimension: postal_code {
    description: "Estimated postal code"
    hidden: yes
  }
  dimension: program_uuid {
    description: "ID to link to WWTV program data"
    hidden: yes
  }
  dimension: pv_source {
    description: "Calculated source of the pageview"
    hidden: yes
  }
  dimension: referrer {
    description: "The source url of the pageview"
    hidden: yes
  }
  dimension: region {
    description: "Estimated Region"
    hidden: yes
  }
  dimension_group: session_created {
    description: "Session Timestamp"
    hidden: yes
  }
  dimension: state {
    description: "Estimated State"
    hidden: yes
  }
  dimension: state_code {
    description: "Estimated State Code"
    hidden: yes
  }
  dimension: sub_trigger_id {
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    hidden: yes
  }
  dimension: utm_campaign {
    description: "Campaign from this pageview"
    hidden: yes
  }
  dimension: utm_content {
    description: "Content from this pageview"
    hidden: yes
  }
  dimension: utm_medium {
    description: "Medium from this pageview"
    hidden: yes
  }
  dimension: utm_source {
    description: "Source from this pageview"
    hidden: yes
  }
  dimension: utm_term {
    description: "Term from this pageview"
    hidden: yes
  }
#}
}
