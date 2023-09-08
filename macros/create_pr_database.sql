{% macro create_pr_database(pr_database=none) -%}

    {% if pr_database is none %}

        pr_database={{ env_var("DBT_CLOUD_PR_ID") }}

    {% elif env_var("DBT_DATABASE") == "PR" %}

        {{ log("DBT_DATABASE:", info=True) }}

        {{ log(env_var("DBT_DATABASE"), info=True) }}

        {{ log("DBT_CLOUD_PR_ID:", info=True) }}

        {{ log(env_var("DBT_CLOUD_PR_ID"), info=True) }}

        pr_database={{ env_var("DBT_CLOUD_PR_ID") }}

    {% else %}

        pr_database="PR"

    {% endif %}

    {% set create_database_sql="create database if not exists " +  pr_database %}
    {% do run_query(create_database_sql) %}
    {{ log("database created", info=True) }}

    {% set grant_database_privileges_sql="grant all on database " + pr_database + " to role accountadmin" %}
    {% do run_query(grant_database_privileges_sql) %}
    {{ log("database grants given", info=True) }}

{%- endmacro %}
