## Created by: Mary
## Last edited: 2/15/24 by Mary

view: pdt_brand_startend_dates {
  derived_table: {
    datagroup_trigger: bigquery_dashboards_default_datagroup
    increment_key: "created_date"
    increment_offset: 1
    sql:  SELECT  brand_id,
                  MIN(DATE(created_time)) as brand_start_date,
                  MAX(DATE(created_time)) as brand_end_date
          FROM `next90-core-applications.omniData.activity_sessions`
          GROUP BY brand_id;;
  }

  dimension: brand_id {
    type: string
    hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_start_date {
    type: date
    hidden: yes
    sql: ${TABLE}.brand_start_date ;;
  }

  dimension: brand_end_date {
    type: date
    hidden: yes
    sql: ${TABLE}.brand_end_date ;;
  }
}