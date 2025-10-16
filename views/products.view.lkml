view: products {
  sql_table_name: `sqsh-looker-project.sales_crm.products` ;;
  drill_fields: [product_id]

  #            DIMENSIONS           #

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Product_ID ;;
    description: "Unique identifier for each product."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    description: "Name of the product."
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
    description: "Category of the product (e.g., Electronics, Apparel)."
  }

  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
    value_format: "$#,##0.00"
    description: "Unit price of the product."
  }

  dimension: stock_quantity {
    type: number
    sql: ${TABLE}.Stock_Quantity ;;
    description: "Available stock quantity of the product."
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Created_At ;;
    description: "Timestamp when the product record was created."
  }

  #              MEASURES           #

  measure: count {
    type: count
    drill_fields: [product_id, name, sales.count]
    description: "Total number of product records."
  }

  measure: total_products {
    type: count
    description: "Count of all unique products."
  }

  measure: total_price {
    type: sum
    sql: ${TABLE}.Price ;;
    value_format: "$#,##0.00"
    description: "Sum of product prices."
  }

  measure: average_price {
    type: average
    sql: ${TABLE}.Price ;;
    value_format: "$#,##0.00"
    description: "Average price of products."
  }

  measure: total_stock_quantity {
    type: sum
    sql: ${TABLE}.Stock_Quantity ;;
    value_format: "#,##0.00"
    description: "Total stock quantity across all products."
  }

  measure: revenue_per_product {
    type: sum
    sql: ${sales.total_amount} ;;
    drill_fields: [product_id, name]
    value_format: "$#,##0.00"
    description: "Total revenue generated per product from all sales."
  }

}
