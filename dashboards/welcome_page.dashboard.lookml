---
- dashboard: welcome_to_insights_power
  title: Welcome to Insights Power!
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: g75Yg3bcEx2WYKBO7JnP2k
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Dashboard Navigation:","color":"hsl(0,
      0%, 11%)"}],"id":1702049972058},{"type":"h2","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702050070550},{"type":"h2","id":1702050069896,"children":[{"text":"In
      the table to the right, click which brand you''d like to view. ","color":"hsl(0,
      0%, 11%)"}],"indent":2},{"type":"h2","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702050076063},{"type":"h2","id":1702050075486,"children":[{"text":"Then,
      select which dashboard you''d like to see from the options listed.","color":"hsl(0,
      0%, 11%)"}]},{"type":"p","children":[{"text":"","color":"hsl(0, 0%, 11%)"}],"id":1702409540262},{"type":"p","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702409543508},{"type":"p","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702409545280},{"type":"h1","children":[{"text":"Dashboard
      Types:","color":"hsl(0, 0%, 11%)"}],"id":1702409541249},{"type":"p","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702409541250},{"type":"h3","align":"start","children":[{"text":"First-party
      Micro-Moment® Attribution Dashboard:","color":"hsl(0, 0%, 11%)"}],"id":1702409541250},

      {"type":"p","children":[{"text":"This
      dashboard displays Micro-Moment consumer engagement attribution data for first-party,
      precision watermark detections.","color":"hsl(0, 0%, 11%)"}],"id":1702410067350},

      {"type":"p","children":[{"text":"","color":"hsl(0,
      0%, 11%)"}],"id":1702409541252},

      {"type":"h3","align":"start","children":[{"text":"Web
      Session Dashboard:","color":"hsl(0, 0%, 11%)"}],"id":1702409541255},{"type":"p","children":[{"text":"This
      dashboard displays data gathered by Advocado''s tracking tag installed on the
      brand''s website.","fontSize":"14px","backgroundColor":"rgb(255, 255, 255)","color":"hsl(0,
      0%, 11%)"}],"id":1702409541256}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 15
    height: 10
  - title: Untitled
    name: Untitled
    model: bigquery_dashboards
    explore: lift_attribution
    type: looker_grid
    fields: [lift_attribution.welcome_dash_brand_links]
    filters:
      lift_attribution.local_start_date_filter: 30 days
    sorts: [lift_attribution.welcome_dash_brand_links]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '30'
    rows_font_size: '25'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: next90-colors
      custom:
        id: da139382-fdb6-f328-1593-6464921e94f4
        label: Custom
        type: discrete
        colors:
        - "#0504AA"
        - "#22A2F2"
        - "#F28F16"
        - "#29282A"
        - "#D9D6D2"
        # - "#669ed1"
        # - "#8cb5de"
        # - "#b3cfe8"
        # - "#4d2987"
        # - "#7054a1"
        # - "#9480b8"
        # - "#b8abcf"
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      lift_attribution.welcome_dash_brand_links: Brands
    series_text_format:
      lift_attribution.welcome_dash_brand_links:
        fg_color: "#29282A"
        align: left
    header_font_color: "#0504AA"
    rotation: false
    defaults_version: 1
    hidden_pivots: {}
    title_hidden: true
    listen: {}
    row: 0
    col: 15
    width: 9
    height: 10
