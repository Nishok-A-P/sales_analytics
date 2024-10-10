view: leads {
  sql_table_name: `sqsh-looker-project.sales_crm.leads` ;;
  drill_fields: [lead_id]

  dimension: lead_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Lead_ID ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Customer_ID ;;
  }
  dimension: estimated_value {
    type: number
    sql: ${TABLE}.Estimated_Value ;;
    value_format: "#,##0.00"
  }
  dimension: lead_source {
    type: string
    sql: ${TABLE}.Lead_Source ;;
  }
  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Updated_At ;;
  }
  measure: count {
    type: count
    drill_fields: [lead_id, customers.customer_id, customers.name, sales.count]
  }
  measure: total_leads {
    type: count
  }

  measure: total_estimated_value {
    type: sum
    sql: ${TABLE}.estimated_value ;;
  }

  # Filtered measures for each sales stage
  measure: new_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "New"]
  }

  measure: contacted_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "Contacted"]
  }

  measure: closed_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "Closed"]
  }

}
