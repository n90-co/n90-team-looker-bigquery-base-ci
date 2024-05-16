# include: "/logical-explores/lift_attribution.explore.lkml"

# view: ndt_goals_and_conversions {
#   derived_table: {
#     explore_source: lift_attribution {
#       column: orig_event_id { field: conversion_attribution.orig_event_id }
#       column: goal_name{field: conversion_attribution.goal_name}
#       # column: event_goal_conversion_count {field: conversion_attribution.event_goal_conversion_count}
#       bind_all_filters: yes
#     }
#   }

#   dimension: primary_key {
#     primary_key: yes
#     hidden: yes
#     sql: CONCAT(${orig_event_id}, ${goal_name});;
#   }
#   dimension: orig_event_id {hidden:yes}
#   dimension: goal_name {hidden:yes}

 # dimension: event_goal_conversion_count {
  #   hidden:yes
  #   type: number
  # }

  # measure: total_conversion_count{
  #   description: "The total number of conversions attributed to the specific goal (make sure to also select 'goal name' with this measure). Each conversion is one user web session, but a session could meet multiple goals."
  #   view_label: "Conversion Attribution"
  #   type: sum
  #   sql: ${event_goal_conversion_count} ;;
  # }

  # measure: average_conversion_count {
  #   description: "The average number of conversions attributed to the specific goal (make sure to also select 'goal name' with this measure). Each conversion is one user web session, but a session could meet multiple goals."
  #   view_label: "Conversion Attribution"
  #   hidden: yes
  #   type: average
  #   sql: ${event_goal_conversion_count} ;;
  # }

# }
