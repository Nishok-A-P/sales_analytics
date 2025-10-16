view: marketing {
  sql_table_name: `sqsh-looker-project.sales_crm.marketing` ;;

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
    description: "Unique ID for each marketing campaign."
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "Reference to the promoted product."
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "Marketing channel used (Email, Social Media, etc.)."
  }

  dimension_group: start_date {
    type: time
    sql: ${TABLE}.start_date ;;
    description: "Start date of the campaign."
  }

  dimension_group: end_date {
    type: time
    sql: ${TABLE}.end_date ;;
    description: "End date of the campaign."
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
    description: "Total allocated budget for the campaign."
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
    description: "Amount spent for the campaign."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "Campaign status (Active, Paused, Completed)."
  }
}
