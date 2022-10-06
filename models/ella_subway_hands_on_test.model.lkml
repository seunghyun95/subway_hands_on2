connection: "ella_subway_handson"

# include all the views
include: "/views/**/*.view"

datagroup: ella_subway_hands_on_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ella_subway_hands_on_test_default_datagroup

explore: t_sub_mas_holiday {}

explore: t_sub_line_passenger_type {}

explore: t_sub_mas_passenger_type {}

explore: t_sub_card {}

explore: t_sub_commute_transport {
  from :  t_sub_commute_transport
  label : "출퇴근 시간대 수송현황"
  join : t_sub_mas_time_range {
    type: left_outer
    relationship: many_to_one
    sql_on: ${t_sub_commute_transport.time_range_cd} = ${t_sub_mas_time_range.time_range_cd} ;;
  }
}

explore: t_sub_etl_log {}

explore: t_sub_mas_time_range {}

explore: t_sub_passenger {}

explore: t_sub_mas_station_info {}

explore: t_sub_transport {}

# explore: bm_f_card_subway_dd {
#   from: bm_f_card_subway_dd
#   label: "card_subway"
#   join: bm_f_card_subway_line {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${bm_f_card_subway_dd.dt_date} = ${bm_f_card_subway_line.dt_date}
#       and ${bm_f_card_subway_dd.subway_line_nm} = ${bm_f_card_subway_line.subway_line_nm}
#       ;;
#   }
#   sql_always_where: ${bm_f_card_subway_dd.period} = 'yes' ;;
# }
