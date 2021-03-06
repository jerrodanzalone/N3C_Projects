

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.37f2b757-7b38-4866-8b55-c0b4c9c5d9d4"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
SELECT person_id,
covid_index_date,
macrovisit_id,
macrovisit_start_date,
macrovisit_end_date,
year_of_birth,
month_of_birth,
day_of_birth,
age,
ICU_Flag,
LOS,
date_of_death,
MI,
CHF,
PVD,
stroke,
dementia,
pulmonary,
rheumatic,
PUD,
liver_mild,
liversevere,
diabetes,
dmcx,
paralysis,
renal,
cancer,
mets,
hiv,
multiple,
CCI_INDEX,
alcoholism,
alcohol_complications,
CASE WHEN alcoholism = '1' THEN '1' WHEN alcohol_complications = '1' THEN '1' ELSE '0' END AS alc_combined,  
hypertension,
invasive_Mechanical_Ventilation,
invasive_Mechanical_Ventilation_Days,
ECMO,
CAST(ECMO_Days AS INT),
CAST(bmi AS INT),
CAST(min_Mean_Arterial_Pressure AS INT),
CAST(min_Oxygen_Saturation AS INT),
death_or_hospice,
AKI_in_hospital,
Severity_Type,
Q_Score,
smoking_status
FROM hosp_covid_pts_comorb_smoke_vent

