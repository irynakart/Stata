
**************************************
**
/* DiD - Difference in differences (DID) 

Method to estimate the average effect of a treatment on those
who receive the treatment.

Used in before/after scenarios.
*/
**
**************************************

** before/after variable (0 = time before the event happens)

gen after = 1 if interview >= ym(2004,7)
replace after = 0 if missing(after) 

gen aftercheck = 1 if interview >= ym(2000,7)
replace aftercheck = 0 if missing(aftercheck) 

**  treatment variable (California state)

gen treat = 1 if statefip == 6
replace treat = 0 if missing(treat)

* The diff-in-diff indicator is an interaction between the treatment and before/after variables

gen did = after*treat

**** ESTIMATE

estat ptrends, verbose

* Parental Leave
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 1, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 1 & sex==2, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 1 & sex==1, group(statefip) time(interview) 
didregress (joint_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 1, group(statefip) time(interview) 

* Maternity Leave
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 2, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 2 & sex==2, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 2 & sex==1, group(statefip) time(interview) 
didregress (joint_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 2, group(statefip) time(interview) 

* Paternity Leave
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 3, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 3 & sex==2, group(statefip) time(interview) 
didregress (took_leave_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 3 & sex==1, group(statefip) time(interview) 
didregress (joint_all i.degree i.group i.city i.white i.black i.hisp i.married i.div) (did) [pweight=wtfinl] if income_group == 3, group(statefip) time(interview) 
