## Created by: Mary
## Last edited: 2/5/24 by Mary

view: ext_adv_brand_filter {
  extension: required

  parameter: adv_brand_filter {
    required_access_grants: [n90_emp]
    view_label: "{% parameter view_label_7 %}"
    label: "Brand Filter for Advocado team"
    description: "Slightly improves query time versus Brand Name Filter"
    # view_label: "Brand"
    type: string
    suggest_dimension: brand_name_plus_id
  }

  dimension: brand_name_plus_id {
    label: "Brand Filter for Advocado team"
    type: string
    hidden: yes
    # sql: CONCAT(${brand_id},'-',${brands.brand_name}) ;;
    sql: CONCAT(${brands.brand_name},'-',${brand_id}) ;;
  }

}