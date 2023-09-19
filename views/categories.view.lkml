view: categories {
  sql_table_name: `datawarehouse.categories` ;;
  drill_fields: [compliance_category_id]

  dimension: compliance_category_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.complianceCategoryId ;;
  }
  dimension: category_type {
    type: string
    sql: ${TABLE}.categoryType ;;
  }
  dimension: color_hex {
    type: string
    sql: ${TABLE}.colorHex ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: list_order {
    type: number
    sql: ${TABLE}.listOrder ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: parent_category_id {
    type: string
    sql: ${TABLE}.parentCategoryId ;;
  }
  measure: count {
    type: count
    drill_fields: [compliance_category_id, name]
  }
}
