view: ext_dynamic_rank {
  extension: required

  parameter: max_rank {
    type: number
  }

  dimension: rank_limit {
    type: number
    sql: {% parameter max_rank %} ;;
  }

}
