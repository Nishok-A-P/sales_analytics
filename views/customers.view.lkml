view: customers {
  sql_table_name: `sqsh-looker-project.sales_crm.customers` ;;
  drill_fields: [customer_id]

  # Dimensions
  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Customer_ID ;;
    description: "Unique identifier assigned to each customer in the system."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    description: "Full name of the customer."
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
    description: "Email address associated with the customer."
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.Phone_Number ;;
    description: "Primary contact number of the customer."
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
    description: "Mailing or physical address of the customer."
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.Customer_Type ;;
    description: "Type of customer: Individual, Business, Reseller."
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
    description: "State where the customer is located."
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country ;;
    description: "Country where the customer is located."
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
    description: "Geographical region of the customer."
  }

  # Dimension Groups
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
    description: "Timestamp when the customer record was created."
  }

  dimension_group: last_interaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Last_Interaction ;;
    description: "Timestamp of the most recent customer interaction."
  }

  # Measures
  measure: count {
    type: count
    drill_fields: [customer_id, name, leads.count, sales.count]
    description: "Total number of customer records."
  }

  measure: total_customers {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    description: "Total number of unique customers."
  }

  measure: unique_customers {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    description: "Number of distinct customers (same as total_customers)."
  }

  measure: individual_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Individual"]
    description: "Count of unique customers categorized as 'Individual'."
  }

  measure: business_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Business"]
    description: "Count of unique customers categorized as 'Business'."
  }

  measure: reseller_customers_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    filters: [customer_type: "Reseller"]
    description: "Count of unique customers categorized as 'Reseller'."
  }
}
