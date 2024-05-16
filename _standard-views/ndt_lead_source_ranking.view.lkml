view: ndt_lead_source_ranking {
  derived_table: {
    explore_source: activity_sessions {
      column: calculated_source {}
      column: session_count {}
      column: percent_of_total_sessions {}
      derived_column: ranking {
        sql: rank() over (order by session_count desc) ;;
      }
      bind_all_filters: yes
    }
  }
  dimension: calculated_source {
    primary_key: yes
    hidden: yes
  }
  dimension: lead_source_rank {
    hidden: yes
    type: string
    sql: ${TABLE}.ranking ;;
  }

#### This parameter will allow a user to select a Top N ranking limit for bucketing the brands, almost like parameterizing the Row Limit in the UI
  parameter: top_rank_limit {
    type: unquoted
    hidden: yes
    default_value: "5"
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 15"
      value: "15"
    }
    allowed_value: {
      label: "Top 20"
      value: "20"
    }
  }

  dimension: top_sources_names {
    label: "(Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %}) Lead Sources"
    order_by_field: top_sources_rank
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${lead_source_rank}<={% parameter top_rank_limit %} THEN ${calculated_source}
        ELSE 'Other'
      END
    ;;
  }

  dimension: top_sources_rank {
    label_from_parameter: top_rank_limit
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${lead_source_rank}<={% parameter top_rank_limit %}
          THEN
            CASE
              WHEN ${lead_source_rank}<10 THEN CONCAT('0', CAST(${lead_source_rank} AS STRING))
              ELSE CAST(${lead_source_rank} as STRING)
            END
        ELSE 'Other'
      END
    ;;
  }



}
