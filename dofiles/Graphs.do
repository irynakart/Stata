
******************************************************

* Graph styles

******************************************************

**# Pie charts 
* visualize the frequency or percentage of observations in each group of a categorical variable. 

graph pie A, over(B) plabel(1 percent, format(%8.0g) color(white) size(small)) plabel(2 percent, format(%8.0g) color(white) size(small)) plabel(3 percent, format(%8.0g) color(white) size(small)) plabel(4 percent, format(%8.0g) color(white) size(small)) line(lcolor(white) lwidth(vvthin)) title(" ") scheme(s1color) pie(1, explode color(ebblue)) pie(2, color("255 86 29"))  pie(3, color("255 141 61")) pie(4, color("250 195 112")) pie(5, color(white)) legend(order(1 "FMLA Eligible" - "{bf:FMLA Ineligible due to:}" 2 "Employment tenure/hours worked" 3 "Worksite size" 4 "Both") col(2) holes(2 4) colgap(15) symxsize(20))

**# Line charts 
* work well with time-series data

twoway (line family year, fc(%70)  lwidth(.5)) (line holidays year, fc(%1)  lwidth(.5)) (line sick year, fc(%1)  lwidth(.5)) (line vacation year, fc(%1)  lwidth(.5)), legend(subtitle("") label(1 "Family Leave") label(2 "Holiday") label(3 "Sick Leave") label(4 "Vacation") pos(12) row(1) size(3) ring(0)) ytitle("% of civilian workers with access") yscale(extend) xtitle("") xlabel(2010(2)2023, format(%ty) labsize(medsmall)) ylabel(0(20)100, grid gmin gmax angle(horizontal)) scheme(s1color)
