

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.fde7591f-1063-4f3f-a3f4-1a1a32cbdda2"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
hrs_func <- function(hosp_covid_pts_comorb_smoke_vent) {
   d <- dim(hosp_covid_pts_comorb_smoke_vent)
   e <- nrow(distinct(hosp_covid_pts_comorb_smoke_vent, person_id))
   e1 <- dim(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, .keep_all=TRUE))
   f <- nrow(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, macrovisit_start_date))
   g <- nrow(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, macrovisit_start_date,macrovisit_end_date))
   h <- nrow(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, macrovisit_start_date,macrovisit_end_date,discharge_to_concept_name))
   i <- nrow(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, macrovisit_start_date,macrovisit_end_date,discharge_to_concept_name,discharge_to_source_value))
   out <- data.frame(d,e,e1,f,g,h,i)
   return(out)
}

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.0ef4a6af-7dd1-43ad-a7b1-40c940ac4b26"),
    clean_table=Input(rid="ri.foundry.main.dataset.37f2b757-7b38-4866-8b55-c0b4c9c5d9d4")
)
summary_stats <- function(clean_table) {
library(psych)
    df_select <- SparkR::select(clean_table, "LOS", "ICU_Flag", "invasive_Mechanical_Ventilation", "invasive_Mechanical_Ventilation_Days", "age", "bmi", "min_Oxygen_Saturation", "min_Mean_Arterial_Pressure", "alc_combined") 
   sumstatsdf <- describe.by(df_select, alc_combined)
   showDF(sumstatsdf)
   return(sumstatsdf)
}

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.27962b78-2909-4440-bbde-564c5ab9df59"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
unnamed <- function(hosp_covid_pts_comorb_smoke_vent) {

}

@transform_pandas(
    Output(rid="ri.vector.main.execute.c217ddbf-801f-4408-9256-3ae8c2b138ae"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
unnamed_1 <- function(hosp_covid_pts_comorb_smoke_vent) {
    
}

