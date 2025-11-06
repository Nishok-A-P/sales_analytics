view: marketing_products {
  sql_table_name: sqsh-looker-project.marketing_analytics.products ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, name, transactions.count]
  }
  measure: product_count{
    type: number
    sql: count(${product_id}) ;;
  }
  measure: total_cost{
    type: sum
    sql: ${price} ;;
  }
  measure: average_cost{
    type: average
    sql: ${price} ;;
  }
}
