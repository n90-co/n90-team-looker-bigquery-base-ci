## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/conversion_attribution.view.lkml"
include: "/_standard-views/ext_schema_change.view.lkml"
include: "/_standard-views/ext_competitor_info.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: +conversion_attribution {
  extends: [ext_partitions,ext_schema_change,ext_competitor_info,ext_dry_label]

# Overriding table name to allow dynamic schema
  sql_table_name: `next90-core-applications.{% parameter conversion_attribution.dynamic_schema %}{% parameter conversion_attribution.demo_schema %}looker.conversion_attribution` ;;

#PRIMARY KEY{
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${orig_event_id}, ${geo}, ${lead_source}, ${brand_id}, ${goal_id}) ;;
  }
#}

#MEASURES{
  measure: event_goal_conversion_count{
    hidden: yes
    type: sum
    sql: ${conversion_count} ;;
  }
#Default measures pulled in with table:
  measure: total_conversion_count {
    hidden: yes
    type: sum
    sql: ${conversion_count} ;;  }
  measure: average_conversion_count {
    hidden: yes
    type: average
    sql: ${conversion_count} ;;  }

#}

#Hiding/Renaming/Relabeling Dimensions{
  dimension: affiliate {
    description: "Affiliate of the event if applicable"
    hidden: yes
  }
  dimension: brand_id {
    description: "A unique identifier by Next90 for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: conversion_count {
    description: "Count of attributed conversions"
    label: "Conversion Count (lead source level)"
    hidden: yes
  }
  dimension: detection_timezone {
    description: "Timezone of the original detection"
    hidden: yes
  }
  dimension: dma_id {
    description: "Next90's Market ID"
    hidden: yes
  }
  dimension: dma_name {
    description: "Market Name"
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
  dimension: geo {
    description: "Geography of the original event (DMA, Zip Code, …)"
    hidden: yes
  }
  dimension: goal_id {
    description: "Next90 ID of the goal reached for the attributed conversion"
    hidden: yes
  }
  dimension: goal_name {
    description: "Name of the goal reached for the attributed conversion"
    hidden: yes
  }
  dimension: hour {
    hidden: yes
  }
  dimension: lead_source {
    description: "Source of the attributed sessions"
    hidden: yes
  }
  dimension: orig_event_id {
    description: "A unique identifier by Next90 that groups together detections into a single event."
    hidden: yes
  }
  dimension: program_uuid {
    description: "ID to link to WWTV program data"
    hidden: yes
  }
  dimension: sub_trigger_id {
    description: "ID of the original triggering detection (watermark_id, creative_resource_id, product_id, …)"
    hidden: yes
  }
#}

}