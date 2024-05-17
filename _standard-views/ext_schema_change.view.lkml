## Created by: Mary
## Last edited: 12/18/23 by Mary

# This view is an extends view that adds parameter buttons to each of the explores to be able to swap between test/demo/prod data
# If subsequent explores are created in this project that need to allow schema changing, you need to include this filepath in explore's main view
# and add this view in the extends statement of the explore's main view

view: ext_schema_change {
  extension: required
  label: "Schema Change Parameters"

# This parameter adds a filter to the explore that allows the user to swap between test and prod data.
# This filter is only visable to those with the required access grant: can_change_schema
# Test data is only currently available for the following views: lift_attr, conv_attr, joined_attr, and activity_sessions.
  parameter: dynamic_schema{
    # hidden: yes
    label: "Test"
    view_label: "{% parameter view_label_7 %}"
    group_label: "Schema Changes"
    type: unquoted
    # hidden: yes

    required_access_grants: [n90_emp,can_change_schema]

    default_value: ""
    allowed_value: {
      label: "Production Data"
      value: ""
    }
    allowed_value: {
      label: "Test Data"
      value: "test_"
    }
  }


# This parameter adds a filter to the explore that allows the user to swap between anonymized demo data and prod data.
# This filter is only visable to those with the required access grant: can_access_demo
# Demo data is only currently available for the following views: brands, conv_attr, click_view_reports, and spots.
  parameter: demo_schema{
    label: "Demo"
    view_label: "{% parameter view_label_7 %}"
    group_label: "Schema Changes"
    type: unquoted
    # hidden: yes

    required_access_grants: [n90_emp,can_change_schema]

    default_value: ""

    allowed_value: {
      label: "Production Data"
      value: ""
    }
    allowed_value: {
      label: "Demo Data"
      value: "demo_"
    }
  }
}