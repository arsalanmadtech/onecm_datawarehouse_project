
view: sales_30daysago {
  derived_table: {
    sql: SELECT
          date(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*SZ', sales.completeDate)) AS Completed_date,
          sales.locationId,
          COALESCE(SUM(sales.Total), 0) AS sales_totalsales
        FROM `datawarehouse.sales` AS sales
        GROUP BY 1, 2 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: completed_date {
    type: time
    sql: ${TABLE}.Completed_date ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.locationId ;;
  }

  dimension: sales_totalsales {
    type: number
    sql: ${TABLE}.sales_totalsales ;;
  }

  measure: TotalSales_30daysago {
    type: max
    sql: ${sales_totalsales} ;;
  }

  set: detail {
    fields: [
        completed_date_time,
  location_id,
  sales_totalsales
    ]
  }
}
