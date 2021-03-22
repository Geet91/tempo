view: dim_kustomer_customer {
  sql_table_name: "MOZART"."DIM_KUSTOMER_CUSTOMER"
    ;;

  dimension: accepts_marketing_flag {
    type: yesno
    sql: ${TABLE}."ACCEPTS_MARKETING_FLAG" ;;
  }

  dimension: amount_spent {
    type: number
    sql: ${TABLE}."AMOUNT_SPENT" ;;
  }

  dimension: conversation_counts_all {
    type: number
    sql: ${TABLE}."CONVERSATION_COUNTS_ALL" ;;
  }

  dimension: conversation_counts_done {
    type: number
    sql: ${TABLE}."CONVERSATION_COUNTS_DONE" ;;
  }

  dimension: conversation_counts_open {
    type: number
    sql: ${TABLE}."CONVERSATION_COUNTS_OPEN" ;;
  }

  dimension: conversation_counts_snoozed {
    type: number
    sql: ${TABLE}."CONVERSATION_COUNTS_SNOOZED" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CREATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: deleted_flag {
    type: yesno
    sql: ${TABLE}."DELETED_FLAG" ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_conversation_id {
    type: string
    sql: ${TABLE}."LAST_CONVERSATION_ID" ;;
  }

  dimension_group: last_message {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."LAST_MESSAGE_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: last_shopify_order_bundle_id {
    type: string
    sql: ${TABLE}."LAST_SHOPIFY_ORDER_BUNDLE_ID" ;;
  }

  dimension: last_shopify_order_id {
    type: number
    sql: ${TABLE}."LAST_SHOPIFY_ORDER_ID" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."PHONE" ;;
  }

  dimension: social_media_type {
    type: string
    sql: ${TABLE}."SOCIAL_MEDIA_TYPE" ;;
  }

  dimension: social_media_username {
    type: string
    sql: ${TABLE}."SOCIAL_MEDIA_USERNAME" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."UPDATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: vip_flag {
    type: yesno
    sql: ${TABLE}."VIP_FLAG" ;;
  }

  measure: count {
    type: count
    drill_fields: [social_media_username, last_name, customer_name, first_name]
  }
}
