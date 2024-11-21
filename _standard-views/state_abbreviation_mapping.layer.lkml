## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/state_abbreviation_mapping.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +state_abbreviation_mapping{
  extends: [ext_dry_label]

  sql_table_name: `next90-core-applications.omniData.state_abbreviation_mapping` ;;

  dimension: state {
    # hidden: yes
    view_label: "{% parameter view_label_2 %}"
    description: "State where session was created reported by our GeoIP Provider"
    sql: CASE
          WHEN ${neustar_state} = 'dc' THEN 'Maryland'
          ELSE ${TABLE}.state
         END;;
  }

  dimension: neustar_state {
    hidden: yes
  }
}