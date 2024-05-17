---
- dashboard: competitive_micromoment_attribution_dashboard
  title: Competitive Micro-Moment® Attribution Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: This dashboard displays micro-moment consumer engagement attribution
    data for competitive, ACR fingerprint detections.
  refresh: 1 day
  filters_location_top: false
  preferred_slug: gtPzHgDJ2V5kj4Cohes1xJ
  elements:
  - title: Detection Count
    name: Detection Count
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.count_detections]
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
    single_value_title: Total Detections
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Record of Advocado’s Systems receiving and recording a signal that
      a Fingerprint ACR Product TV spot aired on a specific TV station for one of
      your chosen competitors.
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 1
    col: 0
    width: 5
    height: 4
  - title: Average Percent Lift
    name: Average Percent Lift
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.average_percent_lift_per_detection]
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
    custom_color: "#78b34d"
    single_value_title: Average Lift per Detection
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Percent Lift is the relative increase in sessions during a Micro-Moment
      versus how many sessions we expected (i.e., the baseline count). It is calculated
      by taking weighted session lift divided by baseline session count. We calculate
      this value for each detection and aggregate it as an average percent increase.
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 1
    col: 5
    width: 5
    height: 4
  - title: Weighted Session Lift
    name: Weighted Session Lift
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.total_weighted_session_lift]
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
    custom_color: "#22A2F2"
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The incremental increase in sessions that your site received during
      the Micro-Moment compared to the expected sessions based on the visits in the
      5 minutes before the detection. Sessions are split with equal weight in the
      occurrence of overlapping Micro-Moments. '
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 1
    col: 10
    width: 6
    height: 4
  - title: Lift by Week
    name: Lift by Week
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_line
    fields: [lift_attribution.local_start_week, lift_attribution.count_detections,
      lift_attribution.average_percent_lift_per_detection, lift_attribution.total_weighted_session_lift]
    fill_fields: [lift_attribution.local_start_week]
    sorts: [lift_attribution.local_start_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 11, type: linear}]
    x_axis_label: Week Start Date
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 5
    col: 0
    width: 8
    height: 6
  - title: Lift by Day
    name: Lift by Day
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_line
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, lift_attribution.local_start_date]
    fill_fields: [lift_attribution.local_start_date]
    filters: {}
    sorts: [lift_attribution.local_start_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 5
    col: 8
    width: 8
    height: 6
  - title: Lift by Competitor
    name: Lift by Competitor
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_bar
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, lift_attribution.competitor_name]
    sorts: [lift_attribution.count_detections desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      lift_attribution.count_detections: scatter
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Showing Top 10 by Number of Detections (explore data to see more)
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 1
    col: 16
    width: 8
    height: 9
  - title: Lift by Day Part
    name: Lift by Day Part
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_bar
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, lift_attribution.day_part]
    fill_fields: [lift_attribution.day_part]
    sorts: [lift_attribution.day_part]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      lift_attribution.count_detections: scatter
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 11
    col: 0
    width: 8
    height: 11
  - title: Lift by Affiliate
    name: Lift by Affiliate
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_bar
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, lift_attribution.updated_affiliate]
    sorts: [lift_attribution.count_detections desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: true
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      lift_attribution.count_detections: scatter
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Showing Top 10 by Number of Detections (explore data to see more)
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 11
    col: 8
    width: 8
    height: 11
  - title: Lift by Market/Media Type
    name: Lift by Market/Media Type
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_bar
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, dmas.name]
    sorts: [lift_attribution.count_detections desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      lift_attribution.count_detections: scatter
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Showing Top 10 by Number of Detections (explore data to see more)
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 10
    col: 16
    width: 8
    height: 10
  - type: button
    name: button_706
    rich_content_json: '{"text":"Advocado® Attribution Methodology","description":"","newTab":true,"alignment":"right","size":"medium","style":"FILLED","color":"#78b34d","href":"https://drive.google.com/file/d/1ZagNrso_1z9dKye1fOb-0NRYpYMvLSDP/view?usp=drive_link"}'
    row: 20
    col: 16
    width: 8
    height: 1
  - type: button
    name: button_707
    rich_content_json: '{"text":"Key Terms","description":"","newTab":true,"alignment":"right","size":"medium","style":"FILLED","color":"#22A2F2","href":"https://docs.google.com/document/d/1g7sDRf1guudKUd700WDGDbMkQE6UErh3ALNn2NeDIDQ/edit?usp=sharing"}'
    row: 21
    col: 16
    width: 8
    height: 1
  - title: Lift by Genre
    name: Lift by Genre
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_bar
    fields: [lift_attribution.count_detections, lift_attribution.average_percent_lift_per_detection,
      lift_attribution.total_weighted_session_lift, wwtv_programs.genre]
    filters:
      wwtv_programs.genre: "-NULL"
    sorts: [lift_attribution.count_detections desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: lift_attribution.average_percent_lift_per_detection,
            id: lift_attribution.average_percent_lift_per_detection, name: Average
              Percent Lift per Detection}], showLabels: true, showValues: true, valueFormat: 0\%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: lift_attribution.total_weighted_session_lift,
            id: lift_attribution.total_weighted_session_lift, name: Total Weighted
              Session Lift}], showLabels: true, showValues: true, valueFormat: "#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: lift_attribution.count_detections,
            id: lift_attribution.count_detections, name: Number of Detections}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      lift_attribution.count_detections: scatter
    series_colors:
      lift_attribution.count_detections: "#0504AA"
      lift_attribution.total_weighted_session_lift: "#22A2F2"
    custom_color_enabled: true
    custom_color: "#22A2F2"
    show_single_value_title: true
    single_value_title: Total Weighted Session Lift
    value_format: "#,##0.00"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Showing Top 10 by Number of Detections (explore data to see more).
      Genre data only available starting 8/13/2023.
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 22
    col: 0
    width: 8
    height: 11
  - title: First Party Navigation Button
    name: First Party Navigation Button
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.first_party_dash_button]
    sorts: [lift_attribution.first_party_dash_button]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4A7820",
        font_color: !!null '', color_application: {collection_id: next90-colors,
          palette_id: next90-colors-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    defaults_version: 1
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 0
    col: 16
    width: 8
    height: 1
  - title: Sessions Dashboard Navigation Button
    name: Sessions Dashboard Navigation Button
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.session_dash_button]
    sorts: [lift_attribution.session_dash_button]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Customer Markets: market_grouping.customer_markets
      DMA Name/Media Type: dmas.name
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 0
    col: 8
    width: 8
    height: 1
  - title: Welcome Dashboard Navigation
    name: Welcome Dashboard Navigation
    model: bigquery_dashboards
    explore: lift_attribution
    type: single_value
    fields: [lift_attribution.return_to_welcome_dash_button]
    sorts: [lift_attribution.return_to_welcome_dash_button]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Airing Type: lift_attribution.airing_type
      Power-Moment Type: lift_attribution.powermoment_type
      Spot Length: lift_attribution.spot_length
      Weekday/Weekend: lift_attribution.weekday_or_weekend
      Day of Week: lift_attribution.local_start_day_of_week
      Brand Filter: brands.brand_filter
      Date Filter in Local Time: lift_attribution.local_start_date_filter
    row: 0
    col: 0
    width: 8
    height: 1
  filters:
  - name: Brand Filter
    title: Brand Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: brands.brand_filter
  - name: Airing Type
    title: Airing Type
    type: field_filter
    default_value: Competitive
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options:
      - Competitive
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: lift_attribution.airing_type
  - name: Date Filter in Local Time
    title: Date Filter in Local Time
    type: field_filter
    default_value: 30 day ago for 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: lift_attribution.local_start_date_filter
  - name: Customer Markets
    title: Customer Markets
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: [Brand Filter, Airing Type, Date Filter in Local Time]
    field: market_grouping.customer_markets
  - name: Power-Moment Type
    title: Power-Moment Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: lift_attribution.powermoment_type
  - name: Spot Length
    title: Spot Length
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: [Brand Filter, Airing Type, Date Filter in Local Time, Customer
        Markets]
    field: lift_attribution.spot_length
  - name: Weekday/Weekend
    title: Weekday/Weekend
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - Weekday
      - Weekend
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: lift_attribution.weekday_or_weekend
  - name: Day of Week
    title: Day of Week
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: []
    field: lift_attribution.local_start_day_of_week
  - name: DMA Name/Media Type
    title: DMA Name/Media Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: bigquery_dashboards
    explore: lift_attribution
    listens_to_filters: [Brand Filter, Airing Type, Date Filter in Local Time, Customer
        Markets]
    field: dmas.name