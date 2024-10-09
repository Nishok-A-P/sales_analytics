connection: "sales_analytics"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: sales {

  access_filter: {
    field: products.category
    user_attribute: market
  }

  join: customers {
    relationship: many_to_one
    sql_on: ${sales.customer_id} = ${customers.customer_id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${sales.product_id} = ${products.product_id} ;;
  }

  join: leads {
    relationship: many_to_one
    sql_on: ${sales.lead_id} = ${leads.lead_id} ;;
  }

  label: "Sales Explore"

}
