*** Applied Survival Analysis (event analysis)

/* The point of survival analysis is to follow subjects over time and observe at which point in time they experience the event of interest. It often happens that the study does not span enough time in order to observe the event for all the subjects in the study. The common feature of all of these examples is that if the subject had been able to stay in the study then it would have been possible to observe the time of the event eventually. */

***************************************************************************
/* event variable indicates whether the subject graduated into bad market conditions (1 yes and 0 no) */
*************************************************************************** 
gen censor = 0 if con == .
replace censor = 1 if missing(censor)  
 
***************************************************************************
/* event variable indicates whether the subject graduated into bad market conditions (1 yes and 0 no) */
*************************************************************************** 
gen event = 1 if UR >= 6
replace event = 0 if missing(event)

***************************************************************************
/* ifchild variable indicates whether the subject had a child after graduating from BA (1 indicates have a child and 0 otherwise) */
***************************************************************************
gen ifchild = 0 if Child == .
replace ifchild = 1 if missing(ifchild)
 
***************************************************************************
/* Clean Data */
***************************************************************************

*** restrict sample to ages at graduation of 21-24
gen sample = BA_age if BA_age >= 21 & BA_age <= 24
drop if sample == .

*** restrict sample to females
drop if sex == 1

***************************************************************************
/* Create id */
*************************************************************************** 
gen case_id = _n

***************************************************************************
/* A censored observation is defined as an observation with incomplete information */
*************************************************************************** 
gen censor = 0 if con == .
replace censor = 1 if missing(censor)  

***************************************************************************
** Time form BA to Conception
***************************************************************************
gen time = con - BA
replace time = 500 - BA if missing(time)

***************************************************************************
** Generate Birth Cohort
***************************************************************************

gen b_cohort = 1 if BirthYear = 1980
replace b_cohort = 2 if BirthYear = 1981
replace b_cohort = 3 if BirthYear = 1982
replace b_cohort = 4 if BirthYear = 1983
replace b_cohort = 5 if BirthYear = 1984

label define b_cohort 1 "1980" 2 "1981" 3 "1982" 4 "1983" 5 "1984" 
label values b_cohort b_cohort


sts graph, survival by(BirthYear) 
title(" ") 
xtitle("Months") /// x label!
ytitle("Cumulative Incidence") /// y label!
yla(0 "0%" .25 "25%" .5 "50%" .75 "75%" 1 "100%", angle(0)) /// Y-label values! Angle(0) rotates them.
xla(0(1)6) /// X-label values! From 0 to 6 years with 1 year intervals in between


twoway ///
    (line yay time) ///
        , legend(on position(5) ring(0)  cols(1) ///
                order(- "Kaplan Meyer" 1 "True" 2 "lowess" 3 "EWMA")) ///
