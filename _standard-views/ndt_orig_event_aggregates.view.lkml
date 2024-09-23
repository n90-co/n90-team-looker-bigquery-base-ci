## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_standard-views/ext_DRY_label.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: ndt_orig_event_aggregates {
  extends: [ext_partitions,ext_dry_label]

  derived_table: {
    #CANNOT Persist this table because of brand_id access filter....
    # datagroup_trigger: bigquery_dashboards_default_datagroup
    # increment_key: "event_start_date"
    # increment_offset: 1

    explore_source: lift_attribution {
      column: orig_event_id {}
      column: dma_id {}
      column: event_weighted_lift {}
      column: event_weighted_lift_excl_directv_dish_ion {}
      column: event_weighted_lift_corrected {}
      column: event_baseline_session_count {}
      column: event_baseline_sessions_per_second {}
      column: event_page_view_count {}
      column: event_raw_lift {}
      column: event_session_count {}
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
  dimension: event_weighted_lift {
    label: "Weighted Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total weighted session lift for the detection. Fraction of lift that can be attributed to this detection alone (raw lift split between overlapping airings)"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
    sql:if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift) ;;
    value_format: "#,##0.0"
    }

  dimension: event_weighted_lift_excl_directv_dish_ion {
    label: "Weighted Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total weighted session lift for the detection. Fraction of lift that can be attributed to this detection alone (raw lift split between overlapping airings)"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
    sql:${TABLE}.event_weighted_lift_excl_directv_dish_ion ;;
    value_format: "#,##0.0"
  }

  # dimension: event_weighted_lift_excl_directv_dish_ion {
  #   label: "Weighted Lift (Spot-Centric)"
  #   description: "Use ONLY for spot-centric raw data reports. The total weighted session lift for the detection. Fraction of lift that can be attributed to this detection alone (raw lift split between overlapping airings)"
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #
  #   # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
  #   sql:case when (${TABLE}.dma_name not in ('DIRECTV', 'DISH')) THEN if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
  #   when (${});;
  #   value_format: "#,##0.0"
  # }

  dimension: event_weighted_lift_corrected {
    label: "Weighted Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total weighted session lift for the detection. Fraction of lift that can be attributed to this detection alone (raw lift split between overlapping airings)"
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    # removed neg lift to 0 - if(${TABLE}.event_weighted_lift<0, 0, ${TABLE}.event_weighted_lift)
    sql:${TABLE}.event_weighted_lift ;;
    value_format: "#,##0.0"
  }

  dimension: event_baseline_sessions {
    label: "Baseline Sessions Count (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total number of web sessions initiated on the website in the 5 minutes before an airing event across all lead sources."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    sql: ${TABLE}.event_baseline_session_count ;;
    value_format: "#,##0"
  }

  dimension: event_baseline_sessions_per_second {
    label: "Baseline Sessions Rate (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. Baseline sessions per second by detection. This is calculated by taking the baseline session count and dividing by 300 (or 5 minutes). This rate is then used to calculate a projected baseline that is representative of the total micro-moment length, which may differ by event depending on event length."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    sql: ${TABLE}.event_baseline_sessions_per_second ;;
    value_format: "0.####"
  }

  dimension: event_page_view_count{
    label: "Page View Count (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total number of page views that occurred for any session(s) attributed to the detection."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yesevent_weighted_lift_excl_directv_dish_ion
    type: number
    sql: ${TABLE}.event_page_view_count ;;
    value_format: "#,##0"
  }

  dimension: event_raw_lift {
    label: "Raw Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total raw increase in sessions from the projected baseline attributed to the detection."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    sql: if(${TABLE}.event_raw_lift<0, 0, ${TABLE}.event_raw_lift) ;;
    value_format: "#,##0.0"
  }

  dimension: event_raw_lift_corrected {
    label: "Raw Lift (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total raw increase in sessions from the projected baseline attributed to the detection."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    sql: ${TABLE}.event_raw_lift ;;
    value_format: "#,##0.0"
  }
  dimension: event_session_count {
    label: "Sessions Count (Spot-Centric)"
    description: "Use ONLY for spot-centric raw data reports. The total number of web sessions initiated on the website in the 5 minutes Micro-Moment of an airing event across all lead sources."
    view_label: "{% parameter view_label_5 %}"
    group_label: "Spot-Centric Level Data"
    # hidden: yes
    type: number
    sql: ${TABLE}.event_session_count ;;
    value_format: "#,##0"
  }


  # dimension: event_percent_lift {
  #   label: "Percent Lift (Spot-Centric)"
  #   description: "Use ONLY for spot-centric raw data reports. The percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
  #   view_label: "{% parameter view_label_5 %}"
  #   group_label: "Spot-Centric Level Data"
  #   # hidden: yes
  #   type: number
  #   sql: ${TABLE}.event_percent_lift ;;
  #   # sql: if(${event_baseline_sessions}>0,${event_weighted_lift}/${event_baseline_sessions}*100,${event_weighted_lift}*100);;
  # }

  # measure: average_percent_lift_per_detection{
  #   view_label: "{% parameter view_label_3 %}"
  #   description: "The average percent increase in the number of sessions that your site received in the Micro-Moment compared to the expected sessions based on the visits in the 5 minutes before the detection"
  #   type: average
  #   sql: ${event_percent_lift} ;;
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
