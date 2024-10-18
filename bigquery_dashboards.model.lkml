#Last edited: 2/5/24 by Mary

connection: "advocado-bq-datalake"
label: "Customer Dashboards"

# include: "/logical-explores/activity_sessions.explore.layer.lkml"
include: "/logical-explores/activity_sessions.explore.lkml"
include: "/logical-explores/lift_attribution.explore.lkml"
include: "/logical-explores/lift_attribution_new_baseline.explore.lkml"

include: "/dashboards/first-party_attribution.dashboard.lookml"
include: "/dashboards/first-party_attribution_airings.dashboard.lookml"
include: "/dashboards/competitive_attribution.dashboard.lookml"
include: "/dashboards/sessions.dashboard.lookml"
include: "/dashboards/welcome_page.dashboard.lookml"
include: "/dashboards/welcome_page_2.dashboard.lookml"

datagroup: bigquery_dashboards_default_datagroup {
  sql_trigger: SELECT MAX(event_start_time) FROM lift_attribution;;
  max_cache_age: "24 hours"
}

persist_with: bigquery_dashboards_default_datagroup

access_grant: can_change_schema {
  user_attribute: can_change_schema
  allowed_values: [ "yes"]
}

access_grant: can_access_demo {
  user_attribute: can_access_demo
  allowed_values: [ "yes"]
}

access_grant: n90_emp {
  user_attribute: n90_emp
  allowed_values: ["yes"]
}


map_layer: lower48_dmas {
  file: "/map/nielsentopo.json"
  # url: "https://raw.githubusercontent.com/simzou/nielsen-dma/master/nielsentopo.json"
  # feature_key: "neustar_id"  # The GeoJSON property to join on
  label: "DMA Map"
  property_key: "neustar_dma_id"  # The name of the property to use for display
  property_label_key: "dma1"
  # projection: "mercator"  # Define the projection (most common: "mercator")
}

map_layer: az_zips {
  file: "/map/az_arizona_zip_codes.topojson"
  # url: "https://raw.githubusercontent.com/OpenDataDE/State-zip-code-GeoJSON/master/az_arizona_zip_codes_geo.min.json"
  # feature_key: "neustar_id"  # The GeoJSON property to join on
  label: "DMA Map"
  property_key: "zip_code"  # The name of the property to use for display
  # property_label_key: "dma1"
  # projection: "mercator"  # Define the projection (most common: "mercator")
}

map_layer: combined_us_canada_dmas {
  file: "/map/cleaned_new_combined_US_CANADA_dmas.geojson"
  # url: "https://raw.githubusercontent.com/simzou/nielsen-dma/master/nielsentopo.json"
  # feature_key: "DMA"  # The GeoJSON property to join on
  label: "DMA Map"
  property_key: "neustar_id"  # The name of the property to use for display
  property_label_key: "dma_name"
  # projection: "albers"  # Define the projection (most common: "mercator")
}

# explore: kinetiq_occurrences {}

# explore: brands {
#     join: brands__triggers__list {
#       view_label: "Brands: Triggers List"
#       sql: LEFT JOIN UNNEST(${brands.triggers__list}) as brands__triggers__list ;;
#       relationship: one_to_many
#     }
# }

# explore: activity_sessions {
#   join: brands {
#     type: left_outer
#     sql_on: ${activity_sessions.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: conversion_attribution {
#   join: brands {
#     type: left_outer
#     sql_on: ${conversion_attribution.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }

#   join: dmas {
#     type: left_outer
#     sql_on: ${conversion_attribution.dma_id} = ${dmas.dma_id} ;;
#     relationship: many_to_one
#   }
# }

# # To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# # Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# # Each joined view also needs to define a primary key.

# explore: dmas {}

# explore: click_view_reports {}

# explore: lift_attribution {
#   join: dmas {
#     type: left_outer
#     sql_on: ${lift_attribution.dma_id} = ${dmas.dma_id} ;;
#     relationship: many_to_one
#   }

#   join: brands {
#     type: left_outer
#     sql_on: ${lift_attribution.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: joined_implicit_attribution {
#   join: dmas {
#     type: left_outer
#     sql_on: ${joined_implicit_attribution.dma_id} = ${dmas.dma_id} ;;
#     relationship: many_to_one
#   }

#   join: brands {
#     type: left_outer
#     sql_on: ${joined_implicit_attribution.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }

#   join: activity_sessions {
#     type: left_outer
#     sql_on: ${joined_implicit_attribution.activity_session_id} = ${activity_sessions.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: brand_central_products {
#   join: brands {
#     type: left_outer
#     sql_on: ${brand_central_products.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }
#     join: brand_central_products__product_markets__list {
#       view_label: "Brand Central Products: Product Markets List"
#       sql: LEFT JOIN UNNEST(${brand_central_products.product_markets__list}) as brand_central_products__product_markets__list ;;
#       relationship: one_to_many
#     }
# }

# explore: spots {
#   join: brands {
#     type: left_outer
#     sql_on: ${spots.brand_id} = ${brands.brand_id} ;;
#     relationship: many_to_one
#   }
# }
