view: t_sub_commute_transport {
  sql_table_name: `subdw_hands_on.t_sub_commute_transport`
    ;;

  dimension: commute_cd {
    type: string
    sql: ${TABLE}.commute_cd ;;
  }

  dimension_group: created_ymd {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_ymd ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: passenger_cd {
    type: string
    sql: ${TABLE}.passenger_cd ;;
  }

  dimension: sub_line_nm {
    type: string
    sql: ${TABLE}.sub_line_nm ;;
  }

  dimension: time_range_cd {
    type: string
    sql: ${TABLE}.time_range_cd ;;
  }

  measure: total_off_count {
    type: number
    label: "하차인원"
    sql: sum(${TABLE}.total_off_count) ;;
  }

  measure: total_on_count {
    type: number
    label: "승차인원"
    sql: sum(${TABLE}.total_on_count) ;;
  }

  # measure: foot_passenger_cnt {
  #   type :  number
  #   label : "유동인구"
  #   sql :  (${total_on_count} + ${total_off_count})  ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}
