## Created by: Mary
## Last edited: 2/22/24 by Mary

include: "/_standard-views/activity_sessions.layer.lkml"
include: "/_standard-views/click_view_reports.layer.lkml"
include: "/_standard-views/dmas.layer.lkml"
include: "/_standard-views/brands.layer2.lkml"
include: "/_standard-views/joined_implicit_attribution.layer.lkml"
include: "/_standard-views/ndt_lead_source_ranking.view.lkml"
include: "/_standard-views/market_grouping.layer.lkml"
include: "/_standard-views/brand_central_products.layer.lkml"
include: "/_standard-views/pdt_kinetiq_creatives.view.lkml"
include: "/_standard-views/wwtv_programs.layer.lkml"
include: "/_standard-views/state_abbreviation_mapping.layer.lkml"

explore: activity_sessions {
  description: "Session data from customer's web activity within the United States"
  label: "Web Session Data"

  access_filter: {
    field: activity_sessions.brand_id
    user_attribute: brand_id
  }

  # required_access_grants: [premium]

  always_filter: {
    filters: [
      activity_sessions.local_created_date_filter: "7 days",
      brands.brand_filter: ""
      ]
  }

  sql_always_where: ${local_created_date} between ${filter_session_start_date} and DATE_ADD(${filter_session_end_date}, INTERVAL -1 DAY)
                    AND ${created_date} between DATE_ADD(${filter_session_start_date}, INTERVAL -1 DAY) AND ${filter_session_end_date}
                    AND ${dmas.timezone} is not null
                    AND DATE(${year},${month},${day}) between DATE_ADD(${filter_session_start_date}, INTERVAL -1 DAY) AND ${filter_session_end_date}
                    {% if _user_attributes['excluded_dmas'] != '' %} AND ${dmas.name} NOT IN ({{ _user_attributes['excluded_dmas'] | split: ',' | array_to_string }}){% endif %}
                    {% if adv_brand_filter._is_filtered %}AND ${brand_id} = SUBSTR({% parameter adv_brand_filter %}, -24) {% endif %}
                    ;;

                    ## NOTE: ${dmas.timezone} is not null
                    ## approved by James 11/8, communicated to CS team at Data & Reporting 11/14
                    ## this filters the sessions down to ONLY US
                    ## Intention was to also keep Canadian session but neustar_dma_id is NULL so
                    ## cannot join to DMAs collection correctly
                    ## needed b/c all local time conversions dimensions/filters break with no timezone

                    ## NOTE: ${calculated_source} != 'other' removed
                    ## approved by James 11/8, communicated to CS team at Data & Reporting 11/14

  # join: ndt_joined_subquery {
  #   type: left_outer
  #   sql_on: ${activity_sessions.id} = ${ndt_joined_subquery.activity_session_id}
  #           AND ${activity_sessions.brand_id} = ${ndt_joined_subquery.brand_id};;
  #   relationship: many_to_one
  # }

  join: joined_implicit_attribution {
    fields: [
      joined_implicit_attribution.event_type,
      joined_implicit_attribution.is_powermoment
    ]
    type: left_outer
    sql_on: ${activity_sessions.brand_id} = ${joined_implicit_attribution.brand_id} and
            ${activity_sessions.id} = ${joined_implicit_attribution.activity_session_id} and
            ${activity_sessions.created_raw} = ${joined_implicit_attribution.session_created_raw} and
            ${joined_implicit_attribution.session_created_raw} = ${joined_implicit_attribution.page_view_timestamp_raw} and
            ${activity_sessions.year} = ${joined_implicit_attribution.year} and
            ${activity_sessions.month} = ${joined_implicit_attribution.month} and
            ${activity_sessions.day} = ${joined_implicit_attribution.day};;
    relationship: one_to_many
  }

  join: click_view_reports {
    type: left_outer
    sql_on: ${activity_sessions.gclid} is not null AND
            ${activity_sessions.gclid} =  ${click_view_reports.gclid} and
            ${activity_sessions.year} = ${click_view_reports.year} and
            ${activity_sessions.month} = ${click_view_reports.month} and
            ${activity_sessions.day} = ${click_view_reports.day} ;;
    relationship: many_to_many
  }

  join: dmas {
    type: left_outer
    sql_on: ${activity_sessions.neustar_dma_id} = ${dmas.neustar_id};;
    relationship: many_to_one
  }

  join: brands {
    type: inner
    sql_on: ${activity_sessions.brand_id} = ${brands.brand_id} ;;
    relationship: many_to_one
  }

  join: ndt_lead_source_ranking {
    type: inner
    relationship: many_to_one
    sql_on: ${activity_sessions.calculated_source} = ${ndt_lead_source_ranking.calculated_source} ;;
  }

  join: market_grouping {
    type: left_outer
    sql_on: ${activity_sessions.brand_id} = ${market_grouping.brand_id} AND
            CAST(${activity_sessions.neustar_dma_id} AS STRING) = ${market_grouping.neustar_id} ;;
    relationship: many_to_one
  }

  join: brand_central_products {
    type: left_outer
    sql_on: ${joined_implicit_attribution.sub_trigger_id} = CAST(${brand_central_products.orig_product_id} AS STRING) ;;
    relationship: many_to_one
  }

  join: pdt_kinetiq_creatives {
    type: left_outer
    sql_on: ${joined_implicit_attribution.sub_trigger_id}=${pdt_kinetiq_creatives.creative_resource_id} ;;
    relationship: many_to_one
  }

  join: wwtv_programs {
    fields: []
    type: left_outer
    sql_on: ${joined_implicit_attribution.program_uuid} = ${wwtv_programs.program_uuid} and
            ${joined_implicit_attribution.year} = ${wwtv_programs.year} and
            ${joined_implicit_attribution.month} = ${wwtv_programs.month} and
            ${joined_implicit_attribution.day} = ${wwtv_programs.day};;
    relationship: many_to_one
  }

  join: state_abbreviation_mapping {
    type: left_outer
    sql_on: ${activity_sessions.neustar_state}=${state_abbreviation_mapping.neustar_state} ;;
    relationship: many_to_one
  }
}
