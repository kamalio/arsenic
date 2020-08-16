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

### Analysis Results

Logistic regression is performed. The results on the analysis can be found in the `combined_analysis_notes`. 
