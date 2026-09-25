with source as (
    select *
    from {{ source('aworks', 'humanresources_employee') }}
),

renamed as (

    select
        cast(businessentityid as int) as employee_pk,
        cast(nationalidnumber as string) as national_id_number,
        cast(loginid as string) as login_id,
        cast(jobtitle as string) as job_title,
        cast(birthdate as date) as birth_date,
        cast(maritalstatus as string) as marital_status,
        cast(gender as string) as gender,
        cast(hiredate as date) as hire_date,
        cast(salariedflag as boolean) as salaried_flag,
        cast(vacationhours as int) as vacation_hours,
        cast(sickleavehours as int) as sick_leave_hours,
        cast(currentflag as boolean) as current_flag,
        cast(organizationnode as string) as organization_node,
        cast(modifieddate as timestamp) as modified_date
    from source
)

select *
from renamed