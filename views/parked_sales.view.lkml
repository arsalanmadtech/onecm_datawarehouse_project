view: parked_sales {
  sql_table_name: `datawarehouse.parked_sales` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: completed_payment__complete_date {
    type: string
    sql: ${TABLE}.completedPayment.completeDate ;;
    group_label: "Completed Payment"
    group_item_label: "Complete Date"
  }
  dimension: completed_payment__custom_id {
    type: string
    sql: ${TABLE}.completedPayment.customId ;;
    group_label: "Completed Payment"
    group_item_label: "Custom ID"
  }
  dimension: completed_payment__id {
    type: string
    sql: ${TABLE}.completedPayment.id ;;
    group_label: "Completed Payment"
    group_item_label: "ID"
  }
  dimension: create_date {
    type: string
    sql: ${TABLE}.createDate ;;
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
  dimension: external_order_id {
    type: number
    sql: ${TABLE}.externalOrderId ;;
  }
  dimension: external_source_hex_color {
    type: string
    sql: ${TABLE}.externalSourceHexColor ;;
  }
  dimension: external_source_id {
    type: number
    sql: ${TABLE}.externalSourceId ;;
  }
  dimension: external_source_name {
    type: string
    sql: ${TABLE}.externalSourceName ;;
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
  dimension: order_type {
    type: string
    sql: ${TABLE}.orderType ;;
  }
  dimension: payment_lines {
    hidden: yes
    sql: ${TABLE}.paymentLines ;;
  }
  dimension: payment_lines_total_discrepancy {
    type: number
    sql: ${TABLE}.paymentLinesTotalDiscrepancy ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: total_discrepancy {
    type: number
    sql: ${TABLE}.totalDiscrepancy ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      customer_name,
      external_source_name,
      locations.name,
      locations.id,
      customers.name,
      customers.id
    ]
  }

}

view: parked_sales__payment_lines {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: barcode {
    type: string
    sql: barcode ;;
  }
  dimension: barcode_scanned {
    type: yesno
    sql: barcodeScanned ;;
  }
  dimension: bulk_price_per_inventory_subtracted {
    type: string
    sql: bulkPricePerInventorySubtracted ;;
  }
  dimension: discount_id {
    type: string
    sql: discountId ;;
  }
  dimension: discount_message {
    type: string
    sql: discountMessage ;;
  }
  dimension: discount_percentage {
    type: number
    sql: discountPercentage ;;
  }
  dimension: discount_price {
    type: number
    sql: discountPrice ;;
  }
  dimension: parked_sales__payment_lines {
    type: string
    hidden: yes
    sql: parked_sales__payment_lines ;;
  }
  dimension: payment_queue_id {
    type: number
    sql: paymentQueueId ;;
  }
  dimension: price {
    type: number
    sql: price ;;
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
  dimension: sku {
    type: string
    sql: sku ;;
  }
}
