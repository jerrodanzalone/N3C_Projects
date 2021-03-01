

@transform_pandas(
    Output(rid="ri.vector.main.execute.1616db84-523f-444d-89f9-5596524357b0"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
dead <- function(hosp_covid_pts_comorb_smoke_vent) {
  d <-  table(hosp_covid_pts_comorb_smoke_vent[which(date_of_death != "null"),]$discharge_to_concept_name)
  out <- data.frame(d)
  return(out)
}

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

