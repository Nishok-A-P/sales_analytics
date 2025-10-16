view: sales {
  sql_table_name: `sqsh-looker-project.sales_crm.sales` ;;
  drill_fields: [sales_id]

  #            DIMENSIONS           #

  dimension: sales_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Sales_ID ;;
    description: "Unique identifier for each sale."
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_ID ;;
    description: "Reference to the customer who made the purchase."
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.Lead_ID ;;
    description: "Reference to the lead associated with this sale."
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.Product_ID ;;
    description: "Reference to the product sold."
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
    description: "Number of units sold in this sale."
  }

  dimension_group: sale {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Sale_Date ;;
    description: "Date and time when the sale occurred."
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.Total_Amount ;;
    value_format: "#,##0.00"
    description: "Total amount of the sale."
  }

  #              MEASURES           #

  measure: count {
    type: count
    drill_fields: [sales_id]
    description: "Total number of sales records."
  }

  measure: total_sales {
    type: count
    value_format: "#,##0.00"
    description: "Total number of sales transactions."
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.Total_Amount ;;
    value_format: "#,##0.00"
    description: "Sum of total amount across all sales."
  }

  measure: total_quantity_sold {
    type: sum
    sql: ${TABLE}.Quantity ;;
    value_format: "#,##0.00"
    description: "Total quantity of products sold."
  }

  measure: average_sale_value {
    type: average
    sql: ${TABLE}.Total_Amount ;;
    value_format: "#,##0.00"
    description: "Average value of a single sale."
  }

  measure: total_revenue_per_customer {
    type: sum
    sql: ${total_amount} ;;
    drill_fields: [customer_id]
    value_format: "#,##0.00"
    description: "Total revenue contributed by each customer."
  }

  ###################################
  #              SETS               #
  ###################################

  set: detail {
    fields: [
      sales_id,
      customer_id,
      lead_id,
      product_id
    ]
  }

}
