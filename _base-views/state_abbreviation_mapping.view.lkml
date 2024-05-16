# The name of this view in Looker is "State Abbreviation Mapping"
view: state_abbreviation_mapping {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-sandbox-393916.looker.state_abbreviation_mapping` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Neustar State" in Explore.

  dimension: neustar_state {
    primary_key: yes
    type: string
    sql: ${TABLE}.neustar_state ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  # measure: count {
  #   type: count
  # }
}