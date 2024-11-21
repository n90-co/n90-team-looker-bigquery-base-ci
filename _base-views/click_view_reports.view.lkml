# The name of this view in Looker is "Click View Reports"
view: click_view_reports {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `next90-core-applications.omniData.click_view_reports` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Group Ad" in Explore.

  dimension: ad_group_ad {
    type: string
    sql: ${TABLE}.ad_group_ad ;;
  }

  dimension: ad_group_id {
    type: string
    description: "Output only. The associated ad."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    description: "The name of the ad group. This field is required and should not be empty when creating new ad groups. It must contain fewer than 255 UTF-8 full-width characters. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: ad_group_resource_name {
    type: string
    description: "Immutable. The resource name of the ad group. Ad group resource names have the form: customers/{customer_id}/adGroups/{ad_group_id}"
    sql: ${TABLE}.ad_group_resource_name ;;
  }

  dimension: ad_network_type_code {
    type: number
    description: "Code that corresponds to the ad network type."
    sql: ${TABLE}.ad_network_type_code ;;
  }

  dimension: area_of_interest_city {
    type: string
    description: "The city location criterion associated with the impression."
    sql: ${TABLE}.area_of_interest_city ;;
  }

  dimension: area_of_interest_country {
    type: string
    description: "The country location criterion associated with the impression."
    sql: ${TABLE}.area_of_interest_country ;;
  }

  dimension: area_of_interest_metro {
    type: string
    description: "The metro location criterion associated with the impression."
    sql: ${TABLE}.area_of_interest_metro ;;
  }

  dimension: area_of_interest_most_specific {
    type: string
    description: "The most specific location criterion associated with the impression."
    sql: ${TABLE}.area_of_interest_most_specific ;;
  }

  dimension: area_of_interest_region {
    type: string
    description: "The region location criterion associated with the impression."
    sql: ${TABLE}.area_of_interest_region ;;
  }

  dimension: base_campaign {
    type: string
    description: "Output only. The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to resource_name. This field is read-only."
    sql: ${TABLE}.base_campaign ;;
  }

  dimension: campaign_experiment_type_code {
    type: number
    description: "Output only. Code maps to the type of campaign: normal, draft, or experiment."
    sql: ${TABLE}.campaign_experiment_type_code ;;
  }

  dimension: campaign_id {
    type: string
    description: "Google Campaign ID"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_location_target {
    type: string
    description: "Output only. The associated campaign location target, if one exists."
    sql: ${TABLE}.campaign_location_target ;;
  }

  dimension: campaign_name {
    type: string
    description: "Google Campaign Name"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_resource_name {
    type: string
    description: "Immutable. The resource name of the campaign. Campaign resource names have the form: customers/{customer_id}/campaigns/{campaign_id}"
    sql: ${TABLE}.campaign_resource_name ;;
  }

  dimension: click_type_code {
    type: number
    description: "Code that corresponds to the click type."
    sql: ${TABLE}.click_type_code ;;
  }

  dimension: clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.clicks ;;
  }

  dimension: customer_id {
    type: string
    description: "Google Customer ID"
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_resource_name {
    type: string
    description: "Immutable. The resource name of the customer. Customer resource names have the form: customers/{customer_id}"
    sql: ${TABLE}.customer_resource_name ;;
  }

  dimension: gclid {
    type: string
    description: "Google Click ID"
    sql: ${TABLE}.gclid ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: impression {
    type: time
    description: "Date when the impression occurred"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.impression_date ;;
  }

  dimension: keyword {
    type: string
    description: "Output only. The associated keyword, if one exists and the click corresponds to the SEARCH channel."
    sql: ${TABLE}.keyword ;;
  }

  dimension: keyword_match_type_code {
    type: number
    description: "The match type of the keyword."
    sql: ${TABLE}.keyword_match_type_code ;;
  }

  dimension: keyword_text {
    type: string
    description: "The text of the keyword (at most 80 characters and 10 words)."
    sql: ${TABLE}.keyword_text ;;
  }

  dimension: location_of_presence_city {
    type: string
    description: "The city location criterion associated with the impression."
    sql: ${TABLE}.location_of_presence_city ;;
  }

  dimension: location_of_presence_country {
    type: string
    description: "The country location criterion associated with the impression."
    sql: ${TABLE}.location_of_presence_country ;;
  }

  dimension: location_of_presence_metro {
    type: string
    description: "The metro location criterion associated with the impression."
    sql: ${TABLE}.location_of_presence_metro ;;
  }

  dimension: location_of_presence_most_specific {
    type: string
    description: "The most specific location criterion associated with the impression."
    sql: ${TABLE}.location_of_presence_most_specific ;;
  }

  dimension: location_of_presence_region {
    type: string
    description: "The region location criterion associated with the impression."
    sql: ${TABLE}.location_of_presence_region ;;
  }

  dimension: page_number {
    type: number
    description: "Output only. Page number in search results where the ad was shown."
    sql: ${TABLE}.page_number ;;
  }

  dimension: resource_name {
    type: string
    description: "Output only. The resource name of the click view. Click view resource names have the form: customers/{customer_id}/clickViews/{date (yyyy-MM-dd)}~{gclid}"
    sql: ${TABLE}.resource_name ;;
  }

  dimension: slot {
    type: number
    description: "Position of the ad."
    sql: ${TABLE}.slot ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_list {
    type: string
    description: "Output only. The associated user list, if one exists."
    sql: ${TABLE}.user_list ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  # # ----- Sets of fields for drilling ------
  # set: detail {
  #   fields: [
  # campaign_name,
  # campaign_resource_name,
  # customer_resource_name,
  # ad_group_name,
  # resource_name,
  # ad_group_resource_name
  # ]
  # }

}