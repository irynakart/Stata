*******************************************************************************
// Heatplot
// The syntax for heatplot requires three variables. 
// First variable is the z-value, second is y-value and the third is x-value. 
// Out of the 3 variables, only our z-value is continuous while the rest are discrete, which is why we use the i. (factor variable) notation.
*******************************************************************************

* Install user written packages:
ssc install heatplot, replace
ssc install palettes, replace
ssc install colrspace, replace
ssc install blindschemes, replace

* Generate a numeric state variable for Y-axis
encode state, gen(State)
encode index, gen(Index)

* Assign a number sequence to each state where the value 1 is for `2005', 2 is for `2006' and so on. X-axis variables

generate Year=1 if year==2005
replace Year=2 if year==2006 
replace Year=3 if year==2007
replace Year=4 if year==2008
replace Year=5 if year==2009
replace Year=6 if year==2010
replace Year=7 if year==2011
replace Year=8 if year==2012
replace Year=9 if year==2013
replace Year=10 if year==2014
replace Year=11 if year==2015
replace Year=12 if year==2016
replace Year=13 if year==2017
replace Year=14 if year==2018
replace Year=15 if year==2019
replace Year=16 if year==2020
replace Year=17 if year==2021

*****
encode tfr, gen(TFR)
 
*** define and assign a value label to our year-month variable. 

 #delimit ;
 label define Year 
      1 "2005"   2 "2006" 
      3 "2007"        4 "2008" 
      5 "2009"        6 "2010" 
      7 "2011"        8 "2012" 
      9 "2013"        10 "2014" 
      11 "2015"       12 "2016" 
      13 "2017"  14 "2018" 
      15 "2019"       16 "2020"
      17 "2021"      
   , replace 
 ;
 #delimit cr

label values Year Year

**** Delimiters are handy when you want to organize a long line of code in a readable manner. 
***** Delimiter once initiated, treats the text following it as a single line. 
** RUN IT ALL IN ONE GO:

quietly: summarize Year
return list
local count = `r(max)'
local xlab
    forval i=1/`count'{
        local xlab "`xlab' `=`i'-0.5' `" "`:lab (Year) `i''" "'"
    }

#delimit ;
 heatplot tfr i.State i.Year, 
 
   ytitle("")                
   xtitle("")
   
   cuts(@min 1500 1600 1700 1800 1900 2000 2100 2200 2300 @max)
   
   legend(subtitle("") 
     pos(1) 
     ring(1)          /* Value of 0 - the title will remain within the plot region. Values>0 will take title outside the plot region */
     rows(1)         /* information displayed in a single row */
     keygap(0.5)    /* gap between symbol and text */
     colgap(0)     /* gap between our symbols */
     size(1.5)     
     symysize(1)  /* defines vertical height */
     symxsize(9)  /* defines horizontal length */
     order(1 "Less than 1.5" 2 "1.5 to 1.6" 3 "1.6 to 1.7" 4 "1.7 to 1.8" 5 "1.8 to 1.9" 6 "1.9 to 2" 7 "2 to 2.1" 8 "2.1 to 2.2" 9 "2.2 to 2.3" 10 "2.3 or more") 
     stack
    )
   
   xlabel(`xlab', 
     nogrid 
     labsize(2) 
     labcolor(gs5)
    )
xscale(extend)

yscale(
     noline       /* removes vertical Y-axis line */
     alt          /* shift our axis to the right hand side */
     reverse     /* sort labels in an ascending order */
    ) 
   
   ylabel(, 
     angle(horizontal) 
     labgap(-140)    /* pushes labels back to the original side  */
     labsize(2)     /* size of countries  */
     noticks        /* removes ticks that are pointing to each label  */
     labcolor(gs5) 
     nogrid
    )
    
   graphregion(margin(l=17 r=2)) /* increasing graph region to the left and limiting the right-hand side region to 2 points  */
   plotregion(margin(b=0 t=0)) /* gaps between x-axis and the heatplot  */
   
   p(
    lcolor(white) 
    lwidth(0.1) 
    lalign(center)
   )
   
color("165 000 038" "215 048 039" "244 109 067" "253 174 097"  "254 224 139" "255 255 191" "166 217 106" "102 189 099" "026 152 080" "000 104 055") 
    
   title("{it:Figure 1}", 
     pos(11) 
     size(2) 
     margin(l=-12 b=-15 t=1)
    ) 
    
   subtitle("{bf:Total Fertility Rate, 2005-2021}", 
     pos(11) 
     size(2) 
     margin(l=-12 b=-15 t=4)
    ) 
	
 scheme(plotplain);
    
 ;
 #delimit cr


*******************************************************************************
/* High Fertility Graph:  */

keep if state == "Alaska" | state == "Idaho" | state == "Kansas" | state == "Nebraska" | state == "North Dakota" | state == "South Dakota" | state == "Texas" | state == "Utah"

quietly: summarize Year
return list
local count = `r(max)'
local xlab
    forval i=1/`count'{
        local xlab "`xlab' `=`i'-0.5' `" "`:lab (Year) `i''" "'"
    }

