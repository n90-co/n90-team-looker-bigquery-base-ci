# The name of this view in Looker is "Brands"
view: brands {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker.brands` ;;
  drill_fields: [brand_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: brand_id {
    primary_key: yes
    type: string
    description: "A unique identifier by Advocado for each brand. Individual report exports are only going to have one brand ID, but an agency could be handling multiple brand exports"
    sql: ${TABLE}.brand_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand Name" in Explore.

  dimension: brand_name {
    type: string
    description: "Brand name associated with this data"
    sql: ${TABLE}.brand_name ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: triggers__list {
    hidden: yes
    sql: ${TABLE}.triggers.list ;;
    group_label: "Triggers"
    group_item_label: "List"
  }
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#   brand_id,
#   brand_name,
#   activity_sessions.count,
#   conversion_attribution.count,
#   lift_attribution.count,
#   joined_implicit_attribution.count,
#   brand_central_products.count,
#   spots.count
#   ]
#   }

}

# The name of this view in Looker is "Brands Triggers List"
view: brands__triggers__list {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Element" in Explore.

  dimension: element {
    type: string
    sql: ${TABLE}.element ;;
  }
}