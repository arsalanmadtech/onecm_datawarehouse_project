connection: "datawarehouse-390222_project"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: datawarehouse-project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: datawarehouse-project_default_datagroup

explore: customers {}

explore: inventory {
  join: locations {
    type: left_outer
    sql_on: ${inventory.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: categories {}

explore: parked_sales {
  join: locations {
    type: left_outer
    sql_on: ${parked_sales.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${parked_sales.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
  join: parked_sales__payment_lines {
    view_label: "Parked Sales: Paymentlines"
    sql: LEFT JOIN UNNEST(${parked_sales.payment_lines}) as parked_sales__payment_lines ;;
    relationship: one_to_many
  }
}

explore: sales {
  join: locations {
    type: left_outer
    sql_on: ${sales.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${sales.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
  join: sales__taxes {
    view_label: "Sales: Taxes"
    sql: LEFT JOIN UNNEST(${sales.taxes}) as sales__taxes ;;
    relationship: one_to_many
  }
  join: sales__lines {
    view_label: "Sales: Lines"
    sql: LEFT JOIN UNNEST(${sales.lines}) as sales__lines ;;
    relationship: one_to_many
  }
  join: sales__transactions {
    view_label: "Sales: Transactions"
    sql: LEFT JOIN UNNEST(${sales.transactions}) as sales__transactions ;;
    relationship: one_to_many
  }
  join: sales__cart_discounts {
    view_label: "Sales: Cartdiscounts"
    sql: LEFT JOIN UNNEST(${sales.cart_discounts}) as sales__cart_discounts ;;
    relationship: one_to_many
  }
}

explore: discounts {
  join: discounts__products {
    view_label: "Discounts: Products"
    sql: LEFT JOIN UNNEST(${discounts.products}) as discounts__products ;;
    relationship: one_to_many
  }
  join: discounts__categories {
    view_label: "Discounts: Categories"
    sql: LEFT JOIN UNNEST(${discounts.categories}) as discounts__categories ;;
    relationship: one_to_many
  }
  join: discounts__location_ids {
    view_label: "Discounts: Locationids"
    sql: LEFT JOIN UNNEST(${discounts.location_ids}) as discounts__location_ids ;;
    relationship: one_to_many
  }
}

explore: products_and_discounts {
  join: locations {
    type: left_outer
    sql_on: ${products_and_discounts.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
  join: products_and_discounts__tags {
    view_label: "Products And Discounts: Tags"
    sql: LEFT JOIN UNNEST(${products_and_discounts.tags}) as products_and_discounts__tags ;;
    relationship: one_to_many
  }
  join: products_and_discounts__taxes {
    view_label: "Products And Discounts: Taxes"
    sql: LEFT JOIN UNNEST(${products_and_discounts.taxes}) as products_and_discounts__taxes ;;
    relationship: one_to_many
  }
}

explore: locations {}