Set
    tproj /t1*t56/              
    tfit(tproj) /t1*t36/
    mp    /1*1/;

Set tpostfit(tproj) /t37*t56/;

Set tpostfit2(tproj) /t37*t40/;

Alias (t, tproj)              


Parameter bigM /1000000/;
Scalar epsilon /1e-4/;

$call gdxxrw.exe AI_global_data_gbm.xlsx par=R_actual rng=sheet1!A1:AK2
*=== Now import data from GDX
Parameter R_actual(mp,tfit);
$gdxin AI_global_data_gbm.gdx
$load R_actual
$gdxIn

Positive Variables 
    z(tproj),          
    z_dot(tproj),     
    chi(tproj),       
    p, q, m, c
    zdot_peak;

Binary Variable is_peak(tproj);

Variables 
    a,               
    b
    obj;

Equations
    Eq_Euler(tproj), 
    Eq_zdot(tproj),   
    Eq_chi(tproj),    
    Eq_obj
    ZdotPeakBind1(tproj)
    ZdotPeakBind2(tproj)
    ZdotOutsideStrict(tproj),
    UniquePeak
    UniquePeak2
    ;


Eq_Euler(tproj)$(ord(tproj) > 1)..
    z(tproj) =e= z(tproj - 1) + z_dot(tproj - 1);

Eq_zdot(tproj)..
    z_dot(tproj) =e= (p + q * z(tproj) / m) * (m - z(tproj)) * chi(tproj);

Eq_chi(tproj)..
    chi(tproj) =e= 1 + c * exp(-b * (ord(tproj) - a));

Eq_obj..
    obj =e=
        sum(tfit, sqr(z_dot(tfit) - R_actual('1',tfit)));


ZdotPeakBind1(tproj)..
    z_dot(tproj) =l= zdot_peak;

ZdotPeakBind2(tproj)..
    z_dot(tproj) =g= zdot_peak - (1 - is_peak(tproj)) * bigM;

ZdotOutsideStrict(tproj)..
    z_dot(tproj) =l= zdot_peak - epsilon + is_peak(tproj) * bigM;

UniquePeak..
    sum(tproj, is_peak(tproj)) =e= 1;
    
UniquePeak2..
    sum(tpostfit2, is_peak(tpostfit2)) =e= 1;
    
z.l(tproj) = 0;
z_dot.l(tproj) = 1;
chi.l(tproj) = 1;

z.fx('t1') = 0;

p.l = 0.03;     p.lo = 0.0001;     p.up = 1;
q.l = 0.38;     q.lo = 0.0001;     q.up = 1;
m.l = 1200;    m.lo = 110;    m.up = 13000;  

a.l = 5;       a.lo = 1;         a.up = 1000;   
b.l = 0.1;      b.lo = -5;        b.up = 5;   
c.l = 1;        c.lo = 0;         c.up = 2;

zdot_peak.lo = 0;


Model PeakModel /all/;

option MINLP = sbb ;

display R_actual ;

Solve PeakModel using MINLP minimizing obj;

Display z.l, z_dot.l, chi.l, a.l, b.l, c.l, p.l, q.l, m.l, zdot_peak.l;