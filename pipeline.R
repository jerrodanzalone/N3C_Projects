

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
   d2 <- dim(distinct(hosp_covid_pts_comorb_smoke_vent, person_id, death_or_hospice, .keep_all=TRUE))
   out <- data.frame(d,e,e1,f,g,h,i)
   return(out)
}

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.5cc363df-d97d-4f02-bbb4-1d43bcf642b2"),
    hosp_covid_pts_comorb_smoke_vent=Input(rid="ri.foundry.main.dataset.a53be7a8-8182-4a7d-81e2-7008cdeb712e")
)
table1 <- function(hosp_covid_pts_comorb_smoke_vent) {
    ####SOT with COVID after table 1
    pos_index=which(as.numeric(hosp_covid_pts_comorb_smoke_vent$death_or_hospice)==1)
    pos=hosp_covid_pts_comorb_smoke_vent[pos_index,]
    #pos=pos[which(pos$age_sex_strata!="Unknown"),]
    mm=as.numeric(pos$alcohol_complications)
    pos$sex_age_strata=relevel(as.factor(pos$age_sex_strata),ref="Male 18-45")
    pos$sex=relevel(as.factor(pos$sex),ref="Male")
    pos$age_strata=relevel(as.factor(pos$age_strata),ref="18-45")
    pos$race_ethnicity=relevel(as.factor(pos$race_ethnicity),ref="White")

    myf<-function(v,vn){
        vf=as.factor(v)
        if (length(levels(vf))>0){
            v_pos=NULL
            v_neg=NULL
            for (j in 1:length(levels(vf))){
                    v_pos=c(v_pos,sum(vf==levels(vf)[j]&mm==1,na.rm=TRUE))
                    v_neg=c(v_neg,sum(vf==levels(vf)[j]&mm==0,na.rm=TRUE))
            }
        }
        v_name=c(levels(vf),"NA")
        v_pos=c(v_pos,sum(is.na(vf)&mm==1))
        v_neg=c(v_neg,sum(is.na(vf)&mm==0))
        cbind(vn,v_name,v_pos,round(v_pos/sum(mm==1)*100,1),v_neg,round(v_neg/sum(mm==0)*100,1))
    }
    result=data.frame(rbind(myf(pos$sex_age_strata,"sex_age_strata"),myf(pos$sex,"sex"),myf(pos$age_strata,"age"),myf(pos$race_ethnicity,"race_ethnicity"), myf(pos$kidney_transplant,"Kidney"),myf(pos$liver_transplant,"Liver"),myf(pos$lung_transplant,"Lung"),myf(pos$other_transplant,"Other"), myf(pos$sot_to_covid_strata,"sot_to_covid_strata"),myf(pos$ckd,"ckd"),myf(pos$hypertension,"hypertension"),myf(pos$diabetes,"diabetes"),myf(pos$copd_asthma,"copd_asthma"),myf(pos$cancer,"cancer"),myf(pos$cad,"cad"),myf(pos$chf,"chf"),myf(pos$pvd,"pvd"),myf(pos$liver,"liver"),myf(pos$obesity,"obesity")))
#res=result[c(1,6,5,3,4,2,8,9,11,13,12,15:18,21,24,27,30,33,34,32,37,40,43,46,49,52,55,58,61,64),] 
res=result 
names(res)=c("Variable","Level","Marce_N","Marce_pct","NonMarce_N", "NonMarce_pct") 
data.frame(res)
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

