
**************************************
**
/* National Longitudinal Surveys 79 */
**
**************************************

* MERGING TWO DATASETS

use NLS79
gen momid = CASEID_1979
sort momid
save mom, replace

use NLS79children
gen momid = MPUBID_XRND
sort momid
save child, replace

merge momid using mom child

***************************************************************************
* Birthday
*************************************************************************** 

gen birth_year = Q1_3_A_Y_1979 + 1900
gen birth_month = Q1_3_A_M_1979

gen dob = ym(birth_year, birth_month)
format dob %tm

**************************************************
** First Child Born Data
**************************************************

gen child1 = ym(C1DOB_Y, C1DOB_M)
format child1 %tm

*************** Age at first born

gen age_c = round((child1 - dob)/12)

***************************************************************************************************************************************************
**# Year/Month of grad (Highest Degree)
***************************************************************************************************************************************************

* Source #1

gen Year = Q3_10E_Y_2020 if Q3_10E_Y_2020 > 0
replace Year = Q3_10E_Y_2018 if missing(Year) & Q3_10E_Y_2018 > 0
replace Year = Q3_10E_Y_2016 if missing(Year) & Q3_10E_Y_2016 > 0
replace Year = Q3_10E_Y_2014 if missing(Year) & Q3_10E_Y_2014 > 0
replace Year = Q3_10E_Y_2012 if missing(Year) & Q3_10E_Y_2012 > 0
replace Year = Q3_10E_Y_2010 if missing(Year) & Q3_10E_Y_2010 > 0
replace Year = Q3_10E_Y_2008 if missing(Year) & Q3_10E_Y_2008 > 0

gen Month = Q3_10E_M_2020 if Q3_10E_M_2020 > 0
replace Month = Q3_10E_M_2018 if missing(Month) & Q3_10E_M_2018 > 0
replace Month = Q3_10E_M_2016 if missing(Month) & Q3_10E_M_2016 > 0
replace Month = Q3_10E_M_2014 if missing(Month) & Q3_10E_M_2014 > 0
replace Month = Q3_10E_M_2012 if missing(Month) & Q3_10E_M_2012 > 0
replace Month = Q3_10E_M_2010 if missing(Month) & Q3_10E_M_2010 > 0
replace Month = Q3_10E_M_2008 if missing(Month) & Q3_10E_M_2008 > 0

* Source #2 -> YEAR AND MONTH OF HS GRADUATION

gen YearHS = Q3_8C_Y_2018 if Q3_8C_Y_2018 > 0
replace YearHS = Q3_8C_Y_2016 if missing(YearHS) & Q3_8C_Y_2016 > 0
replace YearHS = Q3_8C_Y_2014 if missing(YearHS) & Q3_8C_Y_2014 > 0
replace YearHS = Q3_8C_Y_2012 if missing(YearHS) & Q3_8C_Y_2012 > 0
replace YearHS = Q3_8C_Y_2010 if missing(YearHS) & Q3_8C_Y_2010 > 0
replace YearHS = Q3_8C_Y_2008 if missing(YearHS) & Q3_8C_Y_2008 > 0
replace YearHS = Q3_8C_Y_2006 if missing(YearHS) & Q3_8C_Y_2006 > 0
replace YearHS = Q3_8C_Y_2004 if missing(YearHS) & Q3_8C_Y_2004 > 0
replace YearHS = Q3_8C_Y_2002 if missing(YearHS) & Q3_8C_Y_2002 > 0
replace YearHS = Q3_8C_Y_2000 if missing(YearHS) & Q3_8C_Y_2000 > 0
replace YearHS = Q3_8C_Y_1998 if missing(YearHS) & Q3_8C_Y_1998 > 0
replace YearHS = Q3_8C_Y_1996 if missing(YearHS) & Q3_8C_Y_1996 > 0
replace YearHS = Q3_8C_Y_1994 if missing(YearHS) & Q3_8C_Y_1994 > 0
replace YearHS = 1900 + Q3_8C_Y_1992 if missing(YearHS) & Q3_8C_Y_1992 > 0
replace YearHS = 1900 + Q3_8C_Y_1991 if missing(YearHS) & Q3_8C_Y_1991 > 0
replace YearHS = 1900 + Q3_8C_Y_1990 if missing(YearHS) & Q3_8C_Y_1990 > 0
replace YearHS = 1900 + Q3_8C_Y_1989 if missing(YearHS) & Q3_8C_Y_1989 > 0
replace YearHS = 1900 + Q3_8C_Y_1988 if missing(YearHS) & Q3_8C_Y_1988 > 0
replace YearHS = 1900 + Q3_8C_Y_1987 if missing(YearHS) & Q3_8C_Y_1987 > 0
replace YearHS = 1900 + Q3_8C_Y_1986 if missing(YearHS) & Q3_8C_Y_1986 > 0
replace YearHS = 1900 + Q3_8C_Y_1985 if missing(YearHS) & Q3_8C_Y_1985 > 0
replace YearHS = 1900 + Q3_8C_Y_1984 if missing(YearHS) & Q3_8C_Y_1984 > 0
replace YearHS = 1900 + Q3_8C_Y_1983 if missing(YearHS) & Q3_8C_Y_1983 > 0
replace YearHS = 1900 + Q3_8C_Y_1982 if missing(YearHS) & Q3_8C_Y_1982 > 0
replace YearHS = 1900 + Q3_8C_Y_1981 if missing(YearHS) & Q3_8C_Y_1981 > 0
replace YearHS = 1900 + Q3_8C_Y_1980 if missing(YearHS) & Q3_8C_Y_1980 > 0
replace YearHS = 1900 + Q3_8C_Y_1979 if missing(YearHS) & Q3_8C_Y_1979 > 0

gen MonthHS = Q3_8C_M_2018 if Q3_8C_M_2018 > 0
replace MonthHS = Q3_8C_M_2016 if missing(MonthHS) & Q3_8C_M_2016 > 0
replace MonthHS = Q3_8C_M_2014 if missing(MonthHS) & Q3_8C_M_2014 > 0
replace MonthHS = Q3_8C_M_2012 if missing(MonthHS) & Q3_8C_M_2012 > 0
replace MonthHS = Q3_8C_M_2010 if missing(MonthHS) & Q3_8C_M_2010 > 0
replace MonthHS = Q3_8C_M_2008 if missing(MonthHS) & Q3_8C_M_2008 > 0
replace MonthHS = Q3_8C_M_2006 if missing(MonthHS) & Q3_8C_M_2006 > 0
replace MonthHS = Q3_8C_M_2004 if missing(MonthHS) & Q3_8C_M_2004 > 0
replace MonthHS = Q3_8C_M_2002 if missing(MonthHS) & Q3_8C_M_2002 > 0
replace MonthHS = Q3_8C_M_2000 if missing(MonthHS) & Q3_8C_M_2000 > 0
replace MonthHS = Q3_8C_M_1998 if missing(MonthHS) & Q3_8C_M_1998 > 0
replace MonthHS = Q3_8C_M_1996 if missing(MonthHS) & Q3_8C_M_1996 > 0
replace MonthHS = Q3_8C_M_1994 if missing(MonthHS) & Q3_8C_M_1994 > 0
replace MonthHS = Q3_8C_M_1992 if missing(MonthHS) & Q3_8C_M_1992 > 0
replace MonthHS = Q3_8C_M_1991 if missing(MonthHS) & Q3_8C_M_1991 > 0
replace MonthHS = Q3_8C_M_1990 if missing(MonthHS) & Q3_8C_M_1990 > 0
replace MonthHS = Q3_8C_M_1989 if missing(MonthHS) & Q3_8C_M_1989 > 0
replace MonthHS = Q3_8C_M_1988 if missing(MonthHS) & Q3_8C_M_1988 > 0
replace MonthHS = Q3_8C_M_1987 if missing(MonthHS) & Q3_8C_M_1987 > 0
replace MonthHS = Q3_8C_M_1986 if missing(MonthHS) & Q3_8C_M_1986 > 0
replace MonthHS = Q3_8C_M_1985 if missing(MonthHS) & Q3_8C_M_1985 > 0
replace MonthHS = Q3_8C_M_1984 if missing(MonthHS) & Q3_8C_M_1984 > 0
replace MonthHS = Q3_8C_M_1983 if missing(MonthHS) & Q3_8C_M_1983 > 0
replace MonthHS = Q3_8C_M_1982 if missing(MonthHS) & Q3_8C_M_1982 > 0
replace MonthHS = Q3_8C_M_1981 if missing(MonthHS) & Q3_8C_M_1981 > 0
replace MonthHS = Q3_8C_M_1980 if missing(MonthHS) & Q3_8C_M_1980 > 0
replace MonthHS = Q3_8C_M_1979 if missing(MonthHS) & Q3_8C_M_1979 > 0

***************************************************************************
* Compile Year/Month of highest school attainment 
***************************************************************************

gen grad = ym(Year, Month)
gen gradHS = ym(YearHS, MonthHS)

replace grad = grad1 if missing(grad)
replace grad = gradHS if missing(grad) & HGC_EVER == 12
format grad %tm

gen yr = yofd(dofm(grad))
extrdate month month = grad 

***************************************************************************
* Drop Missing Values
***************************************************************************

drop if missing(grad)

***************************************************************************
* Age at graduation (Highest Degree)
*************************************************************************** 

gen age_g = round((grad - dob)/12)

***************************************************************************
* Dummy Variables
*************************************************************************** 

gen HS = 1 if HGC_EVER == 12
replace HS = 0 if missing(HS)

gen FullCollege = 1 if HGC_EVER == 16
replace FullCollege = 0 if missing(FullCollege)

gen SomeCollege = 1 if (HGC_EVER >= 13 & HGC_EVER <= 15) & College == 0
replace SomeCollege = 0 if missing(SomeCollege)

gen PostGrad = 1 if HGC_EVER >= 17
replace PostGrad = 0 if missing(PostGrad)

******************************************************************************************************************************************************
**# DATE PREGNANCY 01 ENDING IN LIVE BIRTH 
******************************************************************************************************************************************************

gen gestweeks = PST0002_XRND if PST0002_XRND >= 0
replace gestweeks = 40 if missing(gestweeks)

gen gestmonth = round(gestweeks/4)

gen preg = child1 - gestmonth
format preg %tm

gen timetopreg = preg - grad
drop if timetopreg < 0

*************** deleting females with no kids after grad

drop if missing(preg)

***************************************************************************

* drop if missing a child 
drop if missing(child1) 

***************************************************************************
** # Mental Health Varibales + Health
***************************************************************************

* frequent feeling of sadness, blues, loneliness

gen sad = 1 if  H40_CESD_000008 >= 2
replace sad = 0 if missing(sad) &  H40_CESD_000008 >= 0

gen blues = 1 if  H40_CESD_000002 >= 2
replace blues = 0 if missing(blues) &  H40_CESD_000002 >= 0

gen lonely = 1 if H40_CESD_000007 >= 2
replace lonely = 0 if missing(lonely) & H40_CESD_000007 >= 0

******
* # of CHILDREN PERSON WANTED/EXPECTED (intial screening questions)
*****

gen expect = FER_3_1979 if FER_3_1979 >= 0
gen ideal = FER_1A_1979 if FER_1A_1979 >= 0
replace expect = ideal if missing(expect)

* number of children currently in the household
gen everborn = NUMKID

gen diff = expect - everborn

* born less children than expected 
gen less = 1 if diff > 0
replace less = 0 if diff <= 0

* born more children than expected 
gen more = 1 if diff < 0
replace more = 0 if diff >= 0

************************************************************************************************************
** Region at the graduation
************************************************************************************************************

gen region = REGION_1979 if grad >= ym(1971,1) & grad <= ym(1979,12)
replace region = REGION_1980 if grad >= ym(1980,1) & grad <= ym(1980,12) 
replace region = REGION_1981 if grad >= ym(1981,1) & grad <= ym(1981,12) 
replace region = REGION_1982 if grad >= ym(1982,1) & grad <= ym(1982,12) 
replace region = REGION_1983 if grad >= ym(1983,1) & grad <= ym(1983,12) 
replace region = REGION_1984 if grad >= ym(1984,1) & grad <= ym(1984,12) 
replace region = REGION_1985 if grad >= ym(1985,1) & grad <= ym(1985,12)
replace region = REGION_1986 if grad >= ym(1986,1) & grad <= ym(1986,12) 
replace region = REGION_1987 if grad >= ym(1987,1) & grad <= ym(1987,12)
replace region = REGION_1988 if grad >= ym(1988,1) & grad <= ym(1988,12)
replace region = REGION_1989 if grad >= ym(1989,1) & grad <= ym(1989,12) 
replace region = REGION_1990 if grad >= ym(1990,1) & grad <= ym(1990,12) 
replace region = REGION_1991 if grad >= ym(1991,1) & grad <= ym(1991,12) 
replace region = REGION_1992 if grad >= ym(1992,1) & grad <= ym(1992,12)
replace region = REGION_1993 if grad >= ym(1993,1) & grad <= ym(1993,12) 
replace region = REGION_1994 if grad >= ym(1994,1) & grad <= ym(1994,12) 
replace region = REGION_1996 if grad >= ym(1995,1) & grad <= ym(1996,12) 
replace region = REGION_1998 if grad >= ym(1997,1) & grad <= ym(1998,12) 
replace region = REGION_2000 if grad >= ym(1999,1) & grad <= ym(2000,12) 
replace region = REGION_2002 if grad >= ym(2001,1) & grad <= ym(2002,12) 
replace region = REGION_2004 if grad >= ym(2003,1) & grad <= ym(2004,12) 

label define region 1 "Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)"  2 "North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)"  3 "South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)"  4 "West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)" 
label values region region

***************************************************************************
* Race 
*************************************************************************** 

gen raceB = 1 if SAMPLE_RACE_78SCRN == 2  // black
replace raceB = 0 if missing(raceB)

gen raceW = 1 if SAMPLE_RACE_78SCRN == 3  // white
replace raceW = 0 if missing(raceW)

gen raceH = 1 if SAMPLE_RACE_78SCRN == 1  
replace raceH = 0 if missing(raceH)

***************************************************************************
* Years of schooling completed of parents
*************************************************************************** 

gen fgrade = HGC_FATHER_1979 if HGC_FATHER_1979 > 0
gen mgrade = HGC_MOTHER_1979 if HGC_MOTHER_1979 > 0

* more than HS 1, 0 if not
gen momed = 1 if HGC_MOTHER_1979 >= 12
replace momed = 0 if missing(momed)

gen daded = 1 if HGC_FATHER_1979 >= 12
replace daded = 0 if missing(daded)

***************************************************************************
* religion
*************************************************************************** 

gen cath = 1 if R_REL_1_COL_1979 == 7
replace cath = 0 if missing(cath)

gen prot = 1 if R_REL_1_COL_1979 == 7
replace prot = 0 if missing(cath)

********************************************************************************
** Marital Status 
********************************************************************************

gen mar1 = ym(YRBG1M, MOBG1M)
format mar1 %tm

gen mar1end = ym(YREN1M, MOEN1M)
format mar1end %tm

gen mar2 = ym(YRBG2M, MOBG2M)
format mar2 %tm

gen mar2end = ym(YREN2M, MOEN2M)
format mar2end %tm

gen mar3 = ym(YRBG3M, MOBG3M)
format mar3 %tm

gen mar3end = ym(YREN3M, MOEN3M)
format mar3end %tm

gen mar4 = ym(YRBG4M, MOBG4M)
format mar4 %tm

gen mar4end = ym(YREN4M, MOEN4M)
format mar4end %tm

gen mar5 = ym(YRBG5M, MOBG5M)
format mar5 %tm

gen mar5end = ym(YREN5M, MOEN5M)
format mar5end %tm

gen mar6 = ym(YRBG6M, MOBG6M)
format mar6 %tm

gen mar6end = ym(YREN6M, MOEN6M)
format mar6end %tm

gen mar7 = ym(YRBG7M, MOBG7M)
format mar7 %tm

gen mar7end = ym(YREN7M, MOEN7M)
format mar7end %tm

********************************************************************************
** Flag Marital Status at Graduation (started before grad. and ended after)
********************************************************************************

gen mared1 = mar1 if mar1 <= grad & mar1end >= grad
gen mared2 = mar2 if mar2 <= grad & mar2end >= grad
gen mared3 = mar3 if mar3 <= grad & mar3end >= grad
gen mared4 = mar4 if mar4 <= grad & mar4end >= grad
gen mared5 = mar5 if mar5 <= grad & mar5end >= grad
gen mared6 = mar6 if mar6 <= grad & mar6end >= grad

format mared1 %tm
format mared2 %tm
format mared3 %tm
format mared4 %tm
format mared5 %tm
format mared6 %tm

gen tmar = mared1 
replace tmar = mared2 if missing(tmar)
replace tmar = mared3 if missing(tmar)
replace tmar = mared4 if missing(tmar)
replace tmar = mared5 if missing(tmar)
replace tmar = mared6 if missing(tmar)

*** MAR STATUS AT GRAD

gen marr = 1 if !missing(tmar) 
replace marr = 0 if missing(marr) 

********************************************************************************
** Flag Marital Status at conception (started before con. and ended after)
********************************************************************************

gen marc1 = mar1 if mar1 <= preg & mar1end >= preg
gen marc2 = mar2 if mar2 <= preg & mar2end >= preg
gen marc3 = mar3 if mar3 <= preg & mar3end >= preg
gen marc4 = mar4 if mar4 <= preg & mar4end >= preg
gen marc5 = mar5 if mar5 <= preg & mar5end >= preg
gen marc6 = mar6 if mar6 <= preg & mar6end >= preg

format marc1 %tm
format marc2 %tm
format marc3 %tm
format marc4 %tm
format marc5 %tm
format marc6 %tm

gen timemar = marc1 
replace timemar = marc2 if missing(timemar)
replace timemar = marc3 if missing(timemar)
replace timemar = marc4 if missing(timemar)
replace timemar = marc5 if missing(timemar)
replace timemar = marc6 if missing(timemar)

*** MAR STATUS AT CONCEPTION

gen mar = 1 if !missing(timemar) // married
replace mar = 0 if missing(mar)  // otherwise
 
*** Age at First Marriage

gen age_m = round((mar1 - dob)/12)

********************************************************************************
*** TIME TO CONCEPTION FROM GRAD.
********************************************************************************

drop if preg < grad
gen time = preg - grad
gen time_y = round(timetopreg/12)

**********
* Delivery (c-section)
**********

gen delivery = 1 if PST0007_XRND == 1
replace delivery = 0 if PST0007_XRND == 0

************************************************************************************************************
** central city
************************************************************************************************************

gen city14 = 1 if FAM_6_1979 == 1
replace city14 = 0 if missing(city14) & FAM_6_1979 >= 0

************************************************************************************************************
** urban
************************************************************************************************************

gen urban = URBAN_RURAL_1979 if grad>= ym(1971,1) & grad<= ym(1979,12)
replace urban = URBAN_RURAL_1980 if grad>= ym(1980,1) & grad<= ym(1980,12) 
replace urban = URBAN_RURAL_1981 if grad>= ym(1981,1) & grad<= ym(1981,12) 
replace urban = URBAN_RURAL_1982 if grad>= ym(1982,1) & grad<= ym(1982,12) 
replace urban = URBAN_RURAL_1983 if grad>= ym(1983,1) & grad<= ym(1983,12)
replace urban = URBAN_RURAL_1984 if grad>= ym(1984,1) & grad<= ym(1984,12) 
replace urban = URBAN_RURAL_1985 if grad>= ym(1985,1) & grad<= ym(1985,12)
replace urban = URBAN_RURAL_1986 if grad>= ym(1986,1) & grad<= ym(1986,12) 
replace urban = URBAN_RURAL_1987 if grad>= ym(1987,1) & grad<= ym(1987,12) 
replace urban = URBAN_RURAL_1988 if grad>= ym(1988,1) & grad<= ym(1988,12)
replace urban = URBAN_RURAL_1989 if grad>= ym(1989,1) & grad<= ym(1989,12) 
replace urban = URBAN_RURAL_1990 if grad>= ym(1990,1) & grad<= ym(1990,12)

********************************************************************************
** Accumulated work experience (years) at conception
********************************************************************************

*** WORK START DATE

gen work1 = ym(ALL_STARTDATE_ORIGINAL_01_Y, ALL_STARTDATE_ORIGINAL_01_M)
format work1 %tm

gen work2 = ym(ALL_STARTDATE_ORIGINAL_02_Y, ALL_STARTDATE_ORIGINAL_02_M)
format work2 %tm

gen work3 = ym(ALL_STARTDATE_ORIGINAL_03_Y, ALL_STARTDATE_ORIGINAL_03_M)
format work3 %tm

gen work4 = ym(ALL_STARTDATE_ORIGINAL_04_Y, ALL_STARTDATE_ORIGINAL_04_M)
format work4 %tm

gen work5 = ym(ALL_STARTDATE_ORIGINAL_05_Y, ALL_STARTDATE_ORIGINAL_05_M)
format work5 %tm

gen work6 = ym(ALL_STARTDATE_ORIGINAL_06_Y, ALL_STARTDATE_ORIGINAL_06_M)
format work6 %tm

gen work7 = ym(ALL_STARTDATE_ORIGINAL_07_Y, ALL_STARTDATE_ORIGINAL_07_M)
format work7 %tm

gen work8 = ym(ALL_STARTDATE_ORIGINAL_08_Y, ALL_STARTDATE_ORIGINAL_08_M)
format work8 %tm

gen work9 = ym(ALL_STARTDATE_ORIGINAL_09_Y, ALL_STARTDATE_ORIGINAL_09_M)
format work9 %tm

gen work10 = ym(ALL_STARTDATE_ORIGINAL_10_Y, ALL_STARTDATE_ORIGINAL_10_M)
format work10 %tm

gen work11 = ym(ALL_STARTDATE_ORIGINAL_11_Y, ALL_STARTDATE_ORIGINAL_11_M)
format work11 %tm

gen work12 = ym(ALL_STARTDATE_ORIGINAL_12_Y, ALL_STARTDATE_ORIGINAL_12_M)
format work12 %tm

gen work13 = ym(ALL_STARTDATE_ORIGINAL_13_Y, ALL_STARTDATE_ORIGINAL_13_M)
format work13 %tm

gen work14 = ym(ALL_STARTDATE_ORIGINAL_14_Y, ALL_STARTDATE_ORIGINAL_14_M)
format work14 %tm

gen work15 = ym(ALL_STARTDATE_ORIGINAL_15_Y, ALL_STARTDATE_ORIGINAL_15_M)
format work15 %tm

gen work16 = ym(ALL_STARTDATE_ORIGINAL_16_Y, ALL_STARTDATE_ORIGINAL_16_M)
format work16 %tm

gen work17 = ym(ALL_STARTDATE_ORIGINAL_17_Y, ALL_STARTDATE_ORIGINAL_17_M)
format work17 %tm

gen work18 = ym(ALL_STARTDATE_ORIGINAL_18_Y, ALL_STARTDATE_ORIGINAL_18_M)
format work18 %tm

gen work19 = ym(ALL_STARTDATE_ORIGINAL_19_Y, ALL_STARTDATE_ORIGINAL_19_M)
format work19 %tm

gen work20 = ym(ALL_STARTDATE_ORIGINAL_20_Y, ALL_STARTDATE_ORIGINAL_20_M)
format work20 %tm

gen work21 = ym(ALL_STARTDATE_ORIGINAL_21_Y, ALL_STARTDATE_ORIGINAL_21_M)
format work21 %tm

gen work22 = ym(ALL_STARTDATE_ORIGINAL_22_Y, ALL_STARTDATE_ORIGINAL_22_M)
format work22 %tm

gen work23 = ym(ALL_STARTDATE_ORIGINAL_23_Y, ALL_STARTDATE_ORIGINAL_23_M)
format work23 %tm

gen work24 = ym(ALL_STARTDATE_ORIGINAL_24_Y, ALL_STARTDATE_ORIGINAL_24_M)
format work24 %tm

gen work25 = ym(ALL_STARTDATE_ORIGINAL_25_Y, ALL_STARTDATE_ORIGINAL_25_M)
format work25 %tm

gen work26 = ym(ALL_STARTDATE_ORIGINAL_26_Y, ALL_STARTDATE_ORIGINAL_26_M)
format work26 %tm

gen work27 = ym(ALL_STARTDATE_ORIGINAL_27_Y, ALL_STARTDATE_ORIGINAL_27_M)
format work27 %tm

gen work28 = ym(ALL_STARTDATE_ORIGINAL_28_Y, ALL_STARTDATE_ORIGINAL_28_M)
format work28 %tm

gen work29 = ym(ALL_STARTDATE_ORIGINAL_29_Y, ALL_STARTDATE_ORIGINAL_29_M)
format work29 %tm

gen work30 = ym(ALL_STARTDATE_ORIGINAL_30_Y, ALL_STARTDATE_ORIGINAL_30_M)
format work30 %tm

gen work31 = ym(ALL_STARTDATE_ORIGINAL_31_Y, ALL_STARTDATE_ORIGINAL_31_M)
format work31 %tm

gen work32 = ym(ALL_STARTDATE_ORIGINAL_32_Y, ALL_STARTDATE_ORIGINAL_32_M)
format work32 %tm

gen work33 = ym(ALL_STARTDATE_ORIGINAL_33_Y, ALL_STARTDATE_ORIGINAL_33_M)
format work33 %tm

*** WORK END DATE

gen work1end = ym(ALL_STOPDATE_MOST_RECENT_01_Y, ALL_STOPDATE_MOST_RECENT_01_M)
format work1end %tm

gen work2end = ym(ALL_STOPDATE_MOST_RECENT_02_Y, ALL_STOPDATE_MOST_RECENT_02_M)
format work2end %tm

gen work3end = ym(ALL_STOPDATE_MOST_RECENT_03_Y, ALL_STOPDATE_MOST_RECENT_03_M)
format work3end %tm

gen work4end = ym(ALL_STOPDATE_MOST_RECENT_04_Y, ALL_STOPDATE_MOST_RECENT_04_M)
format work4end %tm

gen work5end = ym(ALL_STOPDATE_MOST_RECENT_05_Y, ALL_STOPDATE_MOST_RECENT_05_M)
format work5end %tm

gen work6end = ym(ALL_STOPDATE_MOST_RECENT_06_Y, ALL_STOPDATE_MOST_RECENT_06_M)
format work6end %tm

gen work7end = ym(ALL_STOPDATE_MOST_RECENT_07_Y, ALL_STOPDATE_MOST_RECENT_07_M)
format work7end %tm

gen work8end = ym(ALL_STOPDATE_MOST_RECENT_08_Y, ALL_STOPDATE_MOST_RECENT_08_M)
format work8end %tm

gen work9end = ym(ALL_STOPDATE_MOST_RECENT_09_Y, ALL_STOPDATE_MOST_RECENT_09_M)
format work9end %tm

gen work10end = ym(ALL_STOPDATE_MOST_RECENT_10_Y, ALL_STOPDATE_MOST_RECENT_10_M)
format work10end %tm

gen work11end = ym(ALL_STOPDATE_MOST_RECENT_11_Y, ALL_STOPDATE_MOST_RECENT_11_M)
format work11end %tm

gen work12end = ym(ALL_STOPDATE_MOST_RECENT_12_Y, ALL_STOPDATE_MOST_RECENT_12_M)
format work12end %tm

gen work13end = ym(ALL_STOPDATE_MOST_RECENT_13_Y, ALL_STOPDATE_MOST_RECENT_13_M)
format work13end %tm

gen work14end = ym(ALL_STOPDATE_MOST_RECENT_14_Y, ALL_STOPDATE_MOST_RECENT_14_M)
format work14end %tm

gen work15end = ym(ALL_STOPDATE_MOST_RECENT_15_Y, ALL_STOPDATE_MOST_RECENT_15_M)
format work15end %tm

gen work16end = ym(ALL_STOPDATE_MOST_RECENT_16_Y, ALL_STOPDATE_MOST_RECENT_16_M)
format work16end %tm

gen work17end = ym(ALL_STOPDATE_MOST_RECENT_17_Y, ALL_STOPDATE_MOST_RECENT_17_M)
format work17end %tm

gen work18end = ym(ALL_STOPDATE_MOST_RECENT_18_Y, ALL_STOPDATE_MOST_RECENT_18_M)
format work18end %tm

gen work19end = ym(ALL_STOPDATE_MOST_RECENT_19_Y, ALL_STOPDATE_MOST_RECENT_19_M)
format work19end %tm

gen work20end = ym(ALL_STOPDATE_MOST_RECENT_20_Y, ALL_STOPDATE_MOST_RECENT_20_M)
format work20end %tm

gen work21end = ym(ALL_STOPDATE_MOST_RECENT_21_Y, ALL_STOPDATE_MOST_RECENT_21_M)
format work21end %tm

gen work22end = ym(ALL_STOPDATE_MOST_RECENT_22_Y, ALL_STOPDATE_MOST_RECENT_22_M)
format work22end %tm

gen work23end = ym(ALL_STOPDATE_MOST_RECENT_23_Y, ALL_STOPDATE_MOST_RECENT_23_M)
format work23end %tm

gen work24end = ym(ALL_STOPDATE_MOST_RECENT_24_Y, ALL_STOPDATE_MOST_RECENT_24_M)
format work24end %tm

gen work25end = ym(ALL_STOPDATE_MOST_RECENT_25_Y, ALL_STOPDATE_MOST_RECENT_25_M)
format work25end %tm

gen work26end = ym(ALL_STOPDATE_MOST_RECENT_26_Y, ALL_STOPDATE_MOST_RECENT_26_M)
format work26end %tm

gen work27end = ym(ALL_STOPDATE_MOST_RECENT_27_Y, ALL_STOPDATE_MOST_RECENT_27_M)
format work27end %tm

gen work28end = ym(ALL_STOPDATE_MOST_RECENT_28_Y, ALL_STOPDATE_MOST_RECENT_28_M)
format work28end %tm

gen work29end = ym(ALL_STOPDATE_MOST_RECENT_29_Y, ALL_STOPDATE_MOST_RECENT_29_M)
format work29end %tm

gen work30end = ym(ALL_STOPDATE_MOST_RECENT_30_Y, ALL_STOPDATE_MOST_RECENT_30_M)
format work30end %tm

gen work31end = ym(ALL_STOPDATE_MOST_RECENT_31_Y, ALL_STOPDATE_MOST_RECENT_31_M)
format work31end %tm

gen work32end = ym(ALL_STOPDATE_MOST_RECENT_32_Y, ALL_STOPDATE_MOST_RECENT_32_M)
format work32end %tm

** Flag if started work before the graduation

gen workingrad = 1 if work1 <= grad & work1end > grad & !missing(work1)
replace workingrad = 2 if work2 <= grad & work2end > grad & missing(workingrad) & !missing(work2)
replace workingrad = 3 if work3 <= grad & work3end > grad & missing(workingrad) & !missing(work3)
replace workingrad = 4 if work4 <= grad & work4end > grad & missing(workingrad) & !missing(work4)
replace workingrad = 5 if work5 <= grad & work5end > grad & missing(workingrad) & !missing(work5)
replace workingrad = 6 if work6 <= grad & work6end > grad & missing(workingrad) & !missing(work6)
replace workingrad = 7 if work7 <= grad & work7end > grad & missing(workingrad) & !missing(work7)
replace workingrad = 8 if work8 <= grad & work8end > grad & missing(workingrad) & !missing(work8)
replace workingrad = 9 if work9 <= grad & work9end > grad & missing(workingrad) & !missing(work9)
replace workingrad = 10 if work10 <= grad & work10end > grad & missing(workingrad)  & !missing(work10)
replace workingrad = 11 if work11 <= grad & work11end > grad & missing(workingrad) & !missing(work11)
replace workingrad = 12 if work12 <= grad & work12end > grad & missing(workingrad)  & !missing(work12)
replace workingrad = 13 if work13 <= grad & work13end > grad & missing(workingrad)  & !missing(work13)
replace workingrad = 14 if work14 <= grad & work14end > grad & missing(workingrad) & !missing(work14)
replace workingrad = 15 if work15 <= grad & work15end > grad & missing(workingrad) & !missing(work15)
replace workingrad = 16 if work16 <= grad & work16end > grad & missing(workingrad) & !missing(work16)
replace workingrad = 18 if work18 <= grad & work18end > grad & missing(workingrad) & !missing(work18)
replace workingrad = 19 if work19 <= grad & work19end > grad & missing(workingrad)  & !missing(work19)
replace workingrad = 20 if work20 <= grad & work20end > grad & missing(workingrad)  & !missing(work20)
replace workingrad = 21 if work21 <= grad & work21end > grad & missing(workingrad)  & !missing(work21)
replace workingrad = 23 if work23 <= grad & work23end > grad & missing(workingrad)  & !missing(work23)
replace workingrad = 24 if work24 <= grad & work24end > grad & missing(workingrad)  & !missing(work24)

********************************************************************************
** Labor Status at Graduation
********************************************************************************
 
gen work = 1 if !missing(workingrad)
replace work = 0 if missing(work)

********************************************************************************
** UR at graduation (national)
*******************************************************************************
gen URn = 5.1 if grad == ym(1974, 1)       
replace URn = 5.2 if grad == ym(1974, 2)
replace URn = 5.1 if grad == ym(1974, 3)
replace URn = 5.1 if grad == ym(1974, 4)
replace URn = 5.1 if grad == ym(1974, 5)
replace URn = 5.4 if grad == ym(1974, 6)
replace URn = 5.5 if grad == ym(1974, 7)
replace URn = 5.5 if grad == ym(1974, 8)
replace URn = 5.9 if grad == ym(1974, 9)
replace URn = 6   if grad == ym(1974, 10)
replace URn = 6.6 if grad == ym(1974, 11)
replace URn = 7.2 if grad == ym(1974, 12)
replace URn = 8.1 if grad == ym(1975, 1)       
replace URn = 8.1 if grad == ym(1975, 2)
replace URn = 8.6 if grad == ym(1975, 3)
replace URn = 8.8 if grad == ym(1975, 4)
replace URn = 9 if grad == ym(1975, 5)
replace URn = 8.8 if grad == ym(1975, 6)
replace URn = 8.6 if grad == ym(1975, 7)
replace URn = 8.4 if grad == ym(1975, 8)
replace URn = 8.4 if grad == ym(1975, 9)
replace URn = 8.4 if grad == ym(1975, 10)
replace URn = 8.3 if grad == ym(1975, 11)
replace URn = 8.2 if grad == ym(1975, 12)
replace URn = 7.9 if grad == ym(1976, 1)       
replace URn = 7.7 if grad == ym(1976, 2)
replace URn = 7.6 if grad == ym(1976, 3)
replace URn = 7.7 if grad == ym(1976, 4)
replace URn = 7.4 if grad == ym(1976, 5)
replace URn = 7.6 if grad == ym(1976, 6)
replace URn = 7.8 if grad == ym(1976, 7)
replace URn = 7.8 if grad == ym(1976, 8)
replace URn = 7.6 if grad == ym(1976, 9)
replace URn = 7.7 if grad == ym(1976, 10)
replace URn = 7.8 if grad == ym(1976, 11)
replace URn = 7.8 if grad == ym(1976, 12)
replace URn = 7.5 if grad == ym(1977, 1)       
replace URn = 7.6 if grad == ym(1977, 2)       
replace URn = 7.4 if grad == ym(1977, 3)
replace URn = 7.2 if grad == ym(1977, 4)
replace URn = 7   if grad == ym(1977, 5)
replace URn = 7.2 if grad == ym(1977, 6)
replace URn = 6.9 if grad == ym(1977, 7)
replace URn = 7   if grad == ym(1977, 8)
replace URn = 6.8 if grad == ym(1977, 9)
replace URn = 6.8 if grad == ym(1977, 10)
replace URn = 6.8 if grad == ym(1977, 11)
replace URn = 6.4 if grad == ym(1977, 12)
replace URn = 6.4 if grad == ym(1978, 1)       
replace URn = 6.3 if grad == ym(1978, 2)       
replace URn = 6.3 if grad == ym(1978, 3)
replace URn = 6.1 if grad == ym(1978, 4)
replace URn = 6   if grad == ym(1978, 5)
replace URn = 5.9 if grad == ym(1978, 6)
replace URn = 6.2 if grad == ym(1978, 7)
replace URn = 5.9 if grad == ym(1978, 8)
replace URn = 6   if grad == ym(1978, 9)
replace URn = 5.8 if grad == ym(1978, 10)
replace URn = 5.9 if grad == ym(1978, 11)
replace URn = 6   if grad == ym(1978, 12)
replace URn = 5.9 if grad == ym(1979, 1)       
replace URn = 5.9 if grad == ym(1979, 2)       
replace URn = 5.8 if grad == ym(1979, 3)
replace URn = 5.8 if grad == ym(1979, 4)
replace URn = 5.6 if grad == ym(1979, 5)
replace URn = 5.7 if grad == ym(1979, 6)
replace URn = 5.7 if grad == ym(1979, 7)
replace URn = 6   if grad == ym(1979, 8)
replace URn = 5.9 if grad == ym(1979, 9)
replace URn = 6   if grad == ym(1979, 10)
replace URn = 5.9 if grad == ym(1979, 11)
replace URn = 6   if grad == ym(1979, 12)
replace URn = 6.3 if grad == ym(1980, 1)       
replace URn = 6.3 if grad == ym(1980, 2)       
replace URn = 6.3 if grad == ym(1980, 3)
replace URn = 6.9 if grad == ym(1980, 4)
replace URn = 7.5 if grad == ym(1980, 5)
replace URn = 7.6 if grad == ym(1980, 6)
replace URn = 7.8 if grad == ym(1980, 7)
replace URn = 7.7 if grad == ym(1980, 8)
replace URn = 7.5 if grad == ym(1980, 9)
replace URn = 7.5 if grad == ym(1980, 10)
replace URn = 7.5 if grad == ym(1980, 11)
replace URn = 7.2 if grad == ym(1980, 12)
replace URn = 7.5 if grad == ym(1981, 1)       
replace URn = 7.4 if grad == ym(1981, 2)       
replace URn = 7.4 if grad == ym(1981, 3)
replace URn = 7.2 if grad == ym(1981, 4)
replace URn = 7.5 if grad == ym(1981, 5)
replace URn = 7.5 if grad == ym(1981, 6)
replace URn = 7.2 if grad == ym(1981, 7)
replace URn = 7.4 if grad == ym(1981, 8)
replace URn = 7.6 if grad == ym(1981, 9)
replace URn = 7.9 if grad == ym(1981, 10)
replace URn = 8.3 if grad == ym(1981, 11)
replace URn = 8.5 if grad == ym(1981, 12)
replace URn = 8.6 if grad == ym(1982, 1)       
replace URn = 8.9 if grad == ym(1982, 2)       
replace URn = 9   if grad == ym(1982, 3)
replace URn = 9.3 if grad == ym(1982, 4)
replace URn = 9.4 if grad == ym(1982, 5)
replace URn = 9.6 if grad == ym(1982, 6)
replace URn = 9.8 if grad == ym(1982, 7)
replace URn = 9.8 if grad == ym(1982, 8)
replace URn = 10.1 if grad == ym(1982, 9)
replace URn = 10.4 if grad == ym(1982, 10)
replace URn = 10.8 if grad == ym(1982, 11)
replace URn = 10.8 if grad == ym(1982, 12)
replace URn = 10.4 if grad == ym(1983, 1)       
replace URn = 10.4 if grad == ym(1983, 2)       
replace URn = 10.3 if grad == ym(1983, 3)
replace URn = 10.2 if grad == ym(1983, 4)
replace URn = 10.1 if grad == ym(1983, 5)
replace URn = 10.1 if grad == ym(1983, 6)
replace URn = 9.4 if grad == ym(1983, 7)
replace URn = 9.5 if grad == ym(1983, 8)
replace URn = 9.2 if grad == ym(1983, 9)
replace URn = 8.8 if grad == ym(1983, 10)
replace URn = 8.5 if grad == ym(1983, 11)
replace URn = 8.3 if grad == ym(1983, 12)
replace URn = 8 if grad == ym(1984, 1)       
replace URn = 7.8 if grad == ym(1984, 2)       
replace URn = 7.8 if grad == ym(1984, 3)
replace URn = 7.7 if grad == ym(1984, 4)
replace URn = 7.4 if grad == ym(1984, 5)
replace URn = 7.2 if grad == ym(1984, 6)
replace URn = 7.5 if grad == ym(1984, 7)
replace URn = 7.5 if grad == ym(1984, 8)
replace URn = 7.3 if grad == ym(1984, 9)
replace URn = 7.4 if grad == ym(1984, 10)
replace URn = 7.2 if grad == ym(1984, 11)
replace URn = 7.3 if grad == ym(1984, 12)
replace URn = 7.3 if grad == ym(1985, 1)       
replace URn = 7.2 if grad == ym(1985, 2)       
replace URn = 7.2 if grad == ym(1985, 3)
replace URn = 7.3 if grad == ym(1985, 4)
replace URn = 7.2 if grad == ym(1985, 5)
replace URn = 7.4 if grad == ym(1985, 6)
replace URn = 7.4 if grad == ym(1985, 7)
replace URn = 7.1 if grad == ym(1985, 8)
replace URn = 7.1 if grad == ym(1985, 9)
replace URn = 7.1 if grad == ym(1985, 10)
replace URn = 7 if grad == ym(1985, 11)
replace URn = 7 if grad == ym(1985, 12)
replace URn = 6.7 if grad == ym(1986, 1)       
replace URn = 7.2 if grad == ym(1986, 2)       
replace URn = 7.2 if grad == ym(1986, 3)
replace URn = 7.1 if grad == ym(1986, 4)
replace URn = 7.2 if grad == ym(1986, 5)
replace URn = 7.2 if grad == ym(1986, 6)
replace URn = 7 if grad == ym(1986, 7)
replace URn = 6.9 if grad == ym(1986, 8)
replace URn = 7 if grad == ym(1986, 9)
replace URn = 7 if grad == ym(1986, 10)
replace URn = 6.9 if grad == ym(1986, 11)
replace URn = 6.6 if grad == ym(1986, 12)
replace URn = 6.6 if grad == ym(1987, 1)       
replace URn = 6.6 if grad == ym(1987, 2)       
replace URn = 6.6 if grad == ym(1987, 3)
replace URn = 6.3 if grad == ym(1987, 4)
replace URn = 6.3 if grad == ym(1987, 5)
replace URn = 6.2 if grad == ym(1987, 6)
replace URn = 6.1 if grad == ym(1987, 7)
replace URn = 6 if grad == ym(1987, 8)
replace URn = 5.9 if grad == ym(1987, 9)
replace URn = 6 if grad == ym(1987, 10)
replace URn = 5.8 if grad == ym(1987, 11)
replace URn = 5.7 if grad == ym(1987, 12)
replace URn = 5.7 if grad == ym(1988, 1)       
replace URn = 5.7 if grad == ym(1988, 2)       
replace URn = 5.7 if grad == ym(1988, 3)
replace URn = 5.4 if grad == ym(1988, 4)
replace URn = 5.6 if grad == ym(1988, 5)
replace URn = 5.4 if grad == ym(1988, 6)
replace URn = 5.4 if grad == ym(1988, 7)
replace URn = 5.6 if grad == ym(1988, 8)
replace URn = 5.4 if grad == ym(1988, 9)
replace URn = 5.4 if grad == ym(1988, 10)
replace URn = 5.3 if grad == ym(1988, 11)
replace URn = 5.3 if grad == ym(1988, 12)
replace URn = 5.4 if grad == ym(1989, 1)       
replace URn = 5.2 if grad == ym(1989, 2)       
replace URn = 5 if grad == ym(1989, 3)
replace URn = 5.2 if grad == ym(1989, 4)
replace URn = 5.2 if grad == ym(1989, 5)
replace URn = 5.3 if grad == ym(1989, 6)
replace URn = 5.2 if grad == ym(1989, 7)
replace URn = 5.2 if grad == ym(1989, 8)
replace URn = 5.3 if grad == ym(1989, 9)
replace URn = 5.3 if grad == ym(1989, 10)
replace URn = 5.4 if grad == ym(1989, 11)
replace URn = 5.4 if grad == ym(1989, 12)
replace URn = 5.4 if grad == ym(1990, 1)       
replace URn = 5.3 if grad == ym(1990, 2)       
replace URn = 5.2 if grad == ym(1990, 3)
replace URn = 5.4 if grad == ym(1990, 4)
replace URn = 5.4 if grad == ym(1990, 5)
replace URn = 5.2 if grad == ym(1990, 6)
replace URn = 5.5 if grad == ym(1990, 7)
replace URn = 5.7 if grad == ym(1990, 8)
replace URn = 5.9 if grad == ym(1990, 9)
replace URn = 5.9 if grad == ym(1990, 10)
replace URn = 6.2 if grad == ym(1990, 11)
replace URn = 6.3 if grad == ym(1990, 12)
replace URn = 6.4 if grad == ym(1991, 1)       
replace URn = 6.6 if grad == ym(1991, 2)       
replace URn = 6.8 if grad == ym(1991, 3)
replace URn = 6.7 if grad == ym(1991, 4)
replace URn = 6.9 if grad == ym(1991, 5)
replace URn = 6.9 if grad == ym(1991, 6)
replace URn = 6.8 if grad == ym(1991, 7)
replace URn = 6.9 if grad == ym(1991, 8)
replace URn = 6.9 if grad == ym(1991, 9)
replace URn = 7 if grad == ym(1991, 10)
replace URn = 7 if grad == ym(1991, 11)
replace URn = 7.3 if grad == ym(1991, 12)
replace URn = 7.3 if grad == ym(1992, 1)       
replace URn = 7.4 if grad == ym(1992, 2)       
replace URn = 7.4 if grad == ym(1992, 3)
replace URn = 7.4 if grad == ym(1992, 4)
replace URn = 7.6 if grad == ym(1992, 5)
replace URn = 7.8 if grad == ym(1992, 6)
replace URn = 7.7 if grad == ym(1992, 7)
replace URn = 7.6 if grad == ym(1992, 8)
replace URn = 7.6 if grad == ym(1992, 9)
replace URn = 7.3 if grad == ym(1992, 10)
replace URn = 7.4 if grad == ym(1992, 11)
replace URn = 7.4 if grad == ym(1992, 12)
replace URn = 7.3 if grad == ym(1993, 1)       
replace URn = 7.1 if grad == ym(1993, 2)       
replace URn = 7 if grad == ym(1993, 3)
replace URn = 7.1 if grad == ym(1993, 4)
replace URn = 7.1 if grad == ym(1993, 5)
replace URn = 7 if grad == ym(1993, 6)
replace URn = 6.9 if grad == ym(1993, 7)
replace URn = 6.8 if grad == ym(1993, 8)
replace URn = 6.7 if grad == ym(1993, 9)
replace URn = 6.8 if grad == ym(1993, 10)
replace URn = 6.6 if grad == ym(1993, 11)
replace URn = 6.5 if grad == ym(1993, 12)
replace URn = 6.6 if grad == ym(1994, 1)       
replace URn = 6.6 if grad == ym(1994, 2)       
replace URn = 6.5 if grad == ym(1994, 3)
replace URn = 6.4 if grad == ym(1994, 4)
replace URn = 6.1 if grad == ym(1994, 5)
replace URn = 6.1 if grad == ym(1994, 6)
replace URn = 6.1 if grad == ym(1994, 7)
replace URn = 6 if grad == ym(1994, 8)
replace URn = 5.9 if grad == ym(1994, 9)
replace URn = 5.8 if grad == ym(1994, 10)
replace URn = 5.6 if grad == ym(1994, 11)
replace URn = 5.5 if grad == ym(1994, 12)
replace URn = 5.6 if grad == ym(1995, 1)       
replace URn = 5.4 if grad == ym(1995, 2)       
replace URn = 5.4 if grad == ym(1995, 3)
replace URn = 5.8 if grad == ym(1995, 4)
replace URn = 5.6 if grad == ym(1995, 5)
replace URn = 5.6 if grad == ym(1995, 6)
replace URn = 5.7 if grad == ym(1995, 7)
replace URn = 5.7 if grad == ym(1995, 8)
replace URn = 5.6 if grad == ym(1995, 9)
replace URn = 5.5 if grad == ym(1995, 10)
replace URn = 5.6 if grad == ym(1995, 11)
replace URn = 5.6 if grad == ym(1995, 12)
replace URn = 5.6 if grad == ym(1996, 1)       
replace URn = 5.5 if grad == ym(1996, 2)       
replace URn = 5.5 if grad == ym(1996, 3)
replace URn = 5.6 if grad == ym(1996, 4)
replace URn = 5.6 if grad == ym(1996, 5)
replace URn = 5.3 if grad == ym(1996, 6)
replace URn = 5.5 if grad == ym(1996, 7)
replace URn = 5.1 if grad == ym(1996, 8)
replace URn = 5.2 if grad == ym(1996, 9)
replace URn = 5.2 if grad == ym(1996, 10)
replace URn = 5.4 if grad == ym(1996, 11)
replace URn = 5.4 if grad == ym(1996, 12)
replace URn = 5.6 if grad == ym(1996, 1)       
replace URn = 5.5 if grad == ym(1996, 2)       
replace URn = 5.5 if grad == ym(1996, 3)
replace URn = 5.6 if grad == ym(1996, 4)
replace URn = 5.6 if grad == ym(1996, 5)
replace URn = 5.3 if grad == ym(1996, 6)
replace URn = 5.5 if grad == ym(1996, 7)
replace URn = 5.1 if grad == ym(1996, 8)
replace URn = 5.2 if grad == ym(1996, 9)
replace URn = 5.2 if grad == ym(1996, 10)
replace URn = 5.4 if grad == ym(1996, 11)
replace URn = 5.4 if grad == ym(1996, 12)
replace URn = 4 if grad == ym(2000, 5)
replace URn = 4 if grad == ym(2001, 6)
replace URn = 5.8 if grad == ym(2002, 5)
replace URn = 6.1 if grad == ym(2003, 5)

********************************************************************************
** UR at graduation
*******************************************************************************

replace UR = 9.6 if region == 1 & grad == ym(1976, 1)       
replace UR = 6.8 if region == 2 & grad == ym(1976, 1) 
replace UR = 6.9 if region == 3 & grad == ym(1976, 1)
replace UR = 8.6 if region == 4 & grad == ym(1976, 1)
replace UR = 9.6 if region == 1 & grad == ym(1976, 2)
replace UR = 6.8 if region == 2 & grad == ym(1976, 2)
replace UR = 6.9 if region == 3 & grad == ym(1976, 2)
replace UR = 8.6 if region == 4 & grad == ym(1976, 2)
replace UR = 9.6 if region == 1 & grad == ym(1976, 3)
replace UR = 6.8 if region == 2 & grad == ym(1976, 3)
replace UR = 6.9 if region == 3 & grad == ym(1976, 3)
replace UR = 8.6 if region == 4 & grad == ym(1976, 3)
replace UR = 9.5 if region == 1 & grad == ym(1976, 4)
replace UR = 6.7 if region == 2 & grad == ym(1976, 4)
replace UR = 6.8 if region == 3 & grad == ym(1976, 4)
replace UR = 8.5 if region == 4 & grad == ym(1976, 4)
replace UR = 9.5 if region == 1 & grad == ym(1976, 5)
replace UR = 6.6 if region == 2 & grad == ym(1976, 5)
replace UR = 6.7 if region == 3 & grad == ym(1976, 5)
replace UR = 8.5 if region == 4 & grad == ym(1976, 5)
replace UR = 9.4 if region == 1 & grad == ym(1976, 6)
replace UR = 6.5 if region == 2 & grad == ym(1976, 6)
replace UR = 6.7 if region == 3 & grad == ym(1976, 6)
replace UR = 8.4 if region == 4 & grad == ym(1976, 6)
replace UR = 9.4 if region == 1 & grad == ym(1976, 7)
replace UR = 6.5 if region == 2 & grad == ym(1976, 7)
replace UR = 6.7 if region == 3 & grad == ym(1976, 7)
replace UR = 8.5 if region == 4 & grad == ym(1976, 7)
replace UR = 9.3 if region == 1 & grad == ym(1976, 8)
replace UR = 6.4 if region == 2 & grad == ym(1976, 8)
replace UR = 6.7 if region == 3 & grad == ym(1976, 8)
replace UR = 8.6 if region == 4 & grad == ym(1976, 8)
replace UR = 9.3 if region == 1 & grad == ym(1976, 9)
replace UR = 6.4 if region == 2 & grad == ym(1976, 9)
replace UR = 6.7 if region == 3 & grad == ym(1976, 9)
replace UR = 8.6 if region == 4 & grad == ym(1976, 9)
replace UR = 9.3 if region == 1 & grad == ym(1976, 10)
replace UR = 6.5 if region == 2 & grad == ym(1976, 10)
replace UR = 6.7 if region == 3 & grad == ym(1976, 10)
replace UR = 8.7 if region == 4 & grad == ym(1976, 10)
replace UR = 9.3 if region == 1 & grad == ym(1976, 11)
replace UR = 6.5 if region == 2 & grad == ym(1976, 11)
replace UR = 6.7 if region == 3 & grad == ym(1976, 11)
replace UR = 8.8 if region == 4 & grad == ym(1976, 11)
replace UR = 9.3 if region == 1 & grad == ym(1976, 12)
replace UR = 6.5 if region == 2 & grad == ym(1976, 12)
replace UR = 6.8 if region == 3 & grad == ym(1976, 12)
replace UR = 8.8 if region == 4 & grad == ym(1976, 12)
replace UR = 9.3 if region == 1 & grad == ym(1977, 1)       
replace UR = 6.4 if region == 2 & grad == ym(1977, 1)
replace UR = 6.8 if region == 3 & grad == ym(1977, 1)
replace UR = 8.7 if region == 4 & grad == ym(1977, 1)
replace UR = 9.2 if region == 1 & grad == ym(1977, 2)       
replace UR = 6.3 if region == 2 & grad == ym(1977, 2)
replace UR = 6.7 if region == 3 & grad == ym(1977, 2)
replace UR = 8.6 if region == 4 & grad == ym(1977, 2)
replace UR = 9   if region == 1 & grad == ym(1977, 3)
replace UR = 6.2 if region == 2 & grad == ym(1977, 3)
replace UR = 6.7 if region == 3 & grad == ym(1977, 3)
replace UR = 8.5 if region == 4 & grad == ym(1977, 3)
replace UR = 8.8 if region == 1 & grad == ym(1977, 4)
replace UR = 6.1 if region == 2 & grad == ym(1977, 4)
replace UR = 6.6 if region == 3 & grad == ym(1977, 4)
replace UR = 8.3 if region == 4 & grad == ym(1977, 4)
replace UR = 8.6 if region == 1 & grad == ym(1977, 5)
replace UR = 6.0 if region == 2 & grad == ym(1977, 5)
replace UR = 6.4 if region == 3 & grad == ym(1977, 5)
replace UR = 8.1 if region == 4 & grad == ym(1977, 5)
replace UR = 8.4 if region == 1 & grad == ym(1977, 6)
replace UR = 6   if region == 2 & grad == ym(1977, 6)
replace UR = 6.3 if region == 3 & grad == ym(1977, 6)
replace UR = 7.9 if region == 4 & grad == ym(1977, 6)
replace UR = 8.3 if region == 1 & grad == ym(1977, 7)
replace UR = 5.9 if region == 2 & grad == ym(1977, 7)
replace UR = 6.3 if region == 3 & grad == ym(1977, 7)
replace UR = 7.8 if region == 4 & grad == ym(1977, 7)
replace UR = 8.2 if region == 1 & grad == ym(1977, 8)
replace UR = 5.9 if region == 2 & grad == ym(1977, 8)
replace UR = 6.2 if region == 3 & grad == ym(1977, 8)
replace UR = 7.6 if region == 4 & grad == ym(1977, 8)
replace UR = 8   if region == 1 & grad == ym(1977, 9)
replace UR = 5.9 if region == 2 & grad == ym(1977, 9)
replace UR = 6.2 if region == 3 & grad == ym(1977, 9)
replace UR = 7.5 if region == 4 & grad == ym(1977, 9)
replace UR = 7.9 if region == 1 & grad == ym(1977, 10)
replace UR = 5.8 if region == 2 & grad == ym(1977, 10)
replace UR = 6.1 if region == 3 & grad == ym(1977, 10)
replace UR = 7.4 if region == 4 & grad == ym(1977, 10)
replace UR = 7.7 if region == 1 & grad == ym(1977, 11)
replace UR = 5.7 if region == 2 & grad == ym(1977, 11)
replace UR = 6   if region == 3 & grad == ym(1977, 11)
replace UR = 7.2 if region == 4 & grad == ym(1977, 11)
replace UR = 7.6 if region == 1 & grad == ym(1977, 12)
replace UR = 5.7 if region == 2 & grad == ym(1977, 12)
replace UR = 6   if region == 3 & grad == ym(1977, 12)
replace UR = 7.1 if region == 4 & grad == ym(1977, 12)
replace UR = 7.4 if region == 1 & grad == ym(1978, 1)       
replace UR = 5.6 if region == 2 & grad == ym(1978, 1)
replace UR = 5.9 if region == 3 & grad == ym(1978, 1)
replace UR = 7 if region == 4 & grad == ym(1978, 1)
replace UR = 7.3 if region == 1 & grad == ym(1978, 2)       
replace UR = 5.5 if region == 2 & grad == ym(1978, 2)
replace UR = 5.8 if region == 3 & grad == ym(1978, 2)
replace UR = 6.9 if region == 4 & grad == ym(1978, 2)
replace UR = 7.2 if region == 1 & grad == ym(1978, 3)       
replace UR = 5.5 if region == 2 & grad == ym(1978, 3)
replace UR = 5.7 if region == 3 & grad == ym(1978, 3)
replace UR = 6.8 if region == 4 & grad == ym(1978, 3)
replace UR = 7.1 if region == 1 & grad == ym(1978, 4)       
replace UR = 5.4 if region == 2 & grad == ym(1978, 4)
replace UR = 5.6 if region == 3 & grad == ym(1978, 4)
replace UR = 6.8 if region == 4 & grad == ym(1978, 4)
replace UR = 7   if region == 1 & grad == ym(1978, 5)
replace UR = 5.3 if region == 2 & grad == ym(1978, 5)
replace UR = 5.6 if region == 3 & grad == ym(1978, 5)
replace UR = 6.7 if region == 4 & grad == ym(1978, 5)
replace UR = 6.9 if region == 1 & grad == ym(1978, 6)
replace UR = 5.3 if region == 2 & grad == ym(1978, 6)
replace UR = 5.6 if region == 3 & grad == ym(1978, 6)
replace UR = 6.6 if region == 4 & grad == ym(1978, 6)
replace UR = 6.9 if region == 1 & grad == ym(1978, 7)
replace UR = 5.2 if region == 2 & grad == ym(1978, 7)
replace UR = 5.5 if region == 3 & grad == ym(1978, 7)
replace UR = 6.6 if region == 4 & grad == ym(1978, 7)
replace UR = 6.8 if region == 1 & grad == ym(1978, 8)
replace UR = 5.2 if region == 2 & grad == ym(1978, 8)
replace UR = 5.5 if region == 3 & grad == ym(1978, 8)
replace UR = 6.5 if region == 4 & grad == ym(1978, 8)
replace UR = 6.8 if region == 1 & grad == ym(1978, 9)
replace UR = 5.2 if region == 2 & grad == ym(1978, 9)
replace UR = 5.5 if region == 3 & grad == ym(1978, 9)
replace UR = 6.4 if region == 4 & grad == ym(1978, 9)
replace UR = 6.7 if region == 1 & grad == ym(1978, 10)
replace UR = 5.2 if region == 2 & grad == ym(1978, 10)
replace UR = 5.5 if region == 3 & grad == ym(1978, 10)
replace UR = 6.4 if region == 4 & grad == ym(1978, 10)
replace UR = 6.7 if region == 1 & grad == ym(1978, 11)
replace UR = 5.2 if region == 2 & grad == ym(1978, 11)
replace UR = 5.5 if region == 3 & grad == ym(1978, 11)
replace UR = 6.4 if region == 4 & grad == ym(1978, 11)
replace UR = 6.7 if region == 1 & grad == ym(1978, 12)
replace UR = 5.2 if region == 2 & grad == ym(1978, 12)
replace UR = 5.5 if region == 3 & grad == ym(1978, 12)
replace UR = 6.3 if region == 4 & grad == ym(1978, 12)
replace UR = 6.6 if region == 1 & grad == ym(1979, 1)          
replace UR = 5.3 if region == 2 & grad == ym(1979, 1)
replace UR = 5.4 if region == 3 & grad == ym(1979, 1)
replace UR = 6.3 if region == 4 & grad == ym(1979, 1)
replace UR = 6.6 if region == 1 & grad == ym(1979, 2)
replace UR = 5.3 if region == 2 & grad == ym(1979, 2)
replace UR = 5.4 if region == 3 & grad == ym(1979, 2)
replace UR = 6.2 if region == 4 & grad == ym(1979, 2)
replace UR = 6.6 if region == 1 & grad == ym(1979, 3)
replace UR = 5.3 if region == 2 & grad == ym(1979, 3)
replace UR = 5.4 if region == 3 & grad == ym(1979, 3)
replace UR = 6.1 if region == 4 & grad == ym(1979, 3)
replace UR = 6.5 if region == 1 & grad == ym(1979, 4)
replace UR = 5.2 if region == 2 & grad == ym(1979, 4)
replace UR = 5.3 if region == 3 & grad == ym(1979, 4)
replace UR = 6   if region == 4 & grad == ym(1979, 4)
replace UR = 6.5 if region == 1 & grad == ym(1979, 5)
replace UR = 5.3 if region == 2 & grad == ym(1979, 5)
replace UR = 5.3 if region == 3 & grad == ym(1979, 5)
replace UR = 5.9 if region == 4 & grad == ym(1979, 5)
replace UR = 6.5 if region == 1 & grad == ym(1979, 6)
replace UR = 5.3 if region == 2 & grad == ym(1979, 6)
replace UR = 5.3 if region == 3 & grad == ym(1979, 6)
replace UR = 5.9 if region == 4 & grad == ym(1979, 6)
replace UR = 6.5 if region == 1 & grad == ym(1979, 7)
replace UR = 5.4 if region == 2 & grad == ym(1979, 7)
replace UR = 5.3 if region == 3 & grad == ym(1979, 7)
replace UR = 5.9 if region == 4 & grad == ym(1979, 7)
replace UR = 6.6 if region == 1 & grad == ym(1979, 8)
replace UR = 5.5 if region == 2 & grad == ym(1979, 8)
replace UR = 5.4 if region == 3 & grad == ym(1979, 8)
replace UR = 5.9 if region == 4 & grad == ym(1979, 8)
replace UR = 6.6 if region == 1 & grad == ym(1979, 9)
replace UR = 5.7 if region == 2 & grad == ym(1979, 9)
replace UR = 5.4 if region == 3 & grad == ym(1979, 9)
replace UR = 6   if region == 4 & grad == ym(1979, 9)
replace UR = 6.6 if region == 1 & grad == ym(1979, 10)
replace UR = 5.9 if region == 2 & grad == ym(1979, 10)
replace UR = 5.4 if region == 3 & grad == ym(1979, 10)
replace UR = 6   if region == 4 & grad == ym(1979, 10)
replace UR = 6.6 if region == 1 & grad == ym(1979, 11)
replace UR = 6   if region == 2 & grad == ym(1979, 11)
replace UR = 5.4 if region == 3 & grad == ym(1979, 11)
replace UR = 5.9 if region == 4 & grad == ym(1979, 11)
replace UR = 6.6 if region == 1 & grad == ym(1979, 12)
replace UR = 6.2 if region == 2 & grad == ym(1979, 12)
replace UR = 5.4 if region == 3 & grad == ym(1979, 12)
replace UR = 5.9 if region == 4 & grad == ym(1979, 12)
replace UR = 6.6 if region == 1 & grad == ym(1980, 1)          
replace UR = 6.4 if region == 2 & grad == ym(1980, 1)
replace UR = 5.5 if region == 3 & grad == ym(1980, 1)
replace UR = 6   if region == 4 & grad == ym(1980, 1)
replace UR = 6.6 if region == 1 & grad == ym(1980, 2)
replace UR = 6.8 if region == 2 & grad == ym(1980, 2)
replace UR = 5.7 if region == 3 & grad == ym(1980, 2)
replace UR = 6.2 if region == 4 & grad == ym(1980, 2)
replace UR = 6.8 if region == 1 & grad == ym(1980, 3)
replace UR = 7.3 if region == 2 & grad == ym(1980, 3)
replace UR = 5.9 if region == 3 & grad == ym(1980, 3)
replace UR = 6.4 if region == 4 & grad == ym(1980, 3)
replace UR = 7   if region == 1 & grad == ym(1980, 4)
replace UR = 7.8 if region == 2 & grad == ym(1980, 4)
replace UR = 6.2 if region == 3 & grad == ym(1980, 4)
replace UR = 6.7 if region == 4 & grad == ym(1980, 4)
replace UR = 7.2 if region == 1 & grad == ym(1980, 5)
replace UR = 8.3 if region == 2  & grad == ym(1980, 5)
replace UR = 6.4 if region == 3 & grad == ym(1980, 5)
replace UR = 7   if region == 4 & grad == ym(1980, 5)
replace UR = 7.4 if region == 1 & grad == ym(1980, 6)
replace UR = 8.7 if region == 2 & grad == ym(1980, 6)
replace UR = 6.6 if region == 3 & grad == ym(1980, 6)
replace UR = 7.2 if region == 4 & grad == ym(1980, 6)
replace UR = 7.5 if region == 1 & grad == ym(1980, 7)
replace UR = 8.9 if region == 2 & grad == ym(1980, 7)
replace UR = 6.8 if region == 3 & grad == ym(1980, 7)
replace UR = 7.4 if region == 4 & grad == ym(1980, 7)
replace UR = 7.5 if region == 1 & grad == ym(1980, 8)
replace UR = 9   if region == 2 & grad == ym(1980, 8)
replace UR = 6.8 if region == 3 & grad == ym(1980, 8)
replace UR = 7.4 if region == 4 & grad == ym(1980, 8)
replace UR = 7.4 if region == 1 & grad == ym(1980, 9)
replace UR = 8.9 if region == 2 & grad == ym(1980, 9)
replace UR = 6.8 if region == 3 & grad == ym(1980, 9)
replace UR = 7.4 if region == 4 & grad == ym(1980, 9)
replace UR = 7.3 if region == 1 & grad == ym(1980, 10)
replace UR = 8.8 if region == 2 & grad == ym(1980, 10)
replace UR = 6.7 if region == 3 & grad == ym(1980, 10)
replace UR = 7.3 if region == 4 & grad == ym(1980, 10)
replace UR = 7.3 if region == 1 & grad == ym(1980, 11)
replace UR = 8.7 if region == 2 & grad == ym(1980, 11)
replace UR = 6.7 if region == 3 & grad == ym(1980, 11)
replace UR = 7.2 if region == 4 & grad == ym(1980, 11)
replace UR = 7.2 if region == 1 & grad == ym(1980, 12)
replace UR = 8.6 if region == 2 & grad == ym(1980, 12)
replace UR = 6.7 if region == 3 & grad == ym(1980, 12)
replace UR = 7.2 if region == 4 & grad == ym(1980, 12)
replace UR = 7.3 if region == 1 & grad == ym(1981, 1)           
replace UR = 8.5 if region == 2 & grad == ym(1981, 1)
replace UR = 6.7 if region == 3 & grad == ym(1981, 1)
replace UR = 7.2 if region == 4 & grad == ym(1981, 1)
replace UR = 7.3 if region == 1 & grad == ym(1981, 2)
replace UR = 8.5 if region == 2 & grad == ym(1981, 2)
replace UR = 6.7 if region == 3 & grad == ym(1981, 2)
replace UR = 7.2 if region == 4 & grad == ym(1981, 2)
replace UR = 7.3 if region == 1 & grad == ym(1981, 3)
replace UR = 8.4 if region == 2 & grad == ym(1981, 3)
replace UR = 6.7 if region == 3 & grad == ym(1981, 3)
replace UR = 7.1 if region == 4 & grad == ym(1981, 3)
replace UR = 7.3 if region == 1 & grad == ym(1981, 4)
replace UR = 8.3 if region == 2 & grad == ym(1981, 4)
replace UR = 6.8 if region == 3 & grad == ym(1981, 4)
replace UR = 7.1 if region == 4 & grad == ym(1981, 4)
replace UR = 7.3 if region == 1 & grad == ym(1981, 5)
replace UR = 8.2 if region == 2 & grad == ym(1981, 5)
replace UR = 6.8 if region == 3 & grad == ym(1981, 5)
replace UR = 7.1 if region == 4 & grad == ym(1981, 5)
replace UR = 7.2 if region == 1 & grad == ym(1981, 6)
replace UR = 8.2 if region == 2 & grad == ym(1981, 6)
replace UR = 6.8 if region == 3 & grad == ym(1981, 6)
replace UR = 7.1 if region == 4 & grad == ym(1981, 6)
replace UR = 7.2 if region == 1 & grad == ym(1981, 7)
replace UR = 8.2 if region == 2 & grad == ym(1981, 7)
replace UR = 6.8 if region == 3 & grad == ym(1981, 7)
replace UR = 7.2 if region == 4 & grad == ym(1981, 7)
replace UR = 7.3 if region == 1 & grad == ym(1981, 8)
replace UR = 8.4 if region == 2 & grad == ym(1981, 8)
replace UR = 6.9 if region == 3 & grad == ym(1981, 8)
replace UR = 7.3 if region == 4 & grad == ym(1981, 8)
replace UR = 7.4 if region == 1 & grad == ym(1981, 9)
replace UR = 8.7 if region == 2 & grad == ym(1981, 9)
replace UR = 7.1 if region == 3 & grad == ym(1981, 9)
replace UR = 7.5 if region == 4 & grad == ym(1981, 9)
replace UR = 7.6 if region == 1 & grad == ym(1981, 10)
replace UR = 9   if region == 2 & grad == ym(1981, 10)
replace UR = 7.4 if region == 3 & grad == ym(1981, 10)
replace UR = 7.8 if region == 4 & grad == ym(1981, 10)
replace UR = 7.8 if region == 1 & grad == ym(1981, 11)
replace UR = 9.3 if region == 2 & grad == ym(1981, 11)
replace UR = 7.7 if region == 3 & grad == ym(1981, 11)
replace UR = 8.1 if region == 4 & grad == ym(1981, 11)
replace UR = 8.1 if region == 1 & grad == ym(1981, 12)
replace UR = 9.6 if region == 2 & grad == ym(1981, 12)
replace UR = 7.9 if region == 3 & grad == ym(1981, 12)
replace UR = 8.4 if region == 4 & grad == ym(1981, 12)
replace UR = 8.3 if region == 1 & grad == ym(1982, 1)        
replace UR = 9.9 if region == 2 & grad == ym(1982, 1)
replace UR = 8.1 if region == 3 & grad == ym(1982, 1)
replace UR = 8.7 if region == 4 & grad == ym(1982, 1)
replace UR = 8.4 if region == 1 & grad == ym(1982, 2)        
replace UR = 10.2 if region == 2 & grad == ym(1982, 2)
replace UR = 8.3 if region == 3 & grad == ym(1982, 2)
replace UR = 9 if region == 4 & grad == ym(1982, 2)
replace UR = 8.5 if region == 1 & grad == ym(1982, 3)
replace UR = 10.4 if region == 2 & grad == ym(1982, 3)
replace UR = 8.4 if region == 3 & grad == ym(1982, 3)
replace UR = 9.2 if region == 4 & grad == ym(1982, 3)
replace UR = 8.6 if region == 1 & grad == ym(1982, 4)
replace UR = 10.6 if region == 2 & grad == ym(1982, 4)
replace UR = 8.5 if region == 3 & grad == ym(1982, 4)
replace UR = 9.4 if region == 4 & grad == ym(1982, 4)
replace UR = 8.7 if region == 1 & grad == ym(1982, 5)
replace UR = 10.8 if region == 2 & grad == ym(1982, 5)
replace UR = 8.7 if region == 3 & grad == ym(1982, 5)
replace UR = 9.6 if region == 4 & grad == ym(1982, 5)
replace UR = 8.8 if region == 1 & grad == ym(1982, 6)
replace UR = 10.9 if region == 2 & grad == ym(1982, 6)
replace UR = 8.8 if region == 3 & grad == ym(1982, 6)
replace UR = 9.8 if region == 4 & grad == ym(1982, 6)
replace UR = 8.9 if region == 1 & grad == ym(1982, 7)
replace UR = 11.1 if region == 2 & grad == ym(1982, 7)
replace UR = 8.9 if region == 3 & grad == ym(1982, 7)
replace UR = 9.9 if region == 4 & grad == ym(1982, 7)
replace UR = 9   if region == 1 & grad == ym(1982, 8)
replace UR = 11.4 if region == 2 & grad == ym(1982, 8)
replace UR = 9.1 if region == 3 & grad == ym(1982, 8)
replace UR = 10.2 if region == 4 & grad == ym(1982, 8)
replace UR = 9.2 if region == 1 & grad == ym(1982, 9)
replace UR = 11.6 if region == 2 & grad == ym(1982, 9)
replace UR = 9.3 if region == 3 & grad == ym(1982, 9)
replace UR = 10.4 if region == 4 & grad == ym(1982, 9)
replace UR = 9.6 if region == 1 & grad == ym(1982, 11)
replace UR = 12.1 if region == 2 & grad == ym(1982, 11)
replace UR = 9.8 if region == 3 & grad == ym(1982, 11)
replace UR = 10.8 if region == 4 & grad == ym(1982, 11)
replace UR = 9.7 if region == 1 & grad == ym(1982, 12)
replace UR = 12.2 if region == 2 & grad == ym(1982, 12)
replace UR = 9.9 if region == 3 & grad == ym(1982, 12)
replace UR = 10.8 if region == 4 & grad == ym(1982, 12)
replace UR = 9.7 if region == 1 & grad == ym(1983, 1)        
replace UR = 12.2 if region == 2 & grad == ym(1983, 1)
replace UR = 10 if region == 3 & grad == ym(1983, 1)
replace UR = 10.8 if region == 4 & grad == ym(1983, 1)
replace UR = 9.6 if region == 1 & grad == ym(1983, 2)        
replace UR = 12.1 if region == 2 & grad == ym(1983, 2)
replace UR = 10 if region == 3 & grad == ym(1983, 2)
replace UR = 10.7 if region == 4 & grad == ym(1983, 2)
replace UR = 9.5 if region == 1 & grad == ym(1983, 3)
replace UR = 11.9 if region == 2 & grad == ym(1983, 3)
replace UR = 9.9 if region == 3 & grad == ym(1983, 3)
replace UR = 10.5 if region == 4 & grad == ym(1983, 3)
replace UR = 9.3 if region == 1 & grad == ym(1983, 4)
replace UR = 11.6 if region == 2 & grad == ym(1983, 4)
replace UR = 9.8 if region == 3 & grad == ym(1983, 4)
replace UR = 10.3 if region == 4 & grad == ym(1983, 4)
replace UR = 9.1 if region == 1 & grad == ym(1983, 5)
replace UR = 11.4 if region == 2 & grad == ym(1983, 5)
replace UR = 9.6 if region == 3 & grad == ym(1983, 5)
replace UR = 10.1 if region == 4 & grad == ym(1983, 5)
replace UR = 8.9 if region == 1 & grad == ym(1983, 6)
replace UR = 11.1 if region == 2 & grad == ym(1983, 6)
replace UR = 9.5 if region == 3 & grad == ym(1983, 6)
replace UR = 9.8 if region == 4 & grad == ym(1983, 6)
replace UR = 8.7 if region == 1 & grad == ym(1983, 7)
replace UR = 10.8 if region == 2 & grad == ym(1983, 7)
replace UR = 9.3 if region == 3 & grad == ym(1983, 7)
replace UR = 9.5 if region == 4 & grad == ym(1983, 7)
replace UR = 8.5 if region == 1 & grad == ym(1983, 8)
replace UR = 10.5 if region == 2 & grad == ym(1983, 8)
replace UR = 9 if region == 3 & grad == ym(1983, 8)
replace UR = 9.2  if region == 4 & grad == ym(1983, 8)
replace UR = 8.2 if region == 1 & grad == ym(1983, 9)
replace UR = 10.2 if region == 2 & grad == ym(1983, 9)
replace UR = 8.8 if region == 3 & grad == ym(1983, 9)
replace UR = 8.9 if region == 4 & grad == ym(1983, 9)
replace UR = 8 if region == 1 & grad == ym(1983, 10)
replace UR = 9.8 if region == 2 & grad == ym(1983, 10)
replace UR = 8.5 if region == 3 & grad == ym(1983, 10)
replace UR = 8.7 if region == 4 & grad == ym(1983, 10)
replace UR = 7.7 if region == 1 & grad == ym(1983, 11)
replace UR = 9.5 if region == 2 & grad == ym(1983, 11)
replace UR = 8.3 if region == 3 & grad == ym(1983, 11)
replace UR = 8.4 if region == 4 & grad == ym(1983, 11)
replace UR = 7.5 if region == 1 & grad == ym(1983, 12)
replace UR = 9.3 if region == 2 & grad == ym(1983, 12)
replace UR = 8 if region == 3 & grad == ym(1983, 12)
replace UR = 8.2 if region == 4 & grad == ym(1983, 12)
replace UR = 7.3 if region == 1 & grad == ym(1984, 1)          
replace UR = 9.1 if region == 2 & grad == ym(1984, 1)
replace UR = 7.8 if region == 3 & grad == ym(1984, 1)
replace UR = 8  if region == 4 & grad == ym(1984, 1)
replace UR = 7.2 if region == 1 & grad == ym(1984, 2)
replace UR = 8.9 if region == 2 & grad == ym(1984, 2)
replace UR = 7.6 if region == 3 & grad == ym(1984, 2)
replace UR = 7.8 if region == 4 & grad == ym(1984, 2)
replace UR = 7 if region == 1 & grad == ym(1984, 3)
replace UR = 8.7 if region == 2 & grad == ym(1984, 3)
replace UR = 7.4 if region == 3 & grad == ym(1984, 3)
replace UR = 7.7 if region == 4 & grad == ym(1984, 3)
replace UR = 6.9 if region == 1 & grad == ym(1984, 4)
replace UR = 8.6 if region == 2 & grad == ym(1984, 4)
replace UR = 7.3 if region == 3 & grad == ym(1984, 4)
replace UR = 7.6  if region == 4 & grad == ym(1984, 4)
replace UR = 6.9 if region == 1 & grad == ym(1984, 5)
replace UR = 8.4 if region == 2 & grad == ym(1984, 5)
replace UR = 7.2 if region == 3 & grad == ym(1984, 5)
replace UR = 7.5 if region == 4 & grad == ym(1984, 5)
replace UR = 6.8 if region == 1 & grad == ym(1984, 6)
replace UR = 8.3 if region == 2 & grad == ym(1984, 6)
replace UR = 7.2 if region == 3 & grad == ym(1984, 6)
replace UR = 7.5 if region == 4 & grad == ym(1984, 6)
replace UR = 6.8 if region == 1 & grad == ym(1984, 7)
replace UR = 8.2 if region == 2 & grad == ym(1984, 7)
replace UR = 7.1 if region == 3 & grad == ym(1984, 7)
replace UR = 7.4 if region == 4 & grad == ym(1984, 7)
replace UR = 6.7 if region == 1 & grad == ym(1984, 8)
replace UR = 8.2 if region == 2 & grad == ym(1984, 8)
replace UR = 7.1 if region == 3 & grad == ym(1984, 8)
replace UR = 7.4 if region == 4 & grad == ym(1984, 8)
replace UR = 6.7 if region == 1 & grad == ym(1984, 9)
replace UR = 8.2 if region == 2 & grad == ym(1984, 9)
replace UR = 7.1 if region == 3 & grad == ym(1984, 9)
replace UR = 7.4 if region == 4 & grad == ym(1984, 9)
replace UR = 6.6 if region == 1 & grad == ym(1984, 10)
replace UR = 8.2 if region == 2 & grad == ym(1984, 10)
replace UR = 7.2 if region == 3 & grad == ym(1984, 10)
replace UR = 7.4 if region == 4 & grad == ym(1984, 10)
replace UR = 6.5 if region == 1 & grad == ym(1984, 11)
replace UR = 8.1 if region == 2 & grad == ym(1984, 11)
replace UR = 7.2 if region == 3 & grad == ym(1984, 11)
replace UR = 7.4 if region == 4 & grad == ym(1984, 11)
replace UR = 6.4 if region == 1 & grad == ym(1984, 12)
replace UR = 8.1 if region == 2 & grad == ym(1984, 12)
replace UR = 7.2 if region == 3 & grad == ym(1984, 12)
replace UR = 7.3 if region == 4 & grad == ym(1984, 12)
replace UR = 6.4 if region == 1 & grad == ym(1985, 1)         
replace UR = 8.1 if region == 2 & grad == ym(1985, 1)
replace UR = 7.2 if region == 3 & grad == ym(1985, 1)
replace UR = 7.3 if region == 4 & grad == ym(1985, 1)
replace UR = 6.3 if region == 1 & grad == ym(1985, 2)         
replace UR = 8.1 if region == 2 & grad == ym(1985, 2)
replace UR = 7.2 if region == 3 & grad == ym(1985, 2)
replace UR = 7.3 if region == 4 & grad == ym(1985, 2)
replace UR = 6.3 if region == 1 & grad == ym(1985, 3)
replace UR = 8.1 if region == 2 & grad == ym(1985, 3)
replace UR = 7.2 if region == 3 & grad == ym(1985, 3)
replace UR = 7.3 if region == 4 & grad == ym(1985, 3)
replace UR = 6.3 if region == 1 & grad == ym(1985, 4)
replace UR = 8.1 if region == 2 & grad == ym(1985, 4)
replace UR = 7.2 if region == 3 & grad == ym(1985, 4)
replace UR = 7.3 if region == 4 & grad == ym(1985, 4)
replace UR = 6.3 if region == 1 & grad == ym(1985, 5)
replace UR = 8.1 if region == 2 & grad == ym(1985, 5)
replace UR = 7.3 if region == 3 & grad == ym(1985, 5)
replace UR = 7.3 if region == 4 & grad == ym(1985, 5)
replace UR = 6.2 if region == 1 & grad == ym(1985, 6)
replace UR = 8.1 if region == 2 & grad == ym(1985, 6)
replace UR = 7.3 if region == 3 & grad == ym(1985, 6)
replace UR = 7.3 if region == 4 & grad == ym(1985, 6)
replace UR = 6.2 if region == 1 & grad == ym(1985, 7)
replace UR = 8.1 if region == 2 & grad == ym(1985, 7)
replace UR = 7.3 if region == 3 & grad == ym(1985, 7)
replace UR = 7.3 if region == 4 & grad == ym(1985, 7)
replace UR = 6.1 if region == 1 & grad == ym(1985, 8)
replace UR = 8.1 if region == 2 & grad == ym(1985, 8)
replace UR = 7.2 if region == 3 & grad == ym(1985, 8)
replace UR = 7.3 if region == 4 & grad == ym(1985, 8)
replace UR = 6 if region == 1 & grad == ym(1985, 9)
replace UR = 8 if region == 2 & grad == ym(1985, 9)
replace UR = 7.2 if region == 3 & grad == ym(1985, 9)
replace UR = 7.2 if region == 4 & grad == ym(1985, 9)
replace UR = 6 if region == 1 & grad == ym(1985, 10)
replace UR = 7.9 if region == 2 & grad == ym(1985, 10)
replace UR = 7.1 if region == 3 & grad == ym(1985, 10)
replace UR = 7.1 if region == 4 & grad == ym(1985, 10)
replace UR = 5.9 if region == 1 & grad == ym(1985, 11)
replace UR = 7.8 if region == 2 & grad == ym(1985, 11)
replace UR = 7.1 if region == 3 & grad == ym(1985, 11)
replace UR = 7 if region == 4 & grad == ym(1985, 11)
replace UR = 5.9 if region == 1 & grad == ym(1985, 12)
replace UR = 7.7 if region == 2 & grad == ym(1985, 12)
replace UR = 7.1 if region == 3 & grad == ym(1985, 12)
replace UR = 7 if region == 4 & grad == ym(1985, 12)
replace UR = 5.9 if region == 1 & grad == ym(1986, 1)             
replace UR = 7.6 if region == 2 & grad == ym(1986, 1)
replace UR = 7.2 if region == 3 & grad == ym(1986, 1)
replace UR = 7 if region == 4 & grad == ym(1986, 1)
replace UR = 5.9 if region == 1 & grad == ym(1986, 2)
replace UR = 7.6 if region == 2 & grad == ym(1986, 2)
replace UR = 7.3 if region == 3 & grad == ym(1986, 2)
replace UR = 7.1 if region == 4 & grad == ym(1986, 2)
replace UR = 5.9 if region == 1 & grad == ym(1986, 3)
replace UR = 7.6 if region == 2 & grad == ym(1986, 3)
replace UR = 7.4 if region == 3 & grad == ym(1986, 3)
replace UR = 7.2 if region == 4 & grad == ym(1986, 3)
replace UR = 5.9 if region == 1 & grad == ym(1986, 4)
replace UR = 7.6 if region == 2 & grad == ym(1986, 4)
replace UR = 7.5 if region == 3 & grad == ym(1986, 4)
replace UR = 7.2 if region == 4 & grad == ym(1986, 4)
replace UR = 5.8 if region == 1 & grad == ym(1986, 5)
replace UR = 7.6 if region == 2 & grad == ym(1986, 5)
replace UR = 7.6 if region == 3 & grad == ym(1986, 5)
replace UR = 7.2 if region == 4 & grad == ym(1986, 5)
replace UR = 5.7 if region == 1 & grad == ym(1986, 6)
replace UR = 7.5 if region == 2 & grad == ym(1986, 6)
replace UR = 7.6 if region == 3 & grad == ym(1986, 6)
replace UR = 7.2 if region == 4 & grad == ym(1986, 6)
replace UR = 5.6 if region == 1 & grad == ym(1986, 7)
replace UR = 7.4 if region == 2 & grad == ym(1986, 7)
replace UR = 7.6 if region == 3 & grad == ym(1986, 7)
replace UR = 7.2 if region == 4 & grad == ym(1986, 7)
replace UR = 5.5 if region == 1 & grad == ym(1986, 8)
replace UR = 7.3 if region == 2 & grad == ym(1986, 8)
replace UR = 7.6 if region == 3 & grad == ym(1986, 8)
replace UR = 7.2 if region == 4 & grad == ym(1986, 8)
replace UR = 5.4 if region == 1 & grad == ym(1986, 9)
replace UR = 7.2 if region == 2 & grad == ym(1986, 9)
replace UR = 7.6 if region == 3 & grad == ym(1986, 9)
replace UR = 7.1 if region == 4 & grad == ym(1986, 9)
replace UR = 5.2 if region == 1 & grad == ym(1986, 10)
replace UR = 7.1 if region == 2 & grad == ym(1986, 10)
replace UR = 7.6 if region == 3 & grad == ym(1986, 10)
replace UR = 7.1 if region == 4 & grad == ym(1986, 10)
replace UR = 5.1 if region == 1 & grad == ym(1986, 11)
replace UR = 7.1 if region == 2 & grad == ym(1986, 11)
replace UR = 7.5 if region == 3 & grad == ym(1986, 11)
replace UR = 7.1 if region == 4 & grad == ym(1986, 11)
replace UR = 5 if region == 1 & grad == ym(1986, 12)
replace UR = 7.1 if region == 2 & grad == ym(1986, 12)
replace UR = 7.5 if region == 3 & grad == ym(1986, 12)
replace UR = 7 if region == 4 & grad == ym(1986, 12)
replace UR = 4.9 if region == 1 & grad == ym(1987, 1)        
replace UR = 7 if region == 2 & grad == ym(1987, 1)
replace UR = 7.4 if region == 3 & grad == ym(1987, 1)
replace UR = 6.9 if region == 4 & grad == ym(1987, 1)
replace UR = 4.8 if region == 1 & grad == ym(1987, 2)
replace UR = 7 if region == 2 & grad == ym(1987, 2)
replace UR = 7.3 if region == 3 & grad == ym(1987, 2)
replace UR = 6.8 if region == 4 & grad == ym(1987, 2)
replace UR = 4.7 if region == 1 & grad == ym(1987, 3)
replace UR = 6.9 if region == 2 & grad == ym(1987, 3)
replace UR = 7.2 if region == 3 & grad == ym(1987, 3)
replace UR = 6.7 if region == 4 & grad == ym(1987, 3)
replace UR = 4.6 if region == 1 & grad == ym(1987, 4)
replace UR = 6.9 if region == 2 & grad == ym(1987, 4)
replace UR = 7 if region == 3 & grad == ym(1987, 4)
replace UR = 6.6 if region == 4 & grad == ym(1987, 4)
replace UR = 4.5 if region == 1 & grad == ym(1987, 5)
replace UR = 6.8 if region == 2 & grad == ym(1987, 5)
replace UR = 6.9 if region == 3 & grad == ym(1987, 5)
replace UR = 6.4 if region == 4 & grad == ym(1987, 5)
replace UR = 4.5 if region == 1 & grad == ym(1987, 6)
replace UR = 6.7 if region == 2 & grad == ym(1987, 6)
replace UR = 6.8 if region == 3 & grad == ym(1987, 6)
replace UR = 6.3 if region == 4 & grad == ym(1987, 6)
replace UR = 4.4 if region == 1 & grad == ym(1987, 7)
replace UR = 6.6 if region == 2 & grad == ym(1987, 7)
replace UR = 6.7 if region == 3 & grad == ym(1987, 7)
replace UR = 6.2 if region == 4 & grad == ym(1987, 7)
replace UR = 4.4 if region == 1 & grad == ym(1987, 8)
replace UR = 6.5 if region == 2 & grad == ym(1987, 8)
replace UR = 6.6 if region == 3 & grad == ym(1987, 8)
replace UR = 6.1 if region == 4 & grad == ym(1987, 8)
replace UR = 4.4 if region == 1 & grad == ym(1987, 9)
replace UR = 6.4 if region == 2 & grad == ym(1987, 9)
replace UR = 6.6 if region == 3 & grad == ym(1987, 9)
replace UR = 6.1 if region == 4 & grad == ym(1987, 9)
replace UR = 4.3 if region == 1 & grad == ym(1987, 10)
replace UR = 6.3 if region == 2 & grad == ym(1987, 10)
replace UR = 6.5 if region == 3 & grad == ym(1987, 10)
replace UR = 6 if region == 4 & grad == ym(1987, 10)
replace UR = 4.3 if region == 1 & grad == ym(1987, 11)
replace UR = 6.2 if region == 2 & grad == ym(1987, 11)
replace UR = 6.5 if region == 3 & grad == ym(1987, 11)
replace UR = 6 if region == 4 & grad == ym(1987, 11)
replace UR = 4.2 if region == 1 & grad == ym(1987, 12)
replace UR = 6.2 if region == 2 & grad == ym(1987, 12)
replace UR = 6.4 if region == 3 & grad == ym(1987, 12)
replace UR = 5.9 if region == 4 & grad == ym(1987, 12)
replace UR = 4.1 if region == 1 & grad == ym(1988, 1)      
replace UR = 6.1 if region == 2 & grad == ym(1988, 1)
replace UR = 6.4 if region == 3 & grad == ym(1988, 1)
replace UR = 5.9 if region == 4 & grad == ym(1988, 1)
replace UR = 4 if region == 1 & grad == ym(1988, 2)      
replace UR = 6 if region == 2 & grad == ym(1988, 2)
replace UR = 6.3 if region == 3 & grad == ym(1988, 2)
replace UR = 5.8 if region == 4 & grad == ym(1988, 2)
replace UR = 4 if region == 1 & grad == ym(1988, 3)
replace UR = 6 if region == 2 & grad == ym(1988, 3)
replace UR = 6.2 if region == 3 & grad == ym(1988, 3)
replace UR = 5.7 if region == 4 & grad == ym(1988, 3)
replace UR = 4 if region == 1 & grad == ym(1988, 4)
replace UR = 5.9 if region == 2 & grad == ym(1988, 4)
replace UR = 6.2 if region == 3 & grad == ym(1988, 4)
replace UR = 5.7 if region == 4 & grad == ym(1988, 4)
replace UR = 4 if region == 1 & grad == ym(1988, 5)
replace UR = 5.8 if region == 2 & grad == ym(1988, 5)
replace UR = 6.1 if region == 3 & grad == ym(1988, 5)
replace UR = 5.7 if region == 4 & grad == ym(1988, 5)
replace UR = 4 if region == 1 & grad == ym(1988, 6)
replace UR = 5.8 if region == 2 & grad == ym(1988, 6)
replace UR = 6.1 if region == 3 & grad == ym(1988, 6)
replace UR = 5.7 if region == 4 & grad == ym(1988, 6)
replace UR = 4 if region == 1 & grad == ym(1988, 7)
replace UR = 5.7 if region == 2 & grad == ym(1988, 7)
replace UR = 6.1 if region == 3 & grad == ym(1988, 7)
replace UR = 5.7 if region == 4 & grad == ym(1988, 7)
replace UR = 4.1 if region == 1 & grad == ym(1988, 8)
replace UR = 5.7 if region == 2 & grad == ym(1988, 8)
replace UR = 6.1 if region == 3 & grad == ym(1988, 8)
replace UR = 5.6 if region == 4 & grad == ym(1988, 8)
replace UR = 4.1 if region == 1 & grad == ym(1988, 9)
replace UR = 5.7 if region == 2 & grad == ym(1988, 9)
replace UR = 6.1 if region == 3 & grad == ym(1988, 9)
replace UR = 5.6 if region == 4 & grad == ym(1988, 9)
replace UR = 4.1 if region == 1 & grad == ym(1988, 10)
replace UR = 5.6 if region == 2 & grad == ym(1988, 10)
replace UR = 6 if region == 3 & grad == ym(1988, 10)
replace UR = 5.5 if region == 4 & grad == ym(1988, 10)
replace UR = 4.1 if region == 1 & grad == ym(1988, 11)
replace UR = 5.5 if region == 2 & grad == ym(1988, 11)
replace UR = 6 if region == 3 & grad == ym(1988, 11)
replace UR = 5.4 if region == 4 & grad == ym(1988, 11)
replace UR = 4.1 if region == 1 & grad == ym(1988, 12)
replace UR = 5.4 if region == 2 & grad == ym(1988, 12)
replace UR = 5.9 if region == 3 & grad == ym(1988, 12)
replace UR = 5.4 if region == 4 & grad == ym(1988, 12)
replace UR = 4.1 if region == 1 & grad == ym(1989, 1)     
replace UR = 5.3 if region == 2 & grad == ym(1989, 1)
replace UR = 5.8 if region == 3 & grad == ym(1989, 1)
replace UR = 5.3 if region == 4 & grad == ym(1989, 1)
replace UR = 4.1 if region == 1 & grad == ym(1989, 2)     
replace UR = 5.2 if region == 2 & grad == ym(1989, 2)
replace UR = 5.8 if region == 3 & grad == ym(1989, 2)
replace UR = 5.2 if region == 4 & grad == ym(1989, 2)
replace UR = 4.2 if region == 1 & grad == ym(1989, 3)     
replace UR = 5.2 if region == 2 & grad == ym(1989, 3)
replace UR = 5.7 if region == 3 & grad == ym(1989, 3)
replace UR = 5.2 if region == 4 & grad == ym(1989, 3)
replace UR = 4.2 if region == 1 & grad == ym(1989, 4)     
replace UR = 5.2 if region == 2 & grad == ym(1989, 4)
replace UR = 5.7 if region == 3 & grad == ym(1989, 4)
replace UR = 5.2 if region == 4 & grad == ym(1989, 4)
replace UR = 4.3 if region == 1 & grad == ym(1989, 5)
replace UR = 5.2 if region == 2 & grad == ym(1989, 5)
replace UR = 5.7 if region == 3 & grad == ym(1989, 5)
replace UR = 5.2 if region == 4 & grad == ym(1989, 5)
replace UR = 4.4 if region == 1 & grad == ym(1989, 6)
replace UR = 5.3 if region == 2 & grad == ym(1989, 6)
replace UR = 5.7 if region == 3 & grad == ym(1989, 6)
replace UR = 5.2 if region == 4 & grad == ym(1989, 6)
replace UR = 4.5 if region == 1 & grad == ym(1989, 7)
replace UR = 5.4 if region == 2 & grad == ym(1989, 7)
replace UR = 5.7 if region == 3 & grad == ym(1989, 7)
replace UR = 5.3 if region == 4 & grad == ym(1989, 7)
replace UR = 4.6 if region == 1 & grad == ym(1989, 8)
replace UR = 5.5 if region == 2 & grad == ym(1989, 8)
replace UR = 5.7 if region == 3 & grad == ym(1989, 8)
replace UR = 5.3 if region == 4 & grad == ym(1989, 8)
replace UR = 4.7 if region == 1 & grad == ym(1989, 9)
replace UR = 5.6 if region == 2 & grad == ym(1989, 9)
replace UR = 5.6 if region == 3 & grad == ym(1989, 9)
replace UR = 5.3 if region == 4 & grad == ym(1989, 9)
replace UR = 4.8 if region == 1 & grad == ym(1989, 10)
replace UR = 5.6 if region == 2 & grad == ym(1989, 10)
replace UR = 5.6 if region == 3 & grad == ym(1989, 10)
replace UR = 5.3 if region == 4 & grad == ym(1989, 10)
replace UR = 4.9 if region == 1 & grad == ym(1989, 11)
replace UR = 5.7 if region == 2 & grad == ym(1989, 11)
replace UR = 5.5 if region == 3 & grad == ym(1989, 11)
replace UR = 5.2 if region == 4 & grad == ym(1989, 11)
replace UR = 4.9 if region == 1 & grad == ym(1989, 12)
replace UR = 5.7 if region == 2 & grad == ym(1989, 12)
replace UR = 5.5 if region == 3 & grad == ym(1989, 12)
replace UR = 5.2 if region == 4 & grad == ym(1989, 12)
replace UR = 5 if region == 1 & grad == ym(1990, 1)     
replace UR = 5.6 if region == 2 & grad == ym(1990, 1)
replace UR = 5.4 if region == 3 & grad == ym(1990, 1)
replace UR = 5.2 if region == 4 & grad == ym(1990, 1)
replace UR = 5 if region == 1 & grad == ym(1990, 2)     
replace UR = 5.6 if region == 2 & grad == ym(1990, 2)
replace UR = 5.4 if region == 3 & grad == ym(1990, 2)
replace UR = 5.2 if region == 4 & grad == ym(1990, 2)
replace UR = 5 if region == 1 & grad == ym(1990, 3)     
replace UR = 5.5 if region == 2 & grad == ym(1990, 3)
replace UR = 5.4 if region == 3 & grad == ym(1990, 3)
replace UR = 5.2 if region == 4 & grad == ym(1990, 3)
replace UR = 5.1 if region == 1 & grad == ym(1990, 4)     
replace UR = 5.4 if region == 2 & grad == ym(1990, 4)
replace UR = 5.4 if region == 3 & grad == ym(1990, 4)
replace UR = 5.2 if region == 4 & grad == ym(1990, 4)
replace UR = 5.1 if region == 1 & grad == ym(1990, 5)
replace UR = 5.4 if region == 2 & grad == ym(1990, 5)
replace UR = 5.5 if region == 3 & grad == ym(1990, 5)
replace UR = 5.3 if region == 4 & grad == ym(1990, 5)
replace UR = 5.2 if region == 1 & grad == ym(1990, 6)
replace UR = 5.5 if region == 2 & grad == ym(1990, 6)
replace UR = 5.5 if region == 3 & grad == ym(1990, 6)
replace UR = 5.3 if region == 4 & grad == ym(1990, 6)
replace UR = 5.3 if region == 1 & grad == ym(1990, 7)
replace UR = 5.5 if region == 2 & grad == ym(1990, 7)
replace UR = 5.7 if region == 3 & grad == ym(1990, 7)
replace UR = 5.4 if region == 4 & grad == ym(1990, 7)
replace UR = 5.5 if region == 1 & grad == ym(1990, 8)
replace UR = 5.6 if region == 2 & grad == ym(1990, 8)
replace UR = 5.8 if region == 3 & grad == ym(1990, 8)
replace UR = 5.6 if region == 4 & grad == ym(1990, 8)
replace UR = 5.7 if region == 1 & grad == ym(1990, 9)
replace UR = 5.7 if region == 2 & grad == ym(1990, 9)
replace UR = 5.9 if region == 3 & grad == ym(1990, 9)
replace UR = 5.7 if region == 4 & grad == ym(1990, 9)
replace UR = 5.9 if region == 1 & grad == ym(1990, 10)
replace UR = 5.8 if region == 2 & grad == ym(1990, 10)
replace UR = 6.1 if region == 3 & grad == ym(1990, 10)
replace UR = 5.9 if region == 4 & grad == ym(1990, 10)
replace UR = 6.1 if region == 1 & grad == ym(1990, 11)
replace UR = 6 if region == 2 & grad == ym(1990, 11)
replace UR = 6.3 if region == 3 & grad == ym(1990, 11)
replace UR = 6.1 if region == 4 & grad == ym(1990, 11)
replace UR = 6.4 if region == 1 & grad == ym(1990, 12)
replace UR = 6.1 if region == 2 & grad == ym(1990, 12)
replace UR = 6.4 if region == 3 & grad == ym(1990, 12)
replace UR = 6.2 if region == 4 & grad == ym(1990, 12)
replace UR = 6.6 if region == 1 & grad == ym(1991, 1)     
replace UR = 6.3 if region == 2 & grad == ym(1991, 1)
replace UR = 6.5 if region == 3 & grad == ym(1991, 1)
replace UR = 6.4 if region == 4 & grad == ym(1991, 1)
replace UR = 6.9 if region == 1 & grad == ym(1991, 2)     
replace UR = 6.4 if region == 2 & grad == ym(1991, 2)
replace UR = 6.6 if region == 3 & grad == ym(1991, 2)
replace UR = 6.6 if region == 4 & grad == ym(1991, 2)
replace UR = 7.1 if region == 1 & grad == ym(1991, 3)     
replace UR = 6.5 if region == 2 & grad == ym(1991, 3)
replace UR = 6.7 if region == 3 & grad == ym(1991, 3)
replace UR = 6.7 if region == 4 & grad == ym(1991, 3)
replace UR = 7.2 if region == 1 & grad == ym(1991, 4)     
replace UR = 6.5 if region == 2 & grad == ym(1991, 4)
replace UR = 6.8 if region == 3 & grad == ym(1991, 4)
replace UR = 6.8 if region == 4 & grad == ym(1991, 4)
replace UR = 7.3 if region == 1 & grad == ym(1991, 5)
replace UR = 6.5 if region == 2 & grad == ym(1991, 5)
replace UR = 6.8 if region == 3 & grad == ym(1991, 5)
replace UR = 6.8 if region == 4 & grad == ym(1991, 5)
replace UR = 7.3 if region == 1 & grad == ym(1991, 6)
replace UR = 6.5 if region == 2 & grad == ym(1991, 6)
replace UR = 6.8 if region == 3 & grad == ym(1991, 6)
replace UR = 6.9 if region == 4 & grad == ym(1991, 6)
replace UR = 7.3 if region == 1 & grad == ym(1991, 7)
replace UR = 6.4 if region == 2 & grad == ym(1991, 7)
replace UR = 6.7 if region == 3 & grad == ym(1991, 7)
replace UR = 6.9 if region == 4 & grad == ym(1991, 7)
replace UR = 7.3 if region == 1 & grad == ym(1991, 8)
replace UR = 6.4 if region == 2 & grad == ym(1991, 8)
replace UR = 6.7 if region == 3 & grad == ym(1991, 8)
replace UR = 7 if region == 4 & grad == ym(1991, 8)
replace UR = 7.4 if region == 1 & grad == ym(1991, 9)
replace UR = 6.4 if region == 2 & grad == ym(1991, 9)
replace UR = 6.8 if region == 3 & grad == ym(1991, 9)
replace UR = 7.1 if region == 4 & grad == ym(1991, 9)
replace UR = 7.5 if region == 1 & grad == ym(1991, 10)
replace UR = 6.5 if region == 2 & grad == ym(1991, 10)
replace UR = 6.8 if region == 3 & grad == ym(1991, 10)
replace UR = 7.1 if region == 4 & grad == ym(1991, 10)
replace UR = 7.7 if region == 1 & grad == ym(1991, 11)
replace UR = 6.6 if region == 2 & grad == ym(1991, 11)
replace UR = 6.9 if region == 3 & grad == ym(1991, 11)
replace UR = 7.4 if region == 4 & grad == ym(1991, 11)
replace UR = 7.8 if region == 1 & grad == ym(1991, 12)
replace UR = 6.7 if region == 2 & grad == ym(1991, 12)
replace UR = 7.1 if region == 3 & grad == ym(1991, 12)
replace UR = 7.5 if region == 4 & grad == ym(1991, 12)
replace UR = 7.9 if region == 1 & grad == ym(1992, 1)     
replace UR = 6.7 if region == 2 & grad == ym(1992, 1)
replace UR = 7.1 if region == 3 & grad == ym(1992, 1)
replace UR = 7.7 if region == 4 & grad == ym(1992, 1)
replace UR = 8 if region == 1 & grad == ym(1992, 2)     
replace UR = 6.8 if region == 2 & grad == ym(1992, 2)
replace UR = 7.4 if region == 3 & grad == ym(1992, 2)
replace UR = 7.8 if region == 4 & grad == ym(1992, 2)
replace UR = 8.1 if region == 1 & grad == ym(1992, 3)     
replace UR = 6.8 if region == 2 & grad == ym(1992, 3)
replace UR = 7.4 if region == 3 & grad == ym(1992, 3)
replace UR = 7.9 if region == 4 & grad == ym(1992, 3)
replace UR = 8.2 if region == 1 & grad == ym(1992, 4)     
replace UR = 6.8 if region == 2 & grad == ym(1992, 4)
replace UR = 7.4 if region == 3 & grad == ym(1992, 4)
replace UR = 8 if region == 4 & grad == ym(1992, 4)
replace UR = 8.3 if region == 1 & grad == ym(1992, 5)
replace UR = 6.8 if region == 2 & grad == ym(1992, 5)
replace UR = 7.4 if region == 3 & grad == ym(1992, 5)
replace UR = 8.1 if region == 4 & grad == ym(1992, 5)
replace UR = 8.3 if region == 1 & grad == ym(1992, 6)
replace UR = 6.8 if region == 2 & grad == ym(1992, 6)
replace UR = 7.3 if region == 3 & grad == ym(1992, 6)
replace UR = 8.2 if region == 4 & grad == ym(1992, 6)
replace UR = 8.4 if region == 1 & grad == ym(1992, 7)
replace UR = 6.8 if region == 2 & grad == ym(1992, 7)
replace UR = 7.3 if region == 3 & grad == ym(1992, 7)
replace UR = 8.3 if region == 4 & grad == ym(1992, 7)
replace UR = 8.4 if region == 1 & grad == ym(1992, 8)
replace UR = 6.7 if region == 2 & grad == ym(1992, 8)
replace UR = 7.3 if region == 3 & grad == ym(1992, 8)
replace UR = 8.4 if region == 4 & grad == ym(1992, 8)
replace UR = 8.3 if region == 1 & grad == ym(1992, 9)
replace UR = 6.6 if region == 2 & grad == ym(1992, 9)
replace UR = 7.2 if region == 3 & grad == ym(1992, 9)
replace UR = 8.4 if region == 4 & grad == ym(1992, 9)
replace UR = 8.2 if region == 1 & grad == ym(1992, 10)
replace UR = 6.5 if region == 2 & grad == ym(1992, 10)
replace UR = 7.1 if region == 3 & grad == ym(1992, 10)
replace UR = 8.4 if region == 4 & grad == ym(1992, 10)
replace UR = 8.1 if region == 1 & grad == ym(1992, 11)
replace UR = 6.4 if region == 2 & grad == ym(1992, 11)
replace UR = 7 if region == 3 & grad == ym(1992, 11)
replace UR = 8.4 if region == 4 & grad == ym(1992, 11)
replace UR = 8 if region == 1 & grad == ym(1992, 12)
replace UR = 6.3 if region == 2 & grad == ym(1992, 12)
replace UR = 7 if region == 3 & grad == ym(1992, 12)
replace UR = 8.4 if region == 4 & grad == ym(1992, 12)
replace UR = 7.9 if region == 1 & grad == ym(1993, 1)     
replace UR = 6.3 if region == 2 & grad == ym(1993, 1)
replace UR = 6.9 if region == 3 & grad == ym(1993, 1)
replace UR = 8.4 if region == 4 & grad == ym(1993, 1)
replace UR = 7.8 if region == 1 & grad == ym(1993, 2)     
replace UR = 6.2 if region == 2 & grad == ym(1993, 2)
replace UR = 6.8 if region == 3 & grad == ym(1993, 2)
replace UR = 8.3 if region == 4 & grad == ym(1993, 2)
replace UR = 7.7 if region == 1 & grad == ym(1993, 3)     
replace UR = 6.2 if region == 2 & grad == ym(1993, 3)
replace UR = 6.8 if region == 3 & grad == ym(1993, 3)
replace UR = 8.3 if region == 4 & grad == ym(1993, 3)
replace UR = 7.6 if region == 1 & grad == ym(1993, 4)     
replace UR = 6.2 if region == 2 & grad == ym(1993, 4)
replace UR = 6.7 if region == 3 & grad == ym(1993, 4)
replace UR = 8.2 if region == 4 & grad == ym(1993, 4)
replace UR = 7.5 if region == 1 & grad == ym(1993, 5)
replace UR = 6.2 if region == 2 & grad == ym(1993, 5)
replace UR = 6.6 if region == 3 & grad == ym(1993, 5)
replace UR = 8.2 if region == 4 & grad == ym(1993, 5)
replace UR = 7.4 if region == 1 & grad == ym(1993, 6)
replace UR = 6.1 if region == 2 & grad == ym(1993, 6)
replace UR = 6.6 if region == 3 & grad == ym(1993, 6)
replace UR = 8.1 if region == 4 & grad == ym(1993, 6)
replace UR = 7.3 if region == 1 & grad == ym(1993, 7)
replace UR = 6 if region == 2 & grad == ym(1993, 7)
replace UR = 6.5 if region == 3 & grad == ym(1993, 7)
replace UR = 8 if region == 4 & grad == ym(1993, 7)
replace UR = 7.2 if region == 1 & grad == ym(1993, 8)
replace UR = 5.9 if region == 2 & grad == ym(1993, 8)
replace UR = 6.5 if region == 3 & grad == ym(1993, 8)
replace UR = 8 if region == 4 & grad == ym(1993, 8)
replace UR = 7.2 if region == 1 & grad == ym(1993, 9)
replace UR = 5.9 if region == 2 & grad == ym(1993, 9)
replace UR = 6.4 if region == 3 & grad == ym(1993, 9)
replace UR = 7.9 if region == 4 & grad == ym(1993, 9)
replace UR = 7.1 if region == 1 & grad == ym(1993, 10)
replace UR = 5.8 if region == 2 & grad == ym(1993, 10)
replace UR = 6.4 if region == 3 & grad == ym(1993, 10)
replace UR = 7.9 if region == 4 & grad == ym(1993, 10)
replace UR = 7 if region == 1 & grad == ym(1993, 11)
replace UR = 5.8 if region == 2 & grad == ym(1993, 11)
replace UR = 6.3 if region == 3 & grad == ym(1993, 11)
replace UR = 7.8 if region == 4 & grad == ym(1993, 11)
replace UR = 7 if region == 1 & grad == ym(1993, 12)
replace UR = 5.8 if region == 2 & grad == ym(1993, 12)
replace UR = 6.3 if region == 3 & grad == ym(1993, 12)
replace UR = 7.8 if region == 4 & grad == ym(1993, 12)
replace UR = 7 if region == 1 & grad == ym(1994, 1)     
replace UR = 5.7 if region == 2 & grad == ym(1994, 1)
replace UR = 6.3 if region == 3 & grad == ym(1994, 1)
replace UR = 7.7 if region == 4 & grad == ym(1994, 1)
replace UR = 6.9 if region == 1 & grad == ym(1994, 2)     
replace UR = 5.6 if region == 2 & grad == ym(1994, 2)
replace UR = 6.2 if region == 3 & grad == ym(1994, 2)
replace UR = 7.6 if region == 4 & grad == ym(1994, 2)
replace UR = 6.8 if region == 1 & grad == ym(1994, 3)     
replace UR = 5.5 if region == 2 & grad == ym(1994, 3)
replace UR = 6.2 if region == 3 & grad == ym(1994, 3)
replace UR = 7.6 if region == 4 & grad == ym(1994, 3)
replace UR = 6.6 if region == 1 & grad == ym(1994, 5)
replace UR = 5.2 if region == 2 & grad == ym(1994, 5)
replace UR = 6 if region == 3 & grad == ym(1994, 5)
replace UR = 7.4 if region == 4 & grad == ym(1994, 5)
replace UR = 6.4 if region == 1 & grad == ym(1994, 7)
replace UR = 5 if region == 2 & grad == ym(1994, 7)
replace UR = 5.8 if region == 3 & grad == ym(1994, 7)
replace UR = 7.2 if region == 4 & grad == ym(1994, 7)
replace UR = 6.4 if region == 1 & grad == ym(1994, 8)
replace UR = 4.9 if region == 2 & grad == ym(1994, 8)
replace UR = 5.8 if region == 3 & grad == ym(1994, 8)
replace UR = 7.1 if region == 4 & grad == ym(1994, 8)
replace UR = 6 if region == 1 & grad == ym(1994, 12)
replace UR = 4.5 if region == 2 & grad == ym(1994, 12)
replace UR = 5.4 if region == 3 & grad == ym(1994, 12)
replace UR = 6.6 if region == 4 & grad == ym(1994, 12)
replace UR = 5.9 if region == 1 & grad == ym(1995, 1)     
replace UR = 4.5 if region == 2 & grad == ym(1995, 1)
replace UR = 5.3 if region == 3 & grad == ym(1995, 1)
replace UR = 6.5 if region == 4 & grad == ym(1995, 1)
replace UR = 5.9 if region == 1 & grad == ym(1995, 3)     
replace UR = 4.5 if region == 2 & grad == ym(1995, 3)
replace UR = 5.3 if region == 3 & grad == ym(1995, 3)
replace UR = 6.5 if region == 4 & grad == ym(1995, 3)
replace UR = 6.1 if region == 1 & grad == ym(1995, 6)
replace UR = 4.7 if region == 2 & grad == ym(1995, 6)
replace UR = 5.5 if region == 3 & grad == ym(1995, 6)
replace UR = 6.7 if region == 4 & grad == ym(1995, 6)
replace UR = 6.1 if region == 1 & grad == ym(1995, 7)
replace UR = 4.6 if region == 2 & grad == ym(1995, 7)
replace UR = 5.5 if region == 3 & grad == ym(1995, 7)
replace UR = 6.7 if region == 4 & grad == ym(1995, 7)
replace UR = 6 if region == 1 & grad == ym(1995, 8)
replace UR = 4.6 if region == 2 & grad == ym(1995, 8)
replace UR = 5.5 if region == 3 & grad == ym(1995, 8)
replace UR = 6.7 if region == 4 & grad == ym(1995, 8)
replace UR = 6 if region == 1 & grad == ym(1995, 9)
replace UR = 4.6 if region == 2 & grad == ym(1995, 9)
replace UR = 5.5 if region == 3 & grad == ym(1995, 9)
replace UR = 6.7 if region == 4 & grad == ym(1995, 9)
replace UR = 6 if region == 1 & grad == ym(1995, 10)
replace UR = 4.6 if region == 2 & grad == ym(1995, 10)
replace UR = 5.5 if region == 3 & grad == ym(1995, 10)
replace UR = 6.7 if region == 4 & grad == ym(1995, 10)
replace UR = 5.9 if region == 1 & grad == ym(1996, 2)     
replace UR = 4.6 if region == 2 & grad == ym(1996, 2)
replace UR = 5.4 if region == 3 & grad == ym(1996, 2)
replace UR = 6.6 if region == 4 & grad == ym(1996, 2)
replace UR = 5.8 if region == 1 & grad == ym(1996, 3)     
replace UR = 4.6 if region == 2 & grad == ym(1996, 3)
replace UR = 5.4 if region == 3 & grad == ym(1996, 3)
replace UR = 6.6 if region == 4 & grad == ym(1996, 3)
replace UR = 5.8 if region == 1 & grad == ym(1996, 4)     
replace UR = 4.6 if region == 2 & grad == ym(1996, 4)
replace UR = 5.3 if region == 3 & grad == ym(1996, 4)
replace UR = 6.5 if region == 4 & grad == ym(1996, 4)
replace UR = 5.7 if region == 1 & grad == ym(1996, 5)     
replace UR = 4.6 if region == 2 & grad == ym(1996, 5)
replace UR = 5.3 if region == 3 & grad == ym(1996, 5)
replace UR = 6.5 if region == 4 & grad == ym(1996, 5)
replace UR = 5.6 if region == 1 & grad == ym(1996, 6)
replace UR = 4.5 if region == 2 & grad == ym(1996, 6)
replace UR = 5.2 if region == 3 & grad == ym(1996, 6)
replace UR = 6.4 if region == 4 & grad == ym(1996, 6)
replace UR = 5.6 if region == 1 & grad == ym(1996, 7)
replace UR = 4.5 if region == 2 & grad == ym(1996, 7)
replace UR = 5.2 if region == 3 & grad == ym(1996, 7)
replace UR = 6.3 if region == 4 & grad == ym(1996, 7)
replace UR = 5.6 if region == 1 & grad == ym(1996, 11)
replace UR = 4.4 if region == 2 & grad == ym(1996, 11)
replace UR = 5.2 if region == 3 & grad == ym(1996, 11)
replace UR = 6.2 if region == 4 & grad == ym(1996, 11)
replace UR = 5.6 if region == 1 & grad == ym(1997, 1)     
replace UR = 4.4 if region == 2 & grad == ym(1997, 1)
replace UR = 5.2 if region == 3 & grad == ym(1997, 1)
replace UR = 6.1 if region == 4 & grad == ym(1997, 1)
replace UR = 5.6 if region == 1 & grad == ym(1997, 3)     
replace UR = 4.2 if region == 2 & grad == ym(1997, 3)
replace UR = 5.1 if region == 3 & grad == ym(1997, 3)
replace UR = 5.9 if region == 4 & grad == ym(1997, 3)
replace UR = 5.5 if region == 1 & grad == ym(1997, 4)     
replace UR = 4.1 if region == 2 & grad == ym(1997, 4)
replace UR = 5.1 if region == 3 & grad == ym(1997, 4)
replace UR = 5.7 if region == 4 & grad == ym(1997, 4)
replace UR = 5.2 if region == 1 & grad == ym(1997, 10)
replace UR = 3.9 if region == 2 & grad == ym(1997, 10)
replace UR = 4.7 if region == 3 & grad == ym(1997, 10)
replace UR = 5.4 if region == 4 & grad == ym(1997, 10)
replace UR = 5 if region == 1 & grad == ym(1998, 1)     
replace UR = 3.9 if region == 2 & grad == ym(1998, 1)
replace UR = 4.5 if region == 3 & grad == ym(1998, 1)
replace UR = 5.3 if region == 4 & grad == ym(1998, 1)
replace UR = 4.7 if region == 1 & grad == ym(1998, 4)     
replace UR = 3.7 if region == 2 & grad == ym(1998, 4)
replace UR = 4.4 if region == 3 & grad == ym(1998, 4)
replace UR = 5.3 if region == 4 & grad == ym(1998, 4)
replace UR = 4.5 if region == 1 & grad == ym(1998, 10)
replace UR = 3.8 if region == 2 & grad == ym(1998, 10)
replace UR = 4.4 if region == 3 & grad == ym(1998, 10)
replace UR = 5.4 if region == 4 & grad == ym(1998, 10)
replace UR = 4.5 if region == 1 & grad == ym(1998, 11)
replace UR = 3.7 if region == 2 & grad == ym(1998, 11)
replace UR = 4.3 if region == 3 & grad == ym(1998, 11)
replace UR = 5.3 if region == 4 & grad == ym(1998, 11)
replace UR = 4.4 if region == 1 & grad == ym(1998, 12)
replace UR = 3.7 if region == 2 & grad == ym(1998, 12)
replace UR = 4.2 if region == 3 & grad == ym(1998, 12)
replace UR = 5.2 if region == 4 & grad == ym(1998, 12)
replace UR = 4.4 if region == 1 & grad == ym(1999, 4)     
replace UR = 3.6 if region == 2 & grad == ym(1999, 4)
replace UR = 4.1 if region == 3 & grad == ym(1999, 4)
replace UR = 5 if region == 4 & grad == ym(1999, 4)
replace UR = 4 if region == 1 & grad == ym(2000, 1)     
replace UR = 3.5 if region == 2 & grad == ym(2000, 1)
replace UR = 4 if region == 3 & grad == ym(2000, 1)
replace UR = 4.6 if region == 4 & grad == ym(2000, 1)
replace UR = 3.8 if region == 1 & grad == ym(2000, 5)     
replace UR = 3.6 if region == 2 & grad == ym(2000, 5)
replace UR = 3.9 if region == 3 & grad == ym(2000, 5)
replace UR = 4.7 if region == 4 & grad == ym(2000, 5)
replace UR = 3.9 if region == 1 & grad == ym(2001, 2)     
replace UR = 4.1 if region == 2 & grad == ym(2001, 2)
replace UR = 4.1 if region == 3 & grad == ym(2001, 2)
replace UR = 4.7 if region == 4 & grad == ym(2001, 2)
replace UR = 4.2 if region == 1 & grad == ym(2001, 6)     
replace UR = 4.3 if region == 2 & grad == ym(2001, 6)
replace UR = 4.5 if region == 3 & grad == ym(2001, 6)
replace UR = 5 if region == 4 & grad == ym(2001, 6)
replace UR = 4.5 if region == 1 & grad == ym(2001, 8)     
replace UR = 4.6 if region == 2 & grad == ym(2001, 8)
replace UR = 4.8 if region == 3 & grad == ym(2001, 8)
replace UR = 5.4 if region == 4 & grad == ym(2001, 8)
replace UR = 5.6 if region == 1 & grad == ym(2002, 5)     
replace UR = 5.6 if region == 2 & grad == ym(2002, 5)
replace UR = 5.7 if region == 3 & grad == ym(2002, 5)
replace UR = 6.5 if region == 4 & grad == ym(2002, 5)
replace UR = 5.6 if region == 1 & grad == ym(2002, 7)     
replace UR = 5.5 if region == 2 & grad == ym(2002, 7)
replace UR = 5.6 if region == 3 & grad == ym(2002, 7)
replace UR = 6.4 if region == 4 & grad == ym(2002, 7)
replace UR = 5.6 if region == 1 & grad == ym(2002, 8)     
replace UR = 5.4 if region == 2 & grad == ym(2002, 8)
replace UR = 5.6 if region == 3 & grad == ym(2002, 8)
replace UR = 6.4 if region == 4 & grad == ym(2002, 8)
replace UR = 6 if region == 1 & grad == ym(2003, 8)     
replace UR = 6.1 if region == 2 & grad == ym(2003, 8)
replace UR = 5.8 if region == 3 & grad == ym(2003, 8)
replace UR = 6.7 if region == 4 & grad == ym(2003, 8)
replace UR = 5.9 if region == 1 & grad == ym(2003, 5)     
replace UR = 6 if region == 2 & grad == ym(2003, 5)
replace UR = 5.9 if region == 3 & grad == ym(2003, 5)
replace UR = 6.7 if region == 4 & grad == ym(2003, 5)

********************************************************************************
** Weight
********************************************************************************

gen weight = Q11_9_1981 if Q11_9_1981 > 0 & preg <= ym(1981,12)
replace weight = Q11_9_1982 if missing(weight) & Q11_9_1982 > 0 & preg <= ym(1982,12)
replace weight = Q11_9_1985 if missing(weight) & Q11_9_1985 > 0 & preg <= ym(1985,12)
replace weight = Q11_9_1986 if missing(weight) & Q11_9_1986 > 0 & preg <= ym(1986,12)
replace weight = Q11_9_1988 if missing(weight) & Q11_9_1988 > 0 & preg <= ym(1988,12)
replace weight = Q11_9_1989 if missing(weight) & Q11_9_1989 > 0 & preg <= ym(1989,12)
replace weight = Q11_9_1990 if missing(weight) & Q11_9_1990 > 0 & preg <= ym(1990,12)
replace weight = Q11_9_1992 if missing(weight) & Q11_9_1992 > 0 & preg <= ym(1992,12)
replace weight = Q11_9_1993 if missing(weight) & Q11_9_1993 > 0 & preg <= ym(1993,12)
replace weight = Q11_9_1994 if missing(weight) & Q11_9_1994 > 0 & preg <= ym(1994,12)
replace weight = Q11_9_1996 if missing(weight) & Q11_9_1996 > 0 & preg <= ym(1996,12)
replace weight = Q11_9_1998 if missing(weight) & Q11_9_1998 > 0 & preg <= ym(1998,12)
replace weight = Q11_9_2000 if missing(weight) & Q11_9_2000 > 0 & preg <= ym(2000,12)
replace weight = Q11_9_2002 if missing(weight) & Q11_9_2002 > 0 & preg <= ym(2002,12)
replace weight = Q11_9_2004 if missing(weight) & Q11_9_2004 > 0 & preg <= ym(2004,12)
replace weight = Q11_9_2006 if missing(weight) & Q11_9_2006 > 0 & preg <= ym(2006,12)
replace weight = Q11_9_2008 if missing(weight) & Q11_9_2008 > 0 & preg <= ym(2012,1)

