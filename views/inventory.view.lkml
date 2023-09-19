view: inventory {
  sql_table_name: `datawarehouse.inventory` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.locationId ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: update_date {
    type: string
    sql: ${TABLE}.updateDate ;;
  }
  measure: count {
    type: count
    drill_fields: [id, locations.name, locations.id]
  }
}
