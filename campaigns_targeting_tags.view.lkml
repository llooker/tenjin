view: campaigns_targeting_tags {
  sql_table_name: tenjin.campaigns_targeting_tags ;;

  dimension: campaign_id {
    type: string
    # hidden: true
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: targeting_tag_id {
    type: number
    # hidden: true
    sql: ${TABLE}.targeting_tag_id ;;
  }

  measure: count {
    type: count
    drill_fields: [campaigns.name, campaigns.remote_campaign_id, targeting_tags.id]
  }
}
