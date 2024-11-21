## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/click_view_reports.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: +click_view_reports {
  label: "Keyword Data - Google PPC"
  extends: [ext_partitions,ext_dry_label]

# Overriding the table name to allow for demo schema, no matter which explore.
  sql_table_name: `next90-core-applications.{% parameter lift_attribution.demo_schema %}{% parameter conversion_attribution.demo_schema %}{% parameter activity_sessions.demo_schema %}looker.click_view_reports` ;;

#PRIMARY KEY{
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${resource_name}, ${click_type_code}) ;;
  }
#}

  dimension: ad_network_type{
    hidden: yes
    type: string
    case: {
      when: {
        label: "UNSPECIFIED"
        sql: ${ad_network_type_code} = 0 ;;
      }
      when: {
        label: "UNKNOWN"
        sql: ${ad_network_type_code} = 1 ;;
      }
      when: {
        label: "Search Network"
        sql: ${ad_network_type_code} = 2 ;;
      }
      when: {
        label: "Search Network"
        sql: ${ad_network_type_code} = 3 ;;
      }
      when: {
        label: "Display Network"
        sql: ${ad_network_type_code} = 4 ;;
      }
      when: {
        label: "YouTube Search"
        sql:${ad_network_type_code} = 5 ;;
      }
      when: {
        label: "YouTube Videos"
        sql: ${ad_network_type_code} = 6 ;;
      }
      when: {
        label: "Cross-network"
        sql: ${ad_network_type_code} = 7 ;;
      }
      else: "Error"
    }
  }

#Hiding/Renaming/Relabeling Dimensions{
  dimension: ad_group_ad {
    hidden: yes
  }
  dimension: ad_group_id {
    description: "The associated ad."
    hidden: yes
  }
  dimension: ad_group_name {
    description: "The name of the ad group. This field is required and should not be empty when creating new ad groups. It must contain fewer than 255 UTF-8 full-width characters. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    hidden: yes
  }
  dimension: ad_group_resource_name {
    description: "The resource name of the ad group. Ad group resource names have the form: customers/{customer_id}/adGroups/{ad_group_id}"
    hidden: yes
  }
  dimension: ad_network_type_code {
    description: "Code that corresponds to the ad network type."
    hidden: yes
  }
  dimension: area_of_interest_city {
    description: "The city location criterion associated with the impression."
    hidden: yes
  }
  dimension: area_of_interest_country {
    description: "The country location criterion associated with the impression."
    hidden: yes
  }
  dimension: area_of_interest_metro {
    description: "The metro location criterion associated with the impression."
    hidden: yes
  }
  dimension: area_of_interest_most_specific {
    description: "The most specific location criterion associated with the impression."
    hidden: yes
  }
  dimension: area_of_interest_region {
    description: "The region location criterion associated with the impression."
    hidden: yes
  }
  dimension: base_campaign {
    description: "The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to resource_name. This field is read-only."
    hidden: yes
  }
  dimension: campaign_experiment_type_code {
    description: "Code maps to the type of campaign: normal, draft, or experiment."
    hidden: yes
  }
  dimension: campaign_id {
    description: "Google Campaign ID"
    hidden: yes
  }
  dimension: campaign_location_target {
    description: "The associated campaign location target, if one exists."
    hidden: yes
  }
  dimension: campaign_name {
    description: "Google Campaign Name"
    hidden: yes
  }
  dimension: campaign_resource_name {
    description: "The resource name of the campaign. Campaign resource names have the form: customers/{customer_id}/campaigns/{campaign_id}"
    hidden: yes
  }
  dimension: click_type_code {
    description: "Code that corresponds to the click type."
    hidden: yes
  }
  dimension: clicks {
    description: "The number of clicks."
    hidden: yes
  }
  dimension: customer_id {
    description: "Google Customer ID"
    hidden: yes
  }
  dimension: customer_resource_name {
    description: "The resource name of the customer. Customer resource names have the form: customers/{customer_id}"
    hidden: yes
  }
  dimension: gclid {
    description: "Google Click ID"
    hidden: yes
  }
  dimension_group: impression {
    description: "Date when the impression occurred"
    hidden: yes
  }
  dimension: keyword {
    description: "The associated keyword, if one exists and the click corresponds to the SEARCH channel."
    hidden: yes
  }
  dimension: keyword_match_type_code {
    description: "The match type of the keyword."
    hidden: yes
  }
  dimension: keyword_text {
    label: "Google PPC Keyword"
    view_label: "{% parameter view_label_4 %}"
    description: "The text of the keyword (at most 80 characters and 10 words)."
    # hidden: yes
  }
  dimension: location_of_presence_city {
    description: "The city location criterion associated with the impression."
    hidden: yes
  }
  dimension: location_of_presence_country {
    description: "The country location criterion associated with the impression."
    hidden: yes
  }
  dimension: location_of_presence_metro {
    description: "The metro location criterion associated with the impression."
    hidden: yes
  }
  dimension: location_of_presence_most_specific {
    description: "The most specific location criterion associated with the impression."
    hidden: yes
  }
  dimension: location_of_presence_region {
    description: "The region location criterion associated with the impression."
    hidden: yes
  }
  dimension: page_number {
    description: "Page number in search results where the ad was shown."
    hidden: yes
  }
  dimension: resource_name {
    description: "The resource name of the click view. Click view resource names have the form: customers/{customer_id}/clickViews/{date (yyyy-MM-dd)}~{gclid}"
    hidden: yes
  }
  dimension: slot {
    description: "Position of the ad."
    hidden: yes
  }
  dimension_group: timestamp {
    hidden: yes
  }
  dimension: user_list {
    description: "The associated user list, if one exists."
    hidden: yes
  }
#}
}