view: campaign_buckets {
  sql_table_name: tenjin.campaign_buckets ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_network_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ad_network_id ;;
  }

  dimension: app_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.app_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      ad_networks.id,
      ad_networks.name,
      apps.name,
      apps.id,
      campaigns.count
    ]
  }
}
