view: customers {
  sql_table_name: `sqsh-looker-project.sales_crm.customers` ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Customer_ID ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
  }
  dimension: customer_type {
    type: string
    sql: ${TABLE}.Customer_Type ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension_group: last_interaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Last_Interaction ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.Phone_Number ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id, name, leads.count, sales.count]
  }
  measure: total_customers {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
  }

  measure: unique_customers {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
  }

  measure: individual_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Individual"]
  }

  measure: business_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Business"]
  }

  measure: reseller_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Reseller"]
  }

}
