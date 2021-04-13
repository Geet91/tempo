view: fact_kustomer_tickets {
  sql_table_name: "MOZART"."FACT_KUSTOMER_TICKETS"
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: concession_date {
    type: string
    sql: ${TABLE}."CONCESSION_DATE" ;;
  }

  dimension_group: concession_date_clean {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CONCESSION_DATE_CLEAN" ;;
  }

  dimension: concession_quantity {
    type: number
    sql: ${TABLE}."CONCESSION_QUANTITY" ;;
  }

  dimension: concession_type {
    type: string
    sql: ${TABLE}."CONCESSION_TYPE" ;;
  }

  dimension_group: conversation_created {
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
    sql: CAST(${TABLE}."CONVERSATION_CREATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: conversation_direction {
    type: string
    sql: ${TABLE}."CONVERSATION_DIRECTION" ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}."CONVERSATION_ID" ;;
  }

  dimension: conversation_message_app {
    type: string
    sql: ${TABLE}."CONVERSATION_MESSAGE_APP" ;;
  }

  dimension: conversation_message_channel {
    type: string
    sql: ${TABLE}."CONVERSATION_MESSAGE_CHANNEL" ;;
  }

  dimension: conversation_name {
    type: string
    sql: ${TABLE}."CONVERSATION_NAME" ;;
  }

  dimension: conversation_status {
    type: string
    sql: CASE WHEN ${TABLE}."CONVERSATION_STATUS" IS NULL THEN 'Unknown' ELSE ${TABLE}."CONVERSATION_STATUS" END;;
  }

  dimension_group: conversation_updated {
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
    sql: CAST(${TABLE}."CONVERSATION_UPDATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: freshdesk_ticket_id {
    type: number
    sql: ${TABLE}."FRESHDESK_TICKET_ID" ;;
  }

  dimension: freshdesk_type {
    type: string
    sql: ${TABLE}."FRESHDESK_TYPE" ;;
  }

  dimension_group: last_activity {
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
    sql: CAST(${TABLE}."LAST_ACTIVITY_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: last_message_direction {
    type: string
    sql: ${TABLE}."LAST_MESSAGE_DIRECTION" ;;
  }

  dimension: message_count {
    type: number
    sql: ${TABLE}."MESSAGE_COUNT" ;;
  }

  dimension: message_count_by_channel {
    type: string
    sql: ${TABLE}."MESSAGE_COUNT_BY_CHANNEL" ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension: queue_id {
    type: string
    sql: ${TABLE}."QUEUE_ID" ;;
  }

  dimension: queue_name {
    type: string
    sql: ${TABLE}."QUEUE_NAME" ;;
  }

  dimension: repaid_needed_flag {
    type: yesno
    sql: ${TABLE}."REPAID_NEEDED_FLAG" ;;
  }

  dimension: repaired_by {
    type: string
    sql: ${TABLE}."REPAIRED_BY" ;;
  }

  dimension: replacement_needed_flag {
    type: yesno
    sql: ${TABLE}."REPLACEMENT_NEEDED_FLAG" ;;
  }

  dimension: replacement_status {
    type: string
    sql: ${TABLE}."REPLACEMENT_STATUS" ;;
  }

  dimension: request_reason {
    type: string
    sql: ${TABLE}."REQUEST_REASON" ;;
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}."REQUEST_TYPE" ;;
  }

  dimension: sat_channel {
    type: string
    sql: ${TABLE}."SAT_CHANNEL" ;;
  }

  dimension: sat_rating {
    type: number
    sql: ${TABLE}."SAT_RATING" ;;
  }

  dimension: sat_response_detail {
    type: string
    sql: ${TABLE}."SAT_RESPONSE_DETAIL" ;;
  }

  dimension: sat_response_id {
    type: string
    sql: ${TABLE}."SAT_RESPONSE_ID" ;;
  }

  dimension_group: sat_scheduled {
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
    sql: CAST(${TABLE}."SAT_SCHEDULED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: sat_score {
    type: number
    sql: ${TABLE}."SAT_SCORE" ;;
  }

  dimension: sat_status {
    type: string
    sql: ${TABLE}."SAT_STATUS" ;;
  }

  dimension: sub_request_type {
    type: string
    sql: ${TABLE}."SUB_REQUEST_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [queue_name, conversation_name, sat_rating, dim_kustomer_customer.name,dim_kustomer_customer.email]
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Week"
      value: "week"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${conversation_created_date}
    {% elsif date_granularity._parameter_value == 'week' %}
      ${conversation_created_week}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${conversation_created_month}
    {% else %}
      ${conversation_created_date}
    {% endif %};;
  }
}
