view: campaigns {
  sql_table_name: `sqsh-looker-project.marketing_analytics.campaigns` ;;
  drill_fields: [campaign_id]

  dimension: campaign_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_id, name, interactions.count, social_media_engagement.count]
  }
  measure: total_budget_used {
    type: sum
    sql: ${budget} ;;
    label: "Total Budget Used"
  }

  measure: average_budget_per_campaign {
    type: average
    sql: ${budget} ;;
    label: "Average Budget per Campaign"
  }

  measure: number_of_campaigns {
    type: number
    sql: count(${campaign_id}) ;;
    label: "Number of Campaigns"
  }

  measure: campaign_duration_days {
    type: sum
    sql: DATETIME_DIFF(DATETIME((TIMESTAMP(${end_date} ))), DATETIME((TIMESTAMP(${start_date} ))), DAY) ;;
    label: "Campaign Duration (Days)"
  }

  measure: cost_per_day {
    type: number
    sql: ${total_budget_used} / NULLIF(${campaign_duration_days}, 0) ;;
    label: "Daily Cost of Campaign"
  }

  set: details {
    fields: [campaign_id, name, type, budget, start_date, end_date, count, total_budget_used, average_budget_per_campaign, number_of_campaigns, campaign_duration_days, cost_per_day]
  }
}
