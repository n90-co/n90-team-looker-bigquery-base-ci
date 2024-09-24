## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: ndt_orig_event_aggregates_new_baseline {
  extends: [ext_partitions,ext_dry_label]

  derived_table: {
    #CANNOT Persist this table because of brand_id access filter....
    # datagroup_trigger: bigquery_dashboards_default_datagroup
    # increment_key: "event_start_date"
    # increment_offset: 1

    explore_source: lift_attribution_new_baseline {
      column: orig_event_id {}
      # column: session_count {}
      # column: page_view_count {}
      # column: baseline_session_count {}
      # column: baseline_sessions_per_second {}
      # column: event_lift {}
      # column: percent_lift_increase {}
      column: year {}
      column: month {}
      column: day {}
      bind_all_filters: yes
    }
  }

  dimension: orig_event_id {
    primary_key: yes
    label: "Original Event ID (Spot-Centric)"
    description: "Airing ID"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: string
    sql: ${TABLE}.orig_event_id ;;
  }

#DIMENSIONS{
  # dimension: session_count {
  #   label: "Session Count (Spot-Centric)"
  #   description: ""
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
  #   sql:${TABLE}.session_count ;;
  #   value_format: "#,##0.0"
  # }

  # dimension: page_view_count {
  #   label: "Page View Count (Spot-Centric)"
  #   description: ""
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
  #   sql:${TABLE}.page_view_count ;;
  #   value_format: "#,##0.0"
  # }

  # dimension: baseline_session_count {
  #   label: "Baseline Sessions Count (Spot-Centric)"
  #   description: ""
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   sql: ${TABLE}.baseline_session_count ;;
  #   value_format: "#,##0"
  # }

  # dimension: baseline_sessions_per_second {
  #   label: "Baseline Sessions Rate (Spot-Centric)"
  #   description: "Use ONLY for spot-centric raw data reports. Baseline sessions per second by detection. This is calculated by taking the baseline session count and dividing by 300 (or 5 minutes). This rate is then used to calculate a projected baseline that is representative of the total micro-moment length, which may differ by event depending on event length."
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   sql: ${TABLE}.baseline_sessions_per_second ;;
  #   value_format: "0.####"
  # }

  # dimension: event_lift{
  #   label: "Page View Count (Spot-Centric)"
  #   description: "Use ONLY for spot-centric raw data reports. The total number of page views that occurred for any session(s) attributed to the detection."
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   sql: ${TABLE}.event_lift ;;
  #   value_format: "#,##0"
  # }

  # dimension: percent_event_lift {
  #   label: "Percent Lift Increase (Spot-Centric)"
  #   description: "Use ONLY for spot-centric raw data reports. The total raw increase in sessions from the projected baseline attributed to the detection."
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   sql: ${TABLE}.percent_lift_increase * 100 ;;
  #   value_format: "#,##0.0"
  # }

  # # dimension: event_percent_lift {
  # #   label: "Percent Lift (Spot-Centric)"
  # #   description: "Use ONLY for spot-centric raw data reports. The percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
  # #   view_label: "{% parameter view_label_5 %}"
  # #   group_label: "Spot-Centric Level Data"
  # #   # hidden: yes
  # #   type: number
  # #   sql: ${TABLE}.event_percent_lift ;;
  # #   # sql: if(${event_baseline_sessions}>0,${event_weighted_lift}/${event_baseline_sessions}*100,${event_weighted_lift}*100);;
  # # }

  # measure: average_percent_lift_per_detection{
  #   view_label: "{% parameter view_label_3 %}"
  #   description: "The average percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
  #   type: average
  #   sql: ${percent_event_lift} ;;
  #   value_format: "0.0\%"
  # }

#AT SOME POINT, THESE NEED TO BE REPLACED BY WEIGHTED VALUES THAT ARE IMPLEMENTED IN THE PIPELINE ATTRIBUTION
  # dimension: event_baseline_session_count {
  #   label: "Spot-Centric Baseline Count"
  #   description: "The total baseline session counts for the detection"
  #   type: number
  #   sql: ${TABLE}.event_baseline_session_count ;;
  # }

  # dimension: event_session_count {
  #   label: "Spot-Centric Session Count"
  #   description: "The total micro-moment session counts for the detection"
  #   type: number
  #   sql: ${TABLE}.event_session_count ;;
  # }

  # measure: average_baseline_session_count_per_detection{
  #   description: "Calculates average number of Baseline Sessions per detection"
  #   type: average
  #   sql: ${event_session_count} ;;
  # }

  # measure: average_session_count_per_detection{
  #   label: "Average Micro-Moment Session Count per Detection"
  #   description: "Calculates average number of Micro-Moment Sessions per detection"
  #   type: average
  #   sql: ${event_session_count} ;;
  # }
}
