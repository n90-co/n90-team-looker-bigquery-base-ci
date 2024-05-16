## Created by: Mary
## Last edited: 2/5/24 by Mary

include: "/_base-views/brands.view.lkml"
include: "/_standard-views/ext_DRY_label.view.lkml"

view: +brands {
  extends: [ext_dry_label]

  # Overriding the table name to allow for demo schema, no matter which explore.
  sql_table_name: `bigquery-sandbox-393916.{% parameter lift_attribution.demo_schema %}{% parameter conversion_attribution.demo_schema %}{% parameter activity_sessions.demo_schema %}looker.brands` ;;

#Hiding/Renaming/Relabeling Dimensions{
  dimension: brand_id {
    view_label: "Brand"
    description: "A unique identifier by Advocado for each brand. An agency could be handling multiple brand IDs."
    hidden: yes
  }
  dimension: brand_name {
    # required_fields: [brand_id] - thought this might help with forced filtering but it didn't.
    description: "Name of brand that that is being advertised."
    view_label: "Brand"
    # hidden: yes
    label: "Brand Name"
  }

#HIDDEN BY DEFAULT IN BASE VIEW:
  # dimension: triggers__list {
  #   hidden: yes
  # }
#}

}

view: +brands__triggers__list {
  dimension: element {
    hidden: yes
  }
}
