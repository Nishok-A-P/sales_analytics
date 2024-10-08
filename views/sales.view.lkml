view: sales {
  sql_table_name: `sqsh-looker-project.sales_crm.sales` ;;
  drill_fields: [sales_id]

  dimension: sales_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Sales_ID ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Customer_ID ;;
  }
  dimension: lead_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Lead_ID ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Product_ID ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  dimension_group: sale {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Sale_Date ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.Total_Amount ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: total_sales {
    type: count
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.total_amount ;;
  }

  measure: total_quantity_sold {
    type: sum
    sql: ${TABLE}.quantity ;;
  }

  measure: average_sale_value {
    type: average
    sql: ${TABLE}.total_amount ;;
  }
  measure: total_revenue_per_customer {
    type: sum
    sql: ${total_amount} ;;
    drill_fields: [customer_id]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  sales_id,
  products.product_id,
  products.name,
  customers.customer_id,
  customers.name,
  leads.lead_id
  ]
  }

}
