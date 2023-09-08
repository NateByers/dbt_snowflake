{% macro create_pr_database() -%}

    {{ log(env_var("DBT_DATABASE"), info=True) }}

    {% set create_database_sql="create database if not exists DBT_PR_" +  env_var("DBT_CLOUD_PR_ID")  %}
    {% do run_query(create_database_sql) %}
    {{ log("database created", info=True) }}

    {% set grant_database_privileges_sql="grant all on database DBT_PR_" +  env_var("DBT_CLOUD_PR_ID")  + " to role accountadmin" %}
    {% do run_query(grant_database_privileges_sql) %}
    {{ log("database grants given", info=True) }}

{%- endmacro %}


