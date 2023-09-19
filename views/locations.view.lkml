view: locations {
  sql_table_name: `datawarehouse.locations` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.phoneNumber ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalCode ;;
  }
  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }
  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      inventory.count,
      parked_sales.count,
      sales.count,
      products_and_discounts.count
    ]
  }

}
