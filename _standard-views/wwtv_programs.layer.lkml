## Created by: Mary
## Last edited: 2/2/24 by Mary

include: "/_base-views/wwtv_programs.view.lkml"
include: "/_standard-views/ext_partitions.view.lkml"

view: +wwtv_programs {
label: "TV Program Data"
  extends: [ext_partitions]

  sql_table_name: `next90-core-applications.omniData.wwtv_programs` ;;

#primary key
  dimension: program_uuid {
    primary_key: yes
    description: ""
    # hidden: yes
  }

#MEASURES AUTO-CREATED TO HIDE{
  measure: total_gmt_offset {
    hidden: yes
  }
  measure: average_gmt_offset {
    hidden: yes
  }
  measure: count {
    hidden: yes
  }
#}

#Hiding/Renaming/Relabeling Dimensions{
  dimension: affiliate {
    description: "A call-sign designation indicating the content provider is associated with or operated by a national network."
    hidden: yes
  }
  dimension_group: air_datetime_utc {
    description: "The airing date and time of the associated PROGRAM_ID expressed in UTC."
    hidden: yes
  }
  dimension: call_sign {
    description: "A designation indicating the content provider’s common Red Bee Media reference or FCC name."
    hidden: yes
  }
  dimension: categories {
    description: "A concatenated list of additional content classifications used to define a program’s subject matter more precisely."
    # hidden: yes
  }
  dimension: daylight_saving {
    description: ""
    hidden: yes
  }
  dimension: descriptions {
    description: "The full description of a program."
    # hidden: yes
  }
  dimension_group: end_datetime_utc {
    description: ""
    hidden: yes
  }
  dimension: episode_number {
    description: "A value indicating the primary identifier of the episodic content."
    # hidden: yes
  }
  dimension: episode_title {
    description: "A value indicating the title of the episode."
    # hidden: yes
  }
  dimension: full_station_name {
    description: "A detailed designation of the content provider’s full name that may include additional information such as location and affiliation."
    hidden: yes
  }
  dimension: genre {
    description: "A detailed description that provides a generalized classification of the program’s content."
    # hidden: yes
  }
  dimension: gmt_offset {
    description: "A designation of the content provider’s time offset from UTC expressed in minutes."
    hidden: yes
  }
  dimension: master_channel_id {
    description: "Next90 ID"
    hidden: yes
  }
  dimension: monitored_channel_id {
    description: "Next90 ID"
    hidden: yes
  }
  dimension: mpaa_rating {
    description: "A value indicating the content rating assigned by the Motion Picture Association."
    # hidden: yes
  }
  dimension: new_repeat {
    description: "A designation that denotes if an In-Production program has or has not aired previously on its station of origination."
    # hidden: yes
  }
  dimension_group: orig_airdate {
    description: "A value indicating either the first date of broadcast or theatrical release associated to a program."
    # hidden: yes
  }
  dimension: parent_id {
    description: "A foreign key to program.PROGRAM_ID used to associate episodic content."
    hidden: yes
  }
  dimension: program_id {
    description: "A primary key populated with a sequential identity that identifies the referenced program."
    hidden: yes
  }
  dimension: runtime {
    description: "A designation that represents the derived duration of a program’s airing expressed in minutes."
    # hidden: yes
  }
  dimension: season_ep_number {
    description: "A pairing of broadcast season and an associated chronological episode designation separated by a dash.  For example, 01-15 would indicate the record was the fifteenth original episode that aired during the first season."
    # hidden: yes
  }
  dimension: season_finale {
    description: "A flag indicating the program is the final episode in a program’s current season."
    # hidden: yes
  }
  dimension: season_premiere {
    description: "A flag indicating the program is the first episode of a returning series following its season finale."
    # hidden: yes
  }
  dimension: series_finale {
    description: "A flag indicating the final episode of a cancelled series."
    # hidden: yes
  }
  dimension: series_premiere {
    description: "A flag indicating the program is the first episode of a new series."
    # hidden: yes
  }
  dimension: show_type {
    description: "A designation of the program's primary classification."
    # hidden: yes
  }
  dimension: stat_type {
    description: "A designation of the content provider’s classification."
    # hidden: yes
  }
  dimension: station_id {
    description: "A primary key populated with a sequential identity that identifies the content provider being referenced."
    hidden: yes
  }
  dimension: station_of_origination {
    description: "A designation indicating the station call sign linked to the original broadcast of the associated program."
    # hidden: yes
  }
  dimension: syn_type {
    description: "A designation that indicates the type of syndication currently associated to the program."
    # hidden: yes
  }
  dimension: title {
    description: "The full title of a program."
    # hidden: yes
  }
  dimension: tvrating {
    description: "A designation indicating the airing level TV Rating assigned to the program."
    # hidden: yes
  }
#}
}