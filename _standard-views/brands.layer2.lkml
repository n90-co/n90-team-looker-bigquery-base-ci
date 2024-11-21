## Created by: Mary
## Last edited: 2/5/24 by Mary

include: "/_standard-views/brands.layer.lkml"

view: +brands {

filter: brand_filter {
  label: "Brand Filter"
  view_label: "Brand"
  type: string
  sql: {% condition brands.brand_filter %}${brand_name}{% endcondition %};;
  suggest_dimension: brands.brand_name
}

# DID NOT GO THIS ROUTE - slowed query down{
# dimension: switch_name_to_id {
  #   type: string
  #   sql: SELECT DISTINCT ${brands.brand_id} FROM `looker.brands` WHERE {% condition brand_filter %} ${brands.brand_name} {% endcondition %};;
  # }
#}

## DID NOT GO THIS ROUTE - several reasons {
## 1. showed ALL brands to other customers. Probably could have put an access filter to make it work... BUT
## 2. Not scalable

# parameter: brand_id_name_mapping {
#   label: "Brand Filter"
#   description: "This filter is used to show just one brand at a time. Using this filter will increase query times."
#   view_label: "Brand"
#   # hidden: yes
#   type: unquoted
#   allowed_value: {
#     label: "72 Sold-Seller"
#     value: "62f5529b226681547a94a798"
#   }
#   allowed_value: {
#     label: "Next90"
#     value: "5c4fa0a9d90b2d00411bdd3f"
#   }
#   allowed_value: {
#     label: "AscensionComplete"
#     value: "5fa463ba4abed55befb6f9eb"
#   }
#   allowed_value: {
#     label: "Athletic Greens"
#     value: "63a0868d42509a768999017b"
#   }
#   allowed_value: {
#     label: "BCBSLA"
#     value: "5bdb4d6f5d2ba6003fe04a18"
#   }
#   allowed_value: {
#     label: "Bridge Legal"
#     value: "63bc453b0c13f6768f749dfd"
#   }
#   allowed_value: {
#     label: "Bridge Legal Fire Foam"
#     value: "649c996e452e2c08a15927fe"
#   }
#   allowed_value: {
#     label: "Brothers Buy Homes"
#     value: "6489fed9452e2c08a14e3975"
#   }
#   allowed_value: {
#     label: "Credible"
#     value: "646d050cfecd0f14f8a430d1"
#   }
#   allowed_value: {
#     label: "Doug Hopkins"
#     value: "631b60bcb63cb17fc806c589"
#   }
#   allowed_value: {
#     label: "Easterns Automotive Group"
#     value: "5d1bba52fbc0567c3be8d17d"
#   }
#   allowed_value: {
#     label: "Essence"
#     value: "624dfcaee48f5e0d04a49ee6"
#   }
#   allowed_value: {
#     label: "Fight Colorectal Cancer"
#     value: "63dae3ada0ea35176de169a3"
#   }
#   allowed_value: {
#     label: "FrameBridge"
#     value: "646fcb7eb05d3221159603b7"
#   }
#   allowed_value: {
#     label: "Ken Nugent"
#     value: "6553943116767a7304c07aa8"
#   }
#   allowed_value: {
#     label: "LYBALVI HCP"
#     value: "644bce6423688d70de80876f"
#   }
#   allowed_value: {
#     label: "Lybalvi DTC"
#     value: "642c7e2937dd9427ae61f400"
#   }
#   allowed_value: {
#     label: "NEXTGEN TV"
#     value: "649c3e374ae025089be00a28"
#   }
#   allowed_value: {
#     label: "Precision Air and Plumbing"
#     value: "65319c4722db0f276b4a2d87"
#   }
#   allowed_value: {
#     label: "Product Madness"
#     value: "62164a56e917fe25fe448b74"
#   }
#   allowed_value: {
#     label: "RAFI LAW GROUP"
#     value: "641b0437ddc0740b05460e80"
#   }
#   allowed_value: {
#     label: "SANDALS"
#     value: "649db01c7b4ff606f333c546"
#   }
#   allowed_value: {
#     label: "SelltoBobby"
#     value: "6489d5bc4ae025089bd4cede"
#   }
#   allowed_value: {
#     label: "Sokolove"
#     value: "6410f6ada2ff06241f81005e"
#   }
#   allowed_value: {
#     label: "Tastytrade"
#     value: "651d61cc16767a730492e7db"
#   }
#   allowed_value: {
#     label: "WHOOP"
#     value: "6481eaa03f3ad9678abcc337"
#   }
#   allowed_value: {
#     label: "WellCareNow"
#     value: "5c781dff47ffd40ce2cb5911"
#   }
# }
#}
}