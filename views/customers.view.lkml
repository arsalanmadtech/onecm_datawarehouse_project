view: customers {
  sql_table_name: `datawarehouse.customers` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: address__address {
    type: string
    sql: ${TABLE}.address.address ;;
    group_label: "Address"
    group_item_label: "Address"
  }
  dimension: address__city {
    type: string
    sql: ${TABLE}.address.city ;;
    group_label: "Address"
    group_item_label: "City"
  }
  dimension: address__country {
    type: string
    sql: ${TABLE}.address.country ;;
    group_label: "Address"
    group_item_label: "Country"
  }
  dimension: address__postal_code {
    type: string
    sql: ${TABLE}.address.postalCode ;;
    group_label: "Address"
    group_item_label: "Postal Code"
  }
  dimension: address__province {
    type: string
    sql: ${TABLE}.address.province ;;
    group_label: "Address"
    group_item_label: "Province"
  }
  dimension: birthday {
    type: string
    sql: ${TABLE}.birthday ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: create_date {
    type: string
    sql: ${TABLE}.createDate ;;
  }
  dimension: credit_balance {
    type: number
    sql: ${TABLE}.creditBalance ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, parked_sales.count, sales.count]
  }
}
