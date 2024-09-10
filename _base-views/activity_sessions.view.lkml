# The name of this view in Looker is "Activity Sessions"
view: activity_sessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.activity_sessions` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    description: "Advocado's session ID. This session ID is attached to pageviews that fall within a rolling 30 minute window from the same IP address."
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand ID" in Explore.

  dimension: brand_id {
    type: string
    description: "Advocado Brand ID"
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension: calculated_source {
    type: string
    description: "The source Advocado determined the Session originated from"
    sql: ${TABLE}.calculated_source ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    description: "Session timestamp for the first pageview for this session"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_time ;;
  }

  dimension: device_model {
    type: string
    description: "Device Model as reported by the User Agent"
    sql: ${TABLE}.device_model ;;
  }

  dimension: device_type {
    type: string
    description: "Device Type as reported by the User Agent"
    sql: ${TABLE}.device_type ;;
  }

  dimension: domain {
    type: string
    description: "Domain for the first pageview for this session"
    sql: ${TABLE}.domain ;;
  }

  dimension: fb_ad_id {
    type: string
    description: "Facebook Ad ID"
    sql: ${TABLE}.fb_ad_id ;;
  }

  dimension: fb_ad_set_id {
    type: string
    description: "Facebook Ad Set ID"
    sql: ${TABLE}.fb_ad_set_id ;;
  }

  dimension: fb_campaign_id {
    type: string
    description: "Facebook Campaign ID"
    sql: ${TABLE}.fbCampaignId ;;
  }

  dimension: gclid {
    type: string
    description: "Google Click ID"
    sql: ${TABLE}.gclid ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: is_bot {
    type: yesno
    description: "Marked true if this session came from a suspected bot"
    sql: ${TABLE}.is_bot ;;
  }

  dimension: lat {
    type: number
    description: "Latitude reported by our GeoIP Provider"
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    description: "Longitude reported by our GeoIP Provider"
    sql: ${TABLE}.lon ;;
  }

  dimension: neustar_country {
    type: string
    description: "Country reported by our GeoIP Provider"
    sql: ${TABLE}.neustar_country ;;
  }

  dimension: neustar_dma_id {
    type: number
    description: "DMA ID as reported by our GeoIP Provider"
    sql: ${TABLE}.neustar_dma_id ;;
    map_layer_name: combined_us_canada_dmas
  }

  dimension: neustar_state {
    type: string
    description: "State reported by our GeoIP Provider"
    sql: ${TABLE}.neustar_state ;;
  }

  dimension: num_pvs {
    type: number
    description: "Count of pageviews generated during the session"
    sql: ${TABLE}.numPvs ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: snap_ad_id {
    type: string
    description: "Snapchat Ad ID"
    sql: ${TABLE}.snap_ad_id ;;
  }

  dimension: snap_ad_squad_id {
    type: string
    description: "Snapchat Ad Squad (Ad Group) ID"
    sql: ${TABLE}.snap_ad_squad_id ;;
  }

  dimension: snap_campaign_id {
    type: string
    description: "Snapchat Campaign ID"
    sql: ${TABLE}.snap_campaign_id ;;
  }

  dimension: tw_campaign_id {
    type: string
    description: "Twitter Campaign ID"
    sql: ${TABLE}.tw_campaign_id ;;
  }

  dimension: tw_line_item_id {
    type: string
    description: "Twitter Line Item (Ad) ID"
    sql: ${TABLE}.tw_line_item_id ;;
  }

  dimension: url {
    type: string
    description: "URL of the first pageview for this session"
    sql: ${TABLE}.url ;;
  }

  dimension: uuid {
    type: string
    description: "A unique ID generated by this user’s browser.  This stays the same across sessions unless browsing data is cleared"
    sql: ${TABLE}.uuid ;;
  }

  dimension: zip_code {
    type: zipcode
    description: "Zip Code reported by our GeoIP Provider"
    sql: ${TABLE}.zip_code ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [id, created_time, brands.brand_name, brands.brand_id, joined_implicit_attribution.count]
  # }
}