#delimit ;
 heatplot tfr i.Index i.Year, 
 
   ytitle("")                
   xtitle("")
   
   cuts(@min 1800 1900 2000 2100 2200 @max)
   
   legend(subtitle("") 
     pos(4) 
     ring(1)          /* Value of 0 - the title will remain within the plot region. Values>0 will take title outside the plot region */
     cols(1)         /* information displayed in a single row */
     keygap(0.5)    /* gap between symbol and text */
     colgap(0)     /* gap between our symbols */
     size(2.2)     
     symysize(5)  /* defines vertical height */
     symxsize(2)  /* defines horizontal length */
     order(1 "Less than 1.8" 2 "1.8 to 1.9" 3 "1.9 to 2" 4 "2 to 2.1" 5 "2.1 to 2.2" 6 "2.2 or more") 
    )
   
   xlabel(`xlab', 
     nogrid 
     labsize(2.2)  /* size of years  */
     labcolor(gs5)
    )
xscale(extend)

yscale(
     noline       /* removes vertical Y-axis line */
     reverse     /* sort labels in an ascending order */
    ) 
   
   ylabel(, 
     angle(horizontal) 
     labsize(3)     /* size of countries  */
     noticks        /* removes ticks that are pointing to each label  */
     labcolor(gs5) 
     nogrid
    )
    
   graphregion(margin(l=2 r=0 b=5 t=5)) /* increasing graph region to the left and limiting the right-hand side region to 2 points  */
   plotregion(margin(b=0 t=0)) /* gaps between x-axis and the heatplot  */
   
   p(
    lcolor(white) 
    lwidth(0.1) 
    lalign(center)
   )
   
color( "253 174 097"  "254 224 139" "255 255 191" "166 217 106" "102 189 099" "026 152 080" "000 104 055") 
	
 scheme(plotplain);
    
 ;
 #delimit cr
 
 
 *******************************************************************************
/* Low Fertility Graph:  */

keep if state == "Connecticut" | state == "Maine" | state == "Massachusetts" | state == "New Hampshire" | state == "New York" | state == "Rhode Island" | state == "Vermont" | state == "Oregon"
 
 quietly: summarize Year
return list
local count = `r(max)'
local xlab
    forval i=1/`count'{
        local xlab "`xlab' `=`i'-0.5' `" "`:lab (Year) `i''" "'"
    }

#delimit ;
 heatplot tfr i.Index i.Year, 
 
   ytitle("")                
   xtitle("")
   
   cuts(@min 1500 1600 1700 1800 1900 @max)
   
   legend(subtitle("") 
     pos(4) 
     ring(1)          /* Value of 0 - the title will remain within the plot region. Values>0 will take title outside the plot region */
     cols(1)         /* information displayed in a single row */
     keygap(0.5)    /* gap between symbol and text */
     colgap(0)     /* gap between our symbols */
     size(2.2)     
     symysize(5)  /* defines vertical height */
     symxsize(2)  /* defines horizontal length */
     order(1 "Less than 1.5" 2 "1.5 to 1.6" 3 "1.6 to 1.7" 4 "1.7 to 1.8" 5 "1.8 to 1.9" 6 "1.9 to 2" )
    )
   
   xlabel(`xlab', 
     nogrid 
     labsize(2.2)  /* size of years  */
     labcolor(gs5)
    )
xscale(extend)

yscale(
     noline       /* removes vertical Y-axis line */
     reverse     /* sort labels in an ascending order */
    ) 
   
   ylabel(, 
     angle(horizontal) 
     labsize(3)     /* size of countries  */
     noticks        /* removes ticks that are pointing to each label  */
     labcolor(gs5) 
     nogrid
    )
    
   graphregion(margin(l=2 r=0 b=5 t=5)) /* increasing graph region to the left and limiting the right-hand side region to 2 points  */
   plotregion(margin(b=0 t=0)) /* gaps between x-axis and the heatplot  */
   
   p(
    lcolor(white) 
    lwidth(0.1) 
    lalign(center)
   )
   
color("114 000 026" "165 000 038" "215 048 039" "244 109 067" "253 174 097" "254 224 139" "255 255 191") 
	
 scheme(plotplain);
    
 ;
 #delimit cr
