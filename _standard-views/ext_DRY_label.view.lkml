## Created by: Mary
## Last edited: 11/21/23 by Mary

view: ext_dry_label {
  extension: required

  parameter: view_label_1 {
    hidden: yes
    # type: string
    # default_value: "Ad Spot Info"
    type: unquoted
    default_value: "Detection_Info"
  }

  parameter: view_label_2 {
    hidden: yes
    type: unquoted
    default_value: "Geography"
    # type: string
    # default_value: "Geographic Info"
  }

  parameter: view_label_3 {
    hidden: yes
    type: unquoted
    default_value: "Aggregated_Measures"
    # type: string
    # default_value: "Aggregated Measures"
  }

  parameter: view_label_4 {
    hidden: yes
    type: unquoted
    default_value: "Session_Info"
    # type: string
    # default_value: "Session Info"
  }

  parameter: view_label_5 {
    hidden: yes
    type: unquoted
    default_value: "Raw_Data"
    # type: string
    # default_value: "Raw Data"
  }

  parameter: view_label_6 {
    hidden: yes
    type: unquoted
    default_value: "DateTime"
    # type: string
    # default_value: "Date_Time"
  }

  parameter: view_label_7 {
    hidden: yes
    type: unquoted
    default_value: "Next90EmployeeOnly"
    # type: string
    # default_value: "Date_Time"
  }

#THEN - in views change label to look like this:
  # view_label: "{% parameter view_label_1 %}"

}