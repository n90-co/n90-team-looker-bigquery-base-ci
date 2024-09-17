# The name of this view in Looker is "Joined Implicit Attribution"
view: joined_implicit_attribution {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.joined_implicit_attribution` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Activity Session ID" in Explore.

  dimension: activity_session_id {
    type: string
    description: "ID of the session attributed to this event"
    # hidden: yes
    sql: ${TABLE}.activity_session_id ;;
  }

  dimension: affiliate {
    type: string
    description: "Affiliate of the event if applicable"
    sql: ${TABLE}.affiliate ;;
  }

  dimension: area_code {
    type: string
    description: "Estimated phone area code"
    sql: ${TABLE}.area_code ;;
  }

  dimension: brand_id {
    type: string
    description: "Advocado Brand Id"
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension: cid {
    type: string
    description: "Click ID"
    sql: ${TABLE}.cid ;;
  }

  dimension: city {
    type: string
    description: "Estimated City"
    sql: ${TABLE}.city ;;
  }

  dimension: continent {
    type: string
    description: "Estimated Location, Continent"
    sql: ${TABLE}.continent ;;
  }

  dimension: country {
    type: string
    description: "Estimated country"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_code {
    type: string
    description: "Estimated country code"
    sql: ${TABLE}.country_code ;;
  }

  dimension: customer_id {
    type: string
    description: "Google Ads Customer ID (If google click)"
    sql: ${TABLE}.customer_id ;;
  }

  dimension: detection_timezone {
    type: string
    description: "Timezone of the original detection"
    sql: ${TABLE}.detection_timezone ;;
  }

  dimension: device_model {
    type: string
    description: "Device Model (From User Agent)"
    sql: ${TABLE}.device_model ;;
  }

  dimension: device_type {
    type: string
    description: "Device Type (From User Agent)"
    sql: ${TABLE}.device_type ;;
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

  dimension: domain_name {
    type: string
    description: "Domain of this pageview"
    sql: ${TABLE}.domain_name ;;
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

  dimension: fb_pixel_id {
    type: string
    description: "Facebook pixel ID (If installed)"
    sql: ${TABLE}.fb_pixel_id ;;
  }

  dimension: gclid {
    type: string
    description: "Google Click ID"
    sql: ${TABLE}.gclid ;;
  }

  dimension: geo {
    type: string
    description: "Geography of the original event (DMA, Zip Code, …)"
    sql: ${TABLE}.geo ;;
  }

  dimension: hour {
    type: number
    description: "hour partition"
    sql: ${TABLE}.hour ;;
  }

  dimension: hubspotutk {
    type: string
    description: "HubSpot ID"
    sql: ${TABLE}.hubspotutk ;;
  }

  dimension: ip_address {
    type: string
    description: "IP Address"
    sql: ${TABLE}.ip_address ;;
  }

  dimension: ip_connection_type {
    type: string
    description: "Type of Internet Connection (DSL, Fiber, …)"
    sql: ${TABLE}.ip_connection_type ;;
  }

  dimension: ip_dma {
    type: number
    sql: ${TABLE}.ip_dma ;;
  }

  dimension: ip_info_id {
    type: string
    description: "IP information record ID"
    sql: ${TABLE}.ip_info_id ;;
  }

  dimension: ip_line_speed {
    type: string
    description: "Approximate Internet Speed"
    sql: ${TABLE}.ip_line_speed ;;
  }

  dimension: ip_routing_type {
    type: string
    sql: ${TABLE}.ip_routing_type ;;
  }

  dimension: is_powermoment {
    type: yesno
    description: "Indicates if an event triggered a campaign automation action"
    sql: ${TABLE}.is_powermoment ;;
  }

  dimension: lat {
    type: number
    description: "Estimated latitude"
    sql: ${TABLE}.lat ;;
  }

  dimension: lead_source {
    type: string
    description: "Estimated source of this session"
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lon {
    type: number
    description: "Estimated longitude"
    sql: ${TABLE}.lon ;;
  }

  dimension: msa {
    type: number
    description: "Metro-Statistical-Area (US Census Metro ID)"
    sql: ${TABLE}.msa ;;
  }

  dimension: number_of_page_views {
    type: number
    description: "Count of pageviews resulting from this session"
    sql: ${TABLE}.number_of_page_views ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_page_views {
    type: sum
    sql: ${number_of_page_views} ;;  }
  measure: average_number_of_page_views {
    type: average
    sql: ${number_of_page_views} ;;  }

  dimension: orig_event_id {
    type: string
    description: "A unique identifier by Advocado that groups together detections into a single event."
    sql: ${TABLE}.orig_event_id ;;
  }

  dimension: page_title {
    type: string
    description: "Name of the page"
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_view_id {
    type: string
    description: "ID of the pageview attributed to this event"
    sql: ${TABLE}.page_view_id ;;
  }

  dimension_group: page_view_timestamp {
    type: time
    description: "Timestamp of the pageview"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.page_view_timestamp ;;
  }

  dimension: page_view_url {
    type: string
    description: "URL of the pageview"
    sql: ${TABLE}.page_view_url ;;
  }

  dimension_group: partition {
    type: time
    description: "partition timestamp"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.`partition` ;;
  }

  dimension: postal_code {
    type: string
    description: "Estimated postal code"
    sql: ${TABLE}.postal_code ;;
  }

  dimension: program_uuid {
    type: string
    description: "ID to link to WWTV program data"
    sql: ${TABLE}.program_uuid ;;
  }

  dimension: pv_source {
    type: string
    description: "Calculated source of the pageview"
    sql: ${TABLE}.pv_source ;;
  }

  dimension: referrer {
    type: string
    description: "The source url of the pageview"
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    description: "Estimated Region"
    sql: ${TABLE}.region ;;
  }

  dimension_group: session_created {
    type: time
    description: "Session Timestamp"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_created_time ;;
  }

  dimension: state {
    type: string
    description: "Estimated State"
    sql: ${TABLE}.state ;;
  }

  dimension: state_code {
    type: string
    description: "Estimated State Code"
    sql: ${TABLE}.state_code ;;
  }

  dimension: sub_trigger_id {
    type: string
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    sql: ${TABLE}.sub_trigger_id ;;
  }

  dimension: utm_campaign {
    type: string
    description: "Campaign from this pageview"
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    description: "Content from this pageview"
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    description: "Medium from this pageview"
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    description: "Source from this pageview"
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    description: "Term from this pageview"
    sql: ${TABLE}.utm_term ;;
  }
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#   dma_name,
#   domain_name,
#   session_created_time,
#   dmas.dma_id,
#   dmas.name,
#   brands.brand_name,
#   brands.brand_id,
#   activity_sessions.id,
#   activity_sessions.created_time
#   ]
#   }

}
