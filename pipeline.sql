

@transform_pandas(
    Output(rid="ri.vector.main.execute.4528a883-328b-4bd4-b05e-1a2ee810ee5e"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
SELECT *
FROM hosp_covid_pts_comorb_smoke_vent

