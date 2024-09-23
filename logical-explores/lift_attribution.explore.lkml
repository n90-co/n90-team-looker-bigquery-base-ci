# Created by: Mary
# Last Updated on 2/22/24 by Mary

include: "/_standard-views/lift_attribution.layer.lkml"
include: "/_standard-views/brand_central_products.layer.lkml"
include: "/_standard-views/brands.layer2.lkml"
include: "/_standard-views/dmas.layer.lkml"
include: "/_standard-views/spots.layer.lkml"
include: "/_standard-views/ndt_orig_event_aggregates.view.lkml"
# include: "/_standard-views/kinetiq_occurrences.layer.lkml"
include: "/_standard-views/pdt_brand_startend_dates.view.lkml"
include: "/_standard-views/pdt_kinetiq_creatives.view.lkml"
include: "/_standard-views/market_grouping.layer.lkml"
include: "/_standard-views/wwtv_programs.layer.lkml"

explore: lift_attribution {
  description: "This data explore can be used to access consumer engagement lift data. You can do aggregate visual analysis as well as create custom reports using raw data at the lead source or spot-centric levels."
  label: "Lift Attribution Data"

  access_filter: {
    field: lift_attribution.brand_id
    user_attribute: brand_id
  }

  always_filter: {
    filters: [
      lift_attribution.local_start_date_filter: "last 30 days",
      lift_attribution.airing_type: "1st Party",
      brands.brand_filter: ""
    ]
  }

  sql_always_where:
    ${local_start_date} between ${filter_start_date} and DATE_ADD(${filter_end_date}, INTERVAL -1 DAY)
    AND ${event_start_date} between DATE_ADD(${filter_start_date}, INTERVAL -1 DAY) AND ${filter_end_date}
    AND DATE(${year},${month},${day}) between DATE_ADD(${filter_start_date}, INTERVAL -1 DAY) AND ${filter_end_date}

    {% if _user_attributes['exclude_directv_dish'] == 'yes' %}
      AND ${dmas.name} NOT IN ('DIRECTV', 'DISH')
    {% endif %}

    {% if adv_brand_filter._is_filtered %}
      AND ${brand_id} = SUBSTR({% parameter adv_brand_filter %}, -24)
    {% endif %}
    ;;

  join: brand_central_products {
    type: left_outer
    sql_on: ${lift_attribution.sub_trigger_id} = CAST(${brand_central_products.orig_product_id} AS STRING);;
    relationship: many_to_one
  }

  join: brands {
    type: inner
    sql_on: ${lift_attribution.brand_id} = ${brands.brand_id};;
    relationship: many_to_one
  }

  join: dmas {
    type: left_outer
    sql_on: ${lift_attribution.dma_id} = ${dmas.dma_id};;
    relationship: many_to_one
  }

  join: spots {
    type: left_outer
    sql_on: ${lift_attribution.sub_trigger_id}=${spots.aeis_id} ;;
    relationship: many_to_one
    sql_where: ${spots.is_removed} = FALSE ;;
  }

  join: ndt_orig_event_aggregates {
    type: left_outer
    sql_on: ${lift_attribution.orig_event_id} = ${ndt_orig_event_aggregates.orig_event_id} and
            ${lift_attribution.year} = ${ndt_orig_event_aggregates.year} and
            ${lift_attribution.month} = ${ndt_orig_event_aggregates.month} and
            ${lift_attribution.day} = ${ndt_orig_event_aggregates.day};;
    relationship: many_to_one
  }

  join: pdt_brand_startend_dates {
    type: left_outer
    sql_on: ${lift_attribution.brand_id} = ${pdt_brand_startend_dates.brand_id} ;;
    relationship: many_to_one
  }

  join: pdt_kinetiq_creatives {
    type: left_outer
    sql_on: ${lift_attribution.sub_trigger_id}=${pdt_kinetiq_creatives.creative_resource_id} ;;
    relationship: many_to_one
  }

  join: market_grouping {
    type: left_outer
    sql_on: ${lift_attribution.brand_id} = ${market_grouping.brand_id} AND
      ${lift_attribution.dma_id} = ${market_grouping.dma_id};;
    relationship: many_to_one
  }

  join: wwtv_programs {
    type: left_outer
    sql_on: ${lift_attribution.program_uuid} = ${wwtv_programs.program_uuid} and
            ${lift_attribution.year} = ${wwtv_programs.year} and
            ${lift_attribution.month} = ${wwtv_programs.month} and
            ${lift_attribution.day} = ${wwtv_programs.day};;
    relationship: many_to_one
  }
}

# TOOK THESE OUT TO MAKE CONVERSION ATTRIBUTION ITS OWN EXPLORE
# issues with lift_attribution lead sources not matching
# include: "/_standard-views/conversion_attribution.layer.lkml"
# include: "/_standard-views/ndt_goals_and_conversions.view.lkml"
  # join: conversion_attribution {
  #   type: left_outer
  #   sql_on: ${lift_attribution.affiliate} = ${conversion_attribution.affiliate}
  #           AND ${lift_attribution.brand_id} = ${conversion_attribution.brand_id}
  #           AND ${lift_attribution.detection_timezone} = ${conversion_attribution.detection_timezone}
  #           AND ${lift_attribution.dma_id} = ${conversion_attribution.dma_id}
  #           AND ${lift_attribution.dma_name} = ${conversion_attribution.dma_name}
  #           AND ${lift_attribution.event_length} = ${conversion_attribution.event_length}
  #           AND ${lift_attribution.event_start_raw} = ${conversion_attribution.event_start_raw}
  #           AND ${lift_attribution.event_type} = ${conversion_attribution.event_type}
  #           AND ${lift_attribution.geo} = ${conversion_attribution.geo}
  #           AND ${lift_attribution.lead_source} = ${conversion_attribution.lead_source}
  #           AND ${lift_attribution.orig_event_id} = ${conversion_attribution.orig_event_id}
  #           AND ${lift_attribution.sub_trigger_id} = ${conversion_attribution.sub_trigger_id};;
  #   relationship: many_to_many
  # }
  # join: ndt_goals_and_conversions {
  #   type: left_outer
  #   sql_on: ${lift_attribution.orig_event_id} = ${ndt_goals_and_conversions.orig_event_id};;
  #   relationship: many_to_one
  # }
