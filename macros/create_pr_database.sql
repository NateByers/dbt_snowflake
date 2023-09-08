{% macro create_pr_database() -%}

    {% set create_database_sql="create database if not exists " +  env_var("DBT_CLOUD_PR_ID")  %}
    {% do run_query(create_database_sql) %}
    {{ log("database created", info=True) }}

    {% set grant_database_privileges_sql="grant all on database " +  env_var("DBT_CLOUD_PR_ID")  + " to role accountadmin" %}
    {% do run_query(grant_database_privileges_sql) %}
    {{ log("database grants given", info=True) }}

{%- endmacro %}


