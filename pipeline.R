

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.5cc363df-d97d-4f02-bbb4-1d43bcf642b2"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
Dead <- function(hosp_covid_pts_comorb_smoke_vent) {
  d <-  data.frame(hosp_covid_pts_comorb_smoke_vent[which(is.na(hosp_covid_pts_comorb_smoke_vent$date_of_death)==0),])
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

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.27962b78-2909-4440-bbde-564c5ab9df59"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
unnamed <- function(hosp_covid_pts_comorb_smoke_vent) {
    
  out = hosp_covid_pts_comorb_smoke_vent
  return(out)
}

