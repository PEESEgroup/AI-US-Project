# AI-US-Project
This study investigates whether nuclear energy can constitute a no-regret strategy for AI infrastructure expansion in the US, using a state-resolved assessment spanning 2028–2035. The analysis evaluates system-level outcomes across alternative AI growth trajectories, decarbonization constraints, and electricity supply configurations with and without nuclear energy. The following contents are included in this repository to support our key findings:
-	Codes: include all codes to evaluate the scenario configurations.
-	Data: include all data used during the analysis.
## Data Files
The repository provides state-level data and scenario-specific parameters used in the modeling framework. The contents include:
-	Climate and data center performance data: State-specific climate profiles (state_name_raw_data.xlsx) at hourly resolution to evaluate the data center power usage effectiveness (PUE) (inp_pue).
-	Renewable generation profiles: Solar radiation (state_name_srd.xlsx) and wind speed data (state_name_wsp.xlsx) across states, used to characterize the availability of on-site renewable power for data center operations.
-	Adoption modeling inputs: Calibration dataset for the generalized Bass model (inp_gbm.xlsx), parameterizing AI infrastructure adoption under different CoWoS packaging and peak deployment scenarios.
-	Climate pathway parameters: Carbon intensity factors (inp_ci_SSP1_19, inp_ci_SSP2_45, inp_ci_SSP5_60), land-use intensity factors (inp_lu_SSP1_19, inp_lu_SSP2_45, inp_lu_SSP5_60), and water consumption intensity factors (inp_wc_SSP1_19, inp_wc_SSP2_45, inp_wc_SSP5_60) for SSP1-19, SSP2-45, and SSP5-60, enabling assessment across different decarbonization contexts.
-	Technology cost projections: Cost datasets for solar power (inp_solar_cpx.xlsx, inp_solar_opx.xlsx), wind power (inp_wind_cpx.xlsx, inp_wind_opx.xlsx), battery storage and interface systems (inp_bst_cpx.xlsx, inp_bst_opx.xlsx, inp_bit_cpx.xlsx, inp_bit_opx.xlsx), DAC systems (inp_dac_cpx.xlsx), heat pumps (inp_hp_cpx.xlsx), and state-specific electricity prices (inp_ele_price.xlsx).
## Code files
The repository includes code files used to implement the scenario-based modeling framework developed in this study. These codes reflect the different modules of the analysis:
-	Data center performance evaluation: AI_US_PUE evaluates power usage effectiveness (PUE) for data center operations across states, based on hourly climate inputs.
-	Adoption modeling: AI_GBM_Peak2031, AI_GBM_Peak2033, AI_ GBM_Peak2035 implement the generalized Bass model to project AI infrastructure adoption under alternative peak market growth scenarios.
-	Scenario configurations: AI_US_With_Nuclear_CC, AI_US_Without_Nuclear_CC, AI_US_With_Nuclear_NCC, and AI_US_Without_Nuclear_NCC are used to optimize technology portfolios for AI data centers under alternative electricity supply cases.
## Citation
Please use the following citation when using the data, methods or results of this work:
> Lal, A. and You, F. Can Nuclear Energy Enable a No-Regret Strategy for US AI Ambitions?. Submitted to TBD.
