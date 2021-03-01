

@transform_pandas(
    Output(rid="ri.vector.main.execute.00de6bc6-9024-41e7-81ac-bb9e8d47d401"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
hrs_func <- function(hosp_covid_pts_comorb_smoke_vent) {
   d <- nrows(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, macrovisit_start_date))
   out <- data.frame(d)
   return(out)
}

@transform_pandas(
    Output(rid="ri.vector.main.execute.0e68970f-704e-4882-8419-74095b8cebe3"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
unnamed <- function(hosp_covid_pts_comorb_smoke_vent) {
    
}

