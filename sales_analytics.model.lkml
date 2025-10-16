connection: "sales_analytics"

include: "/views/customers.view.lkml"
include: "/views/products.view.lkml"
include: "/views/leads.view.lkml"
include: "/views/marketing.view.lkml"
include: "/views/sales.view.lkml"

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

  join: marketing {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.product_id} = ${marketing.product_id} ;;
  }

  label: "Sales Explore"
  description: "Explore sales performance along with customer, lead, product, and marketing insights."

}
