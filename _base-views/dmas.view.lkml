# The name of this view in Looker is "Dmas"
view: dmas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: (SELECT dma_id, kantar_region,  case when (neustar_id > 0) then neustar_id else 808080.0 end as neustar_id, name, timezone FROM `next90-core-applications.omniData.dmas`) ;;
  # sql_table_name: `next90-core-applications.omniData.dmas` ;;
  drill_fields: [dma_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: dma_id {
    primary_key: yes
    type: string
    description: "Next90 DMA ID"
    sql: ${TABLE}.dma_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kantar Region" in Explore.

  dimension: kantar_region {
    type: string
    description: "Geographic Region"
    sql: ${TABLE}.kantar_region ;;
  }

  dimension: name {
    type: string
    description: "DMA Name"
    sql: ${TABLE}.name ;;
  }

  dimension: neustar_id {
    type: number
    description: "Neustar DMA ID"
    sql: ${TABLE}.neustar_id ;;
  }

  dimension: timezone {
    type: string
    description: "Timezone of the DMA"
    sql: ${TABLE}.timezone ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [dma_id, name, lift_attribution.count]
  # }
}