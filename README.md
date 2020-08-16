# Association of Arsenic with Chlamydia and Trichomonas

## Research Questions

* Exposure to Speciated arsenic and risk of Chlamydia in US  Population
* Exposure to Speciated Arsenic and risk of Trichomonas infection in US Population

## Variables Under Study

### Arsenic Level
* URXUAS3: Urinary Arsenous Acid. Lower Limit: 0.12
* URXUAS5: Urinary Arsenic acid. Lower Limit: 0.79
* URXUAB: Urinary Arsenobetaine. Lower Limit: 1.16
* URXUAC: Urinary Arsenocholine. Lower Limit: 0.11
* URXUDMA: Urinary Dimethylarsinic Acid. Lower Limit: 1.91
* URXUMMA: Urinary Monomethylarsonic Acid. Lower Limit: 0.20

### Response Variables

* URXUCL - Chlamydia, Urine (44 +ve and 2025 -ve)
* URXUTRI - Trichomonas, Urine (92 +ve and 3742 -ve)




### Demographic

* RIAGENDR: Gender
* RIDAGEYR - Age in years at screening
* RIDRETH1 - Race/Hispanic origin
* RIDRETH3 - Race/Hispanic origin w/ NH Asian
* DMQADFC - Served in a foreign country
* DMDBORN4 - Country of birth
* DMDYRSUS - Length of time in US
* DMDEDUC2 - Education level - Adults 20+
* DMDEDUC3 - Education level - Children/Youth 6-19 (We would need information if there are some individuals of age 18-19)
* INDHHIN2 - Annual household income
* INDFMPIR - Ratio of family income to poverty (Would be more important than the household income. This variable has more missingness than household income since it was not calculated if the reported family income was low (<20K or >=20K). Values above 5 were coded as 5.)

### Other Covariates
* WTFSM: Two year smoking weights
* DIQ010 - Doctor told you have diabetes
* LBXHIVC - HIV-1, 2 Combo Test
* ALQ101 - Had at least 12 alcohol drinks/1 yr?

### Categorical demographic variable keys

#### Age in Year 

| Age | Label|
|---|---|
| 0 to 20 | 1 |
| 20 to 40 | 2|
| 40 to 65 | 3|
|65 and up | 4|

#### Income to Poverty ratio

|PIR |Label|
|---|---|
|0 to 1.3 | 1|
|1.3 to 3.5 | 2|
|3.5 and up| 3|

#### BMI

| BMI |Label |
|---|---|
|0 to 18.5| 1|
|18.5 to 24.9 | 2|
|24.9 to 29.9 | 3|
|29.9 and up |4 |

#### Other
The other variables are labeled similarly as described on data source other than race and education. For education the second (9-11 grade) and third (high school) labels are merged toether. For race, Maxican American and Other Hispanic are grouped together as Hispanic. 

### 
covar$INDFMPIR = cut(covar$INDFMPIR, breaks = c(0,1.3, 3.5,Inf), labels = c(1,2,3))
  covar$RIDAGEYR = cut(covar$RIDAGEYR, breaks = c(0, 20, 40, 65, Inf), labels = c(1,2,3,4))

### Analysis Results

Logistic regression is performed. The results on the analysis can be found in the `combined_analysis_notes`. 
