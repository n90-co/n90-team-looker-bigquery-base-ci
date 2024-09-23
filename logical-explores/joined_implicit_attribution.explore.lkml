# NO LONGER USED as of 10/23/23. Replaced by just a left join from activity_sessions to joined_implicit_attribution.
# Created by: Mary
# Last Updated on 10/23/23 by Mary

include: "/_standard-views/joined_implicit_attribution.layer.lkml"
include: "/_standard-views/dmas.layer.lkml"
include: "/_standard-views/brand_central_products.layer.lkml"
# include: "/_standard-views/kinetiq_occurrences.layer.lkml"
include: "/_standard-views/pdt_kinetiq_creatives.view.lkml"


#ONLY created to make a subquery NDT
explore: joined_implicit_attribution {
  hidden: yes


  # Exclude DMAs based on user attribute
  # sql_always_where: ${dmas.name} NOT IN ({{ _user_attributes['excluded_dmas'] | split: ',' | array_to_string }}) ;;


  join: dmas {
    type: left_outer
    sql_on: ${joined_implicit_attribution.dma_id} = ${dmas.dma_id};;
    relationship: many_to_one
  }




  join: brand_central_products {
    type: left_outer
    sql_on: ${joined_implicit_attribution.sub_trigger_id} = CAST(${brand_central_products.orig_product_id} AS STRING) ;;
    relationship: many_to_one
  }

  # join: kinetiq_occurrences {
  #   type: left_outer
  #   sql_on: ${joined_implicit_attribution.sub_trigger_id}=${kinetiq_occurrences.creative_resource_id} AND
  #           ${joined_implicit_attribution.event_start_date} = ${kinetiq_occurrences.start_time_utc_date};;
  #   relationship: many_to_many
  # }

  join: pdt_kinetiq_creatives {
    type: left_outer
    sql_on: ${joined_implicit_attribution.sub_trigger_id}=${pdt_kinetiq_creatives.creative_resource_id} ;;
    relationship: many_to_one
  }
}
