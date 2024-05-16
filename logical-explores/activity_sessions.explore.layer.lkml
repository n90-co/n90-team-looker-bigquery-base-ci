include: "/logical-explores/activity_sessions.explore.lkml"

explore: +activity_sessions {
  aggregate_table: rollup__session_count__0 {
    query: {
      dimensions: [
        activity_sessions.brand_id,
        brands.brand_name,
        ndt_lead_source_ranking.top_rank_limit
      ]
      measures: [activity_sessions.session_count]
      filters: [
        activity_sessions.local_created_date: "7 days",
        activity_sessions.local_created_date_filter: "7 days"
      ]
    }

    materialization: {
      datagroup_trigger: bigquery_dashboards_default_datagroup
    }
  }

  aggregate_table: rollup__click_view_reports_keyword_text__1 {
    query: {
      dimensions: [
        activity_sessions.brand_id,
        brands.brand_name,
        click_view_reports.keyword_text
      ]
      measures: [session_count]
      filters: [
        # "activity_sessions.local_created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        activity_sessions.local_created_date: "7 day",
        activity_sessions.local_created_date_filter: "7 days",
        click_view_reports.keyword_text: "-NULL"
      ]
    }

    materialization: {
      datagroup_trigger: bigquery_dashboards_default_datagroup
    }
  }

  aggregate_table: rollup__click_view_reports_keyword_text__2 {
    query: {
      dimensions: [
        activity_sessions.brand_id,
        brands.brand_name,
        click_view_reports.keyword_text
      ]
      measures: [session_count]
      filters: [
        # "activity_sessions.local_created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        activity_sessions.local_created_date: "7 day",
        activity_sessions.local_created_date_filter: "7 days",
        click_view_reports.keyword_text: "-NULL"
      ]
    }

    materialization: {
      datagroup_trigger: bigquery_dashboards_default_datagroup
    }
  }

  aggregate_table: rollup__zip_code__3 {
    query: {
      dimensions: [
        activity_sessions.brand_id,
        brands.brand_name,
        zip_code
      ]
      measures: [session_count]
      filters: [
        # "activity_sessions.local_created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        activity_sessions.local_created_date: "7 day",
        activity_sessions.local_created_date_filter: "7 days",
        activity_sessions.zip_code: "-NULL"
      ]
    }

    materialization: {
      datagroup_trigger: bigquery_dashboards_default_datagroup
    }
  }

  aggregate_table: rollup__ndt_lead_source_ranking_top_sources_names__4 {
    query: {
      dimensions: [
        activity_sessions.brand_id,
        brands.brand_name,
        ndt_lead_source_ranking.top_sources_names
      ]
      measures: [percent_of_total_sessions]
      filters: [
        # "activity_sessions.local_created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        activity_sessions.local_created_date: "7 day",
        activity_sessions.local_created_date_filter: "7 days",
        # "ndt_lead_source_ranking.top_rank_limit" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        ndt_lead_source_ranking.top_rank_limit: "5"
      ]
    }

    materialization: {
      datagroup_trigger: bigquery_dashboards_default_datagroup
    }
  }
}