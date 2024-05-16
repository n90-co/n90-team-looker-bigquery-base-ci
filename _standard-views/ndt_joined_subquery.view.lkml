# NO LONGER USED as of 10/23/23. Replaced by just a left join from activity_sessions to joined_implicit_attribution.
# Created by: Mary
# Last Updated on 10/23/23 by Mary

include: "/logical-explores/joined_implicit_attribution.explore.lkml"
include: "/logical-explores/activity_sessions.explore.lkml"

view: ndt_joined_subquery {
  derived_table: {
    explore_source: joined_implicit_attribution {
      column: activity_session_id {}
      column: event_type {}
      column: orig_event_id {}
      column: affiliate {}
      column: is_powermoment {}
      column: competitor_name {}
      column: competitor_advertiser {}
      column: brand_id {}
      column: event_start_raw {}
      column: page_view_timestamp_raw {}

      bind_filters: {
        from_field: activity_sessions.local_created_date_filter
        to_field: joined_implicit_attribution.local_created_date_filter
      }
    }
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${orig_event_id}, ${activity_session_id}, ${page_view_timestamp_raw}) ;;
  }
  dimension: activity_session_id {hidden: yes}
  dimension: competitor_advertiser {hidden: yes}
  dimension: affiliate {hidden: yes}
  dimension: brand_id {hidden: yes}
  dimension: competitor_name {hidden: yes}
  dimension_group: event_start {
    hidden: yes
    type: time
  }
  dimension: event_type {hidden: yes}
  dimension: is_powermoment {
    hidden: yes
    type: yesno
  }
  dimension: orig_event_id {hidden: yes}
  dimension_group: page_view_timestamp {
    hidden: yes
    type: time
  }
}
