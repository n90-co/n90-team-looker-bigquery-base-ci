## Created by: Mary
## Last edited: 12/18/23 by Mary

view: ext_partitions {
  extension: required

#PARTITIONS{
  dimension: day {
    hidden: yes
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: month {
    hidden: yes
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: year {
    hidden: yes
    type: number
    sql: ${TABLE}.year ;;
  }
#}
}
