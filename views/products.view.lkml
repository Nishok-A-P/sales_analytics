view: products {
  sql_table_name: `sqsh-looker-project.sales_crm.products` ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Product_ID ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
  }
  dimension: stock_quantity {
    type: number
    sql: ${TABLE}.Stock_Quantity ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, name, sales.count]
  }
  measure: total_products {
    type: count
  }

  measure: average_price {
    type: average
    sql: ${TABLE}.price ;;
  }

  measure: total_stock_quantity {
    type: sum
    sql: ${TABLE}.stock_quantity ;;
  }
  measure: stock_turnover {
    type: sum
    sql: ${sales.quantity} / ${TABLE}.stock_quantity ;;
  }
  measure: revenue_per_product {
    type: sum
    sql: ${sales.total_amount} ;;
    drill_fields: [product_id, name]
  }
}
