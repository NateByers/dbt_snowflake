{% macro create_pr_database(pr_database=none) -%}

    {% if pr_database is none%}

        pr_database={{ env_var('DBT_CLOUD_PR_ID') }}

    {% endif %}

    {% set create_database_sql='create database if not exists ' +  pr_database %}
    {% do run_query(create_database_sql) %}
    {{ log("database created", info=True) }}

    {% set grant_database_privileges_sql='grant all on database ' + pr_database + ' to role accountadmin'%}
    {% do run_query(grant_database_privileges_sql) %}
    {{ log("database grants given", info=True) }}

{%- endmacro %}
