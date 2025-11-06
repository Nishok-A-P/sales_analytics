view: interactions {
  sql_table_name: sqsh-looker-project.marketing_analytics.interactions ;;
  drill_fields: [interaction_id]

  dimension: interaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.interaction_id ;;
  }
  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: campaign_ratings {
    type: number
    sql: ${TABLE}.campaign_ratings ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  dimension: feedback {
    type: string
    sql: ${TABLE}.feedback ;;
  }
  dimension_group: interaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.interaction_date ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: avg_campaign_ratings {
    type: average
    sql: ${campaign_ratings};;
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      interaction_id,
      customers.last_name,
      customers.customer_id,
      customers.first_name,
      campaigns.name,
      campaigns.campaign_id
    ]
  }

}
