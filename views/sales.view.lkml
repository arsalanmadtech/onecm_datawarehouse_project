view: sales {
  sql_table_name: `datawarehouse.sales` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: cart_discounts {
    hidden: yes
    sql: ${TABLE}.cartDiscounts ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: complete_date {
    type: string
    sql: ${TABLE}.completeDate ;;
  }
  dimension: custom_id {
    type: string
    sql: ${TABLE}.customId ;;
  }
  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customerId ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customerName ;;
  }
  dimension: device_id {
    type: string
    sql: ${TABLE}.deviceId ;;
  }
  dimension: device_name {
    type: string
    sql: ${TABLE}.deviceName ;;
  }
  dimension: employee_id {
    type: string
    sql: ${TABLE}.employeeId ;;
  }
  dimension: employee_name {
    type: string
    sql: ${TABLE}.employeeName ;;
  }
  dimension: lines {
    hidden: yes
    sql: ${TABLE}.lines ;;
  }
  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.locationId ;;
  }
  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }
  dimension: penny_rounding {
    type: number
    sql: ${TABLE}.pennyRounding ;;
  }
  dimension: refund_payment_id {
    type: string
    sql: ${TABLE}.refundPaymentId ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: sub_total {
    type: number
    sql: ${TABLE}.subTotal ;;
  }
  dimension: taxes {
    hidden: yes
    sql: ${TABLE}.taxes ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }
  dimension: transactions {
    hidden: yes
    sql: ${TABLE}.transactions ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      employee_name,
      device_name,
      customer_name,
      locations.name,
      locations.id,
      customers.name,
      customers.id
    ]
  }

}

view: sales__taxes {

  dimension: payment_line_id {
    type: number
    sql: paymentLineId ;;
  }
  dimension: sales__taxes {
    type: string
    hidden: yes
    sql: sales__taxes ;;
  }
  dimension: tax_name {
    type: string
    sql: taxName ;;
  }
  dimension: total {
    type: number
    sql: total ;;
  }
}

view: sales__lines {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: discount {
    type: number
    sql: discount ;;
  }
  dimension: product_id {
    type: string
    sql: productId ;;
  }
  dimension: product_name {
    type: string
    sql: productName ;;
  }
  dimension: quantity {
    type: number
    sql: quantity ;;
  }
  dimension: sales__lines {
    type: string
    hidden: yes
    sql: sales__lines ;;
  }
  dimension: sub_total {
    type: number
    sql: subTotal ;;
  }
  dimension: total {
    type: number
    sql: total ;;
  }
}

view: sales__transactions {

  dimension: payment_type_id {
    type: number
    sql: paymentTypeId ;;
  }
  dimension: payment_type_name {
    type: string
    sql: paymentTypeName ;;
  }
  dimension: sales__transactions {
    type: string
    hidden: yes
    sql: sales__transactions ;;
  }
  dimension: total {
    type: number
    sql: total ;;
  }
}

view: sales__cart_discounts {

  dimension: discount_name {
    type: string
    sql: discountName ;;
  }
  dimension: sales__cart_discounts {
    type: string
    hidden: yes
    sql: sales__cart_discounts ;;
  }
  dimension: total {
    type: number
    sql: total ;;
  }
}
