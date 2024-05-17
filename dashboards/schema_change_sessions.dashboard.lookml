- dashboard: session_dashboard_with_schema_change
  title: Session & Lead Source Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: Visualizations using data gathered by Advocado's tracking tag you have
    installed on your website
  refresh: 1 day
  filters_location_top: false
  preferred_slug: T24Z2yxy9RDF7njEYeqSUq
  elements:
  - title: Session Count
    name: Session Count
    model: schema_change
    explore: activity_sessions
    type: single_value
    fields: [activity_sessions.session_count]
    filters:
      activity_sessions.local_created_date_filter: 30 days ago for 30 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0504AA"
    single_value_title: Sessions
    defaults_version: 1
    listen:
      Date Range: activity_sessions.local_created_date
      Micro-Moment Type: activity_sessions.micromoment_type
      Power-Moment Type: activity_sessions.powermoment_type
      Brand Name: brands.brand_name
      Customer Markets: market_grouping.customer_markets
      "*": activity_sessions.dynamic_schema
    row: 0
    col: 0
    width: 6
    height: 6
  - title: Keyword Cloud
    name: Keyword Cloud
    model: schema_change
    explore: activity_sessions
    type: looker_wordcloud
    fields: [click_view_reports.keyword_text, activity_sessions.session_count]
    filters:
      activity_sessions.local_created_date_filter: 7 days
      click_view_reports.keyword_text: "-NULL"
    sorts: [activity_sessions.session_count desc 0]
    limit: 20
    column_limit: 50
    color_application:
      collection_id: next90-colors
      palette_id: next90-colors-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Date Range: activity_sessions.local_created_date
      Micro-Moment Type: activity_sessions.micromoment_type
      Power-Moment Type: activity_sessions.powermoment_type
      Brand Name: brands.brand_name
      Customer Markets: market_grouping.customer_markets
      "*": activity_sessions.dynamic_schema
    row: 6
    col: 3
    width: 9
    height: 6
  - title: Keyword Table
    name: Keyword Table
    model: schema_change
    explore: activity_sessions
    type: looker_grid
    fields: [click_view_reports.keyword_text, activity_sessions.session_count]
    filters:
      activity_sessions.local_created_date_filter: 7 days
      click_view_reports.keyword_text: "-NULL"
    sorts: [activity_sessions.session_count desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: next90-colors
      palette_id: next90-colors-categorical-0
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      activity_sessions.session_count:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Date Range: activity_sessions.local_created_date
      Micro-Moment Type: activity_sessions.micromoment_type
      Power-Moment Type: activity_sessions.powermoment_type
      Brand Name: brands.brand_name
      Customer Markets: market_grouping.customer_markets
      "*": activity_sessions.dynamic_schema
    row: 6
    col: 12
    width: 9
    height: 6
  - title: Sessions by Zip
    name: Sessions by Zip
    model: schema_change
    explore: activity_sessions
    type: looker_geo_coordinates
    fields: [activity_sessions.session_count, activity_sessions.zip_code]
    filters:
      activity_sessions.local_created_date_filter: 7 days
      activity_sessions.zip_code: "-NULL"
    sorts: [activity_sessions.session_count desc 0]
    limit: 20
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: false
    point_color: "#78B24D"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: next90-colors
      palette_id: next90-colors-categorical-0
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      activity_sessions.session_count:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    quantize_colors: false
    listen:
      Date Range: activity_sessions.local_created_date
      Micro-Moment Type: activity_sessions.micromoment_type
      Power-Moment Type: activity_sessions.powermoment_type
      Brand Name: brands.brand_name
      Customer Markets: market_grouping.customer_markets
      "*": activity_sessions.dynamic_schema
    row: 0
    col: 6
    width: 9
    height: 6
  - title: Traffic by Lead Source
    name: Traffic by Lead Source
    model: schema_change
    explore: activity_sessions
    type: looker_pie
    fields: [activity_sessions.percent_of_total_sessions, ndt_lead_source_ranking.top_sources_names]
    filters:
      activity_sessions.local_created_date_filter: 7 days
    sorts: [ndt_lead_source_ranking.top_sources_names]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: next90-colors
      palette_id: next90-colors-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: ''
    series_colors: {}
    reference_lines: []
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Date Range: activity_sessions.local_created_date
      Micro-Moment Type: activity_sessions.micromoment_type
      Power-Moment Type: activity_sessions.powermoment_type
      Brand Name: brands.brand_name
      Lead Source Rank: ndt_lead_source_ranking.top_rank_limit
      Customer Markets: market_grouping.customer_markets
      "*": activity_sessions.dynamic_schema
    row: 0
    col: 15
    width: 9
    height: 6
  filters:
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: schema_change
    explore: activity_sessions
    listens_to_filters: [Date Range, " "]
    field: brands.brand_name
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: schema_change
    explore: activity_sessions
    listens_to_filters: []
    field: activity_sessions.local_created_date
  - name: Customer Markets
    title: Customer Markets
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: schema_change
    explore: activity_sessions
    listens_to_filters: [Brand Name, Date Range]
    field: market_grouping.customer_markets
  - name: Micro-Moment Type
    title: Micro-Moment Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: schema_change
    explore: activity_sessions
    listens_to_filters: []
    field: activity_sessions.micromoment_type
  - name: Power-Moment Type
    title: Power-Moment Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: schema_change
    explore: activity_sessions
    listens_to_filters: []
    field: activity_sessions.powermoment_type
  - name: Lead Source Rank
    title: Lead Source Rank
    type: field_filter
    default_value: '5'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: schema_change
    explore: activity_sessions
    listens_to_filters: []
    field: ndt_lead_source_ranking.top_rank_limit
  - name: "*"
    title: "*"
    type: field_filter
    default_value: looker^_advocado
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: schema_change
    explore: activity_sessions
    listens_to_filters: []
    field: activity_sessions.dynamic_schema