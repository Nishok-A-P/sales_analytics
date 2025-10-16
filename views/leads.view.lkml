view: leads {
  sql_table_name: `sqsh-looker-project.sales_crm.leads` ;;
  drill_fields: [lead_id]


  #            DIMENSIONS           #

  dimension: lead_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Lead_ID ;;
    description: "Unique identifier for each lead."
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
    description: "Timestamp when the lead was created."
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_ID ;;
    description: "Reference to the customer associated with this lead."
  }

  dimension: estimated_value {
    type: number
    sql: ${TABLE}.Estimated_Value ;;
    value_format: "#,##0.00"
    description: "Estimated monetary value of this lead."
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.Lead_Source ;;
    description: "Source from which the lead originated (e.g., Email, Referral)."
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
    description: "Current stage of the lead in the sales process (New, Contacted, Closed)."
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Updated_At ;;
    description: "Timestamp when the lead was last updated."
  }

  #              MEASURES           #

  measure: count {
    type: count
    drill_fields: [lead_id, customers.customer_id, customers.name, sales.count]
    description: "Total number of lead records."
  }

  measure: total_leads {
    type: count
    description: "Count of all leads."
  }

  measure: total_estimated_value {
    type: sum
    sql: ${TABLE}.estimated_value ;;
    description: "Total estimated value summed across all leads."
  }

  # Filtered measures by stage
  measure: new_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "New"]
    description: "Number of leads in 'New' stage."
  }

  measure: contacted_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "Contacted"]
    description: "Number of leads in 'Contacted' stage."
  }

  measure: closed_leads_count {
    type: count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: [stage: "Closed"]
    description: "Number of leads in 'Closed' stage."
  }

}
