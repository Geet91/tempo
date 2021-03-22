view: dim_kustomer_agent {
  sql_table_name: "MOZART"."DIM_KUSTOMER_AGENT"
    ;;

  dimension: agent_display_name {
    type: string
    sql: ${TABLE}."AGENT_DISPLAY_NAME" ;;
  }

  dimension: agent_email {
    type: string
    sql: ${TABLE}."AGENT_EMAIL" ;;
  }

  dimension: agent_email_signature {
    type: string
    sql: ${TABLE}."AGENT_EMAIL_SIGNATURE" ;;
  }

  dimension: agent_id {
    type: string
    sql: ${TABLE}."AGENT_ID" ;;
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}."AGENT_NAME" ;;
  }

  dimension: team_display_name {
    type: string
    sql: ${TABLE}."TEAM_DISPLAY_NAME" ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}."TEAM_ID" ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}."TEAM_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [team_name, team_display_name, agent_display_name, agent_name]
  }
}
