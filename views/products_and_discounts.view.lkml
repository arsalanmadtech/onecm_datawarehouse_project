view: products_and_discounts {
  sql_table_name: `datawarehouse.products_and_discounts` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }
  dimension: cannabis_volume {
    type: string
    sql: ${TABLE}.cannabisVolume ;;
  }
  dimension: cannabis_weight {
    type: string
    sql: ${TABLE}.cannabisWeight ;;
  }
  dimension: category_id {
    type: string
    sql: ${TABLE}.categoryId ;;
  }
  dimension: category_name {
    type: string
    sql: ${TABLE}.categoryName ;;
  }
  dimension: cbd {
    type: string
    sql: ${TABLE}.cbd ;;
  }
  dimension: company_id {
    type: number
    sql: ${TABLE}.companyId ;;
  }
  dimension: create_date {
    type: string
    sql: ${TABLE}.createDate ;;
  }
  dimension: deposit_fee {
    type: string
    sql: ${TABLE}.depositFee ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: image_url {
    type: string
    sql: ${TABLE}.imageUrl ;;
  }
  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.locationId ;;
  }
  dimension: meta_data {
    type: string
    sql: ${TABLE}.metaData ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: parent_category_id {
    type: string
    sql: ${TABLE}.parentCategoryId ;;
  }
  dimension: parent_category_name {
    type: string
    sql: ${TABLE}.parentCategoryName ;;
  }
  dimension: parent_product_id {
    type: string
    sql: ${TABLE}.parentProductId ;;
  }
  dimension: parent_product_name {
    type: string
    sql: ${TABLE}.parentProductName ;;
  }
  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }
  dimension: sale_price {
    type: string
    sql: ${TABLE}.salePrice ;;
  }
  dimension: sale_price_end_utc {
    type: string
    sql: ${TABLE}.salePriceEndUtc ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: strain_type {
    type: string
    sql: ${TABLE}.strainType ;;
  }
  dimension: supplier_id {
    type: string
    sql: ${TABLE}.supplierId ;;
  }
  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplierName ;;
  }
  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }
  dimension: taxes {
    hidden: yes
    sql: ${TABLE}.taxes ;;
  }
  dimension: thc {
    type: string
    sql: ${TABLE}.thc ;;
  }
  dimension: update_date {
    type: string
    sql: ${TABLE}.updateDate ;;
  }
  dimension: weight {
    type: string
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      parent_product_name,
      category_name,
      supplier_name,
      parent_category_name,
      name,
      locations.name,
      locations.id
    ]
  }

}

view: products_and_discounts__tags {

  dimension: products_and_discounts__tags {
    type: string
    sql: products_and_discounts__tags ;;
  }
}

view: products_and_discounts__taxes {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: country ;;
  }
  dimension: exempt_override {
    type: yesno
    sql: exemptOverride ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: percent {
    type: number
    sql: percent ;;
  }
  dimension: products_and_discounts__taxes {
    type: string
    hidden: yes
    sql: products_and_discounts__taxes ;;
  }
  dimension: state {
    type: string
    sql: state ;;
  }
}
