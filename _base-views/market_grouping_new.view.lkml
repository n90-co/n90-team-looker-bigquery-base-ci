view: market_grouping {
  sql_table_name: `next90-core-applications.test_looker.market_grouping` ;;

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id ;;
  }
  dimension: dma_id {
    type: string
    sql: ${TABLE}.dma_id ;;
  }
  dimension: dma_name {
    type: string
    sql: ${TABLE}.dma_name ;;
  }
  dimension: market_group_id {
    type: string
    sql: ${TABLE}.market_group_id ;;
  }
  dimension: market_group_name {
    type: string
    sql: ${TABLE}.market_group_name ;;
  }
  dimension: neustar_id {
    type: number
    sql: ${TABLE}.neustar_id ;;
  }
  measure: count {
    type: count
    drill_fields: [market_group_name, dma_name]
  }
}