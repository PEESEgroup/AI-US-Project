Sets

i    'number of states'                  /1*24/
t    'number of hours'                   /1*8760/;

$call gdxxrw.exe Temp_AI_raw.xlsx par=Temperature rng=sheet1!A1:LXY28 
*=== Now import data from GDX
Parameter Temperature(i,t);
$gdxin Temp_AI_raw.gdx
$load Temperature
$gdxin

$call gdxxrw.exe RH_AI_raw.xlsx par=RH rng=sheet1!A1:LXY28
*=== Now import data from GDX
Parameter RH(i,t);
$gdxin RH_AI_raw.gdx
$load RH
$gdxin

$call gdxxrw.exe DP_AI_raw.xlsx par=DP rng=sheet1!A1:LXY28 
*=== Now import data from GDX
Parameter DP(i,t);
$gdxin DP_AI_raw.gdx
$load DP
$gdxin

Acronym zero

Parameter

UPS_eff /0.98/
PD_Lr /0.01/
L_percentage /0.1/
T_sa_setpoint /31/
delta_T_air /16.65/
delta_T_water /7.5/
delta_T_CT /5/
P_atm /101325/

Fan_Pressure_CRAC /500/
Fan_eff_CRAC /0.775/
Fan_Pressure_CT /250/
Fan_eff_CT /0.775/

Pump_Pressure_HD /7000000/
Pump_eff_HD /0.7/
Pump_Pressure_WE /143650/
Pump_eff_WE /0.7/
Pump_Pressure_CW /143650/
Pump_eff_CW /0.7/
Pump_Pressure_CT /208650/
Pump_eff_CT /0.7/

AT_CT /4.75/
AT_HE /2.25/

HTE /0.8/
SHR /0.97/

Chiller_load /0.5/
pCOP /0.1/
L_to_G /2.1/

M /100000/
epsilon /0.001/

Power_IT /1/
T_oa
RH_oa
Tdp_oa
obj_save(i,t)
;

Positive variable

P_sat
P_vapor
d_oa
T_wb_oa
density_oa
E_oa
Powerloss_UPS
Powerloss_PD
Power_Lighting
DC_heat_AC

T_sa
T_ra

density_sa
m_sa
Power_Fan_CRAC

DC_heat_latent
Cooling_required

T_sfw
T_rfw
T_cw

Latent_heat_vaporization
hd_amount

Power_pump_hd

WE_heat_removed

m_sfw
Power_pump_WE

Chiller_heat_removed
COP_Chiller
Power_Chiller
m_sw
Power_pump_CW

CT_heat_removed
m_CT
Power_pump_CT
Power_fan_CT
;

Binary Variable
cond1
cond2
cond3
;

Variable
PUE
;

Equations

eqP_sat
eqP_vapor

eqd_oa

eqT_wb_oa

eqdensity_oa

eqE_oa

eqPowerloss_UPS
eqPowerloss_PD

eqPower_Lighting
eqDC_heat_AC

eqT_sa
eqT_ra

eqdensity_sa
eqm_sa

eqPower_Fan_CRAC

eqDC_heat_latent
eqCooling_required

eqT_sfw
eqT_rfw
eqT_cw

eqLatent_heat_vaporization
eqhd_amount

eqPower_pump_hd

eqcond1
eqcond2a
eqcond2b
eqcond3
eqcond

eqWE_heat_removed

eqm_sfw
eqPower_pump_WE

eqChiller_heat_removed
eqCOP_Chiller
eqPower_Chiller
eqm_sw
eqPower_pump_CW

eqCT_heat_removed
eqm_CT
eqPower_pump_CT
eqPower_fan_CT
eqPUE

;

eqP_sat.. P_sat =e= 611.21*exp((18.678-T_oa/234.5)*(T_oa/(T_oa+257.14))) ;
eqP_vapor.. P_vapor =e= P_sat*RH_oa/100 ;

eqd_oa.. d_oa =e= 622*(RH_oa/100 * P_sat)/(P_atm - RH_oa/100 * P_sat) ;

eqT_wb_oa.. T_wb_oa =e= (T_oa*arctan(0.151977*(RH_oa+8.313659)**0.5))+(0.00391838*(RH_oa)**1.5*arctan(0.023101*RH_oa))-(arctan(RH_oa-1.676331))+(arctan(T_oa+RH_oa))-4.686035 ;

eqdensity_oa.. density_oa =e= 1.293*(P_atm/101325)*(273.15/(273.15+T_oa));

eqE_oa.. E_oa =e= 1.01*T_oa + (2500 + 1.84 * T_oa)*d_oa/1000 ;

eqPowerloss_UPS.. Powerloss_UPS =e= Power_IT/UPS_eff - Power_IT ;
eqPowerloss_PD.. Powerloss_PD =e= Power_IT/(1-PD_Lr) - Power_IT ;
eqPower_Lighting.. Power_Lighting =e= Power_IT*L_percentage ;
eqDC_heat_AC.. DC_heat_AC =e= Power_IT+Powerloss_UPS+Powerloss_PD+Power_Lighting ;

eqT_sa.. T_sa =e= T_sa_setpoint ;
eqT_ra.. T_ra =e= T_sa+delta_T_air ;

eqdensity_sa.. density_sa =e= 1.293*(P_atm/101325)*(273.15/(273.15+T_sa));  
eqm_sa.. m_sa =e= DC_heat_AC/(1.01*delta_T_air) ;

eqPower_Fan_CRAC.. Power_Fan_CRAC =e= m_sa/density_sa*Fan_Pressure_CRAC/Fan_eff_CRAC/1000 ;

eqDC_heat_latent.. DC_heat_latent =e= DC_heat_AC/SHR - DC_heat_AC ;
eqCooling_required.. Cooling_required =e= DC_heat_AC+DC_heat_latent ;

eqT_sfw.. T_sfw =e= T_ra - (T_ra-T_sa)/HTE ;
eqT_rfw.. T_rfw =e= T_sfw+delta_T_water ;
eqT_cw.. T_cw =e= (T_sfw+T_rfw)/2 ;

eqLatent_heat_vaporization.. Latent_heat_vaporization =e= -0.0013*(T_cw)**(2)-2.3097*(T_cw)+2500.5 ;
eqhd_amount.. hd_amount =e= DC_heat_latent/Latent_heat_vaporization ;

eqPower_pump_hd.. Power_pump_hd =e= Pump_Pressure_HD*hd_amount/(1000*Pump_eff_HD*1000) ;

eqcond1.. T_wb_oa + AT_CT + AT_HE - T_sfw =l= M*(1 - cond1);
eqcond2a.. T_wb_oa + AT_CT + AT_HE - T_sfw =g= epsilon - M*(1 - cond2);
eqcond2b.. T_rfw - (T_wb_oa + AT_CT + AT_HE) =g= epsilon - M*(1 - cond2);
eqcond3.. T_wb_oa + AT_CT + AT_HE - T_rfw =g= -M*(1 - cond3);
eqcond.. cond1 + cond2 + cond3 =e= 1;

eqWE_heat_removed.. WE_heat_removed =e= Cond1*Cooling_required + Cond2*Cooling_required*((T_rfw-(T_wb_oa + AT_CT + AT_HE))/(T_rfw-T_sfw)) + Cond3*0;

eqm_sfw.. m_sfw =e= WE_heat_removed/(4.2*delta_T_water) ;
eqPower_pump_WE.. Power_pump_WE =e= Pump_Pressure_WE*m_sfw/(1000*Pump_eff_WE*1000) ;

eqChiller_heat_removed.. Chiller_heat_removed =e= Cooling_required - WE_heat_removed ;
eqCOP_Chiller.. COP_Chiller =e= 16.798751 +  0.008840*(T_wb_oa+AT_CT)**2 - 8.528931*Chiller_load**2 + 9.885294*Chiller_load - 0.760621*(T_wb_oa+AT_CT) + 0.084615*Chiller_load*(T_wb_oa+AT_CT) ;
eqPower_Chiller.. Power_Chiller =e= Chiller_heat_removed/COP_Chiller ;
eqm_sw.. m_sw =e= Chiller_heat_removed/(4.2*(delta_T_water)) ;
eqPower_pump_CW.. Power_pump_CW =e= Pump_Pressure_CW*m_sw/(1000*Pump_eff_CW*1000) ;

eqCT_heat_removed.. CT_heat_removed =e= Cooling_required+Power_Chiller ;
eqm_CT.. m_CT =e= CT_heat_removed/(4.2*(delta_T_CT)) ;
eqPower_pump_CT.. Power_pump_CT =e= Pump_Pressure_CT*m_CT/(1000*Pump_eff_CT*1000) ;
eqPower_fan_CT.. Power_fan_CT =e= m_CT/L_to_G/density_oa*Fan_Pressure_CT/Fan_eff_CT/1000 ;

eqPUE.. PUE =e= (Power_IT + Powerloss_UPS + Powerloss_PD + Power_Lighting + Power_Fan_CRAC + Power_Pump_hd + Power_Pump_WE + Power_Chiller + Power_Pump_CW + Power_Pump_CT + Power_Fan_CT) ;

density_sa.l = 1.3;
Latent_heat_vaporization.l = 2500;
T_rfw.l = 35;
T_sfw.l = 27;
COP_Chiller.l = 8;
density_oa.l = 1.3;

model PUE_test / all /;

loop (i$(ord(i)<= 24),

loop (t$(ord(t)<= 8760),
T_oa = Temperature(i,t);
RH_oa = RH(i,t);
Tdp_oa = DP(i,t);

option minlp = baron;

solve PUE_test using minlp minimizing PUE ;

obj_save(i,t)=PUE.l;

)

);

obj_save(i,t)$(NOT obj_save(i,t)) = zero;
display obj_save;

execute_unload "results2.gdx" obj_save
execute 'gdxxrw.exe results2.gdx o=results2.xlsx var=obj_save.L'


