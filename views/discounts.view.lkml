view: discounts {
  sql_table_name: `datawarehouse.discounts` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: apply_date_restriction {
    type: yesno
    sql: ${TABLE}.applyDateRestriction ;;
  }
  dimension: apply_type {
    type: string
    sql: ${TABLE}.applyType ;;
  }
  dimension: automatic {
    type: yesno
    sql: ${TABLE}.automatic ;;
  }
  dimension: categories {
    hidden: yes
    sql: ${TABLE}.categories ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: end_date {
    type: string
    sql: ${TABLE}.endDate ;;
  }
  dimension: end_time {
    type: string
    sql: ${TABLE}.endTime ;;
  }
  dimension: friday {
    type: yesno
    sql: ${TABLE}.friday ;;
  }
  dimension: is_loyalty {
    type: yesno
    sql: ${TABLE}.isLoyalty ;;
  }
  dimension: is_recurring {
    type: yesno
    sql: ${TABLE}.isRecurring ;;
  }
  dimension: location_ids {
    hidden: yes
    sql: ${TABLE}.locationIds ;;
  }
  dimension: loyalty_tier_id {
    type: string
    sql: ${TABLE}.loyaltyTierId ;;
  }
  dimension: loyalty_tier_name {
    type: string
    sql: ${TABLE}.loyaltyTierName ;;
  }
  dimension: monday {
    type: yesno
    sql: ${TABLE}.monday ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: products {
    hidden: yes
    sql: ${TABLE}.products ;;
  }
  dimension: saturday {
    type: yesno
    sql: ${TABLE}.saturday ;;
  }
  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }
  dimension: start_time {
    type: string
    sql: ${TABLE}.startTime ;;
  }
  dimension: sunday {
    type: yesno
    sql: ${TABLE}.sunday ;;
  }
  dimension: thursday {
    type: yesno
    sql: ${TABLE}.thursday ;;
  }
  dimension: tuesday {
    type: yesno
    sql: ${TABLE}.tuesday ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: update_date {
    type: string
    sql: ${TABLE}.updateDate ;;
  }
  dimension: wednesday {
    type: yesno
    sql: ${TABLE}.wednesday ;;
  }
  measure: count {
    type: count
    drill_fields: [id, loyalty_tier_name, name]
  }
}

view: discounts__products {
  drill_fields: [parent_product_id]

  dimension: parent_product_id {
    primary_key: yes
    type: string
    sql: parentProductId ;;
  }
  dimension: discount_id {
    type: number
    sql: discountId ;;
  }
  dimension: discounts__products {
    type: string
    hidden: yes
    sql: discounts__products ;;
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: type {
    type: string
    sql: type ;;
  }
}

view: discounts__categories {

  dimension: discounts__categories {
    type: string
    sql: discounts__categories ;;
  }
}

view: discounts__location_ids {

  dimension: discounts__location_ids {
    type: number
    sql: discounts__location_ids ;;
  }
}
