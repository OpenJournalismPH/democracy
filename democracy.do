label variable dscore "Democracy Index score 2016"
label variable gcr2_score "Infra score, GCR 2016-2017"

twoway scatter gcr2_score dscore
twoway (scatter gcr2_score dscore) (lfit gcr2_score dscore)
twoway (scatter gcr2_score dscore) (qfit gcr2_score dscore)

gen regime=0
replace regime=1 if dscore>=0 & dscore<4
replace regime=2 if dscore>=4 & dscore<6
replace regime=3 if dscore>=6 & dscore<8
replace regime=4 if dscore>=8 & dscore<=10
label define regime 1 "Authoritarian regime" 2 "Flawed democracy" 3 "Hybrid regime" 4 "Full democracy", replace
label list regime
tab regime

graph box gcr2_score if regime>0, over(dcat, sort(regime)) title("") ytitle("Infrastructure score in 2016") ylabel(,nogrid) title("On average, infrastructure is better in democracies") note("Sources: 2016 Democracy Index of the Economist Intelligence Unit; WEF Global Competitiveness Report 2016-2017." "Note that infra data is unavailable for 21 authoritarian regimes, 6 hybrid regimes, and 4 flawed democracies.", size(vsmall))