********************************************************************************
** Height
********************************************************************************

gen height = HEALTH_HEIGHT_1985 if HEALTH_HEIGHT_1985 > 0 
replace height = HEALTH_HEIGHT_1982 if missing(height) & HEALTH_HEIGHT_1982 > 0 

********************************************************************************
**# BMI
********************************************************************************

gen bmi = weight/(height)^2 * 703

gen age_p = round((preg - dob)/12)

***

gen inhosp = PST0013_XRND if PST0013_XRND >= 0
gen breast = PST0121_XRND if PST0121_XRND >=0
gen obes = 1 if bmi >= 30
replace obes = 0 if missing(obes)

***************************************************************************
/* WEIGHT GAIN DURING PREGNANCY */
***************************************************************************

* healthy
gen gain = 1 if (PRE0086_XRND >= 28 & PRE0086_XRND <= 40) & (bmi <= 18.5)
replace gain = 1 if (PRE0086_XRND >= 25 & PRE0086_XRND <= 35) & (bmi > 18.5 & bmi < 25)
replace gain = 1 if (PRE0086_XRND >= 15 & PRE0086_XRND <= 25) & (bmi >= 25 & bmi < 30)
replace gain = 1 if (PRE0086_XRND >= 11 & PRE0086_XRND <= 20) & (bmi >= 30)
replace gain = 0 if missing(gain) & PRE0086_XRND >= 0

* obese
gen ogain = 1 if (PRE0086_XRND > 40) & (bmi <= 18.5)
replace ogain = 1 if (PRE0086_XRND > 35) & (bmi > 18.5 & bmi < 25)
replace ogain = 1 if (PRE0086_XRND > 25) & (bmi >= 25 & bmi < 30)
replace ogain = 1 if (PRE0086_XRND > 20) & (bmi >= 30)
replace ogain = 0 if missing(ogain) & PRE0086_XRND >= 0

*under
gen ugain = 1 if (PRE0086_XRND < 28) & (bmi <= 18.5)
replace ugain = 1 if (PRE0086_XRND < 25) & (bmi > 18.5 & bmi < 25)
replace ugain = 1 if (PRE0086_XRND < 15) & (bmi >= 25 & bmi < 30)
replace ugain = 1 if (PRE0086_XRND < 11) & (bmi >= 30)
replace ugain = 0 if missing(ugain) & PRE0086_XRND >= 0

*unhealthy 
gen overgain = 1 if gain == 0
replace overgain = 0 if gain == 1

