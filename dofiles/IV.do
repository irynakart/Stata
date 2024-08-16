
***************************************************************************
/* Instrumental variables (2SLS) regression */

* Sample 
***************************************************************************

* All
est clear
eststo: reg timetopreg yearURn marr cath momed obes work race i.region, robust cluster(yr)
eststo: reg timetopreg yearUR marr cath momed obes work race i.region, robust cluster(yr)
eststo: ivregress 2sls timetopreg (yearURn = yearURivn) marr cath momed obes work race i.region, robust cluster(yr)
eststo: ivregress 2sls timetopreg (yearUR = yearURiv) marr cath momed obes work race i.region, robust cluster(yr)
esttab using "time.tex", b(2) se(1) star(* 0.10 ** 0.05 *** 0.01) label

estat firststage
