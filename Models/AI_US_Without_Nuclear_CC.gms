Sets

t    'number of hours'                      /1*8760/
i    'number of states'                     /1*24/
n    'number of years'                      /1*8/
j    'number of cost development scenarios' /1*3/
u    'index for print'                      /p1*p14/
m    'index for energy distribution'        /1*1/;

$call gdxxrw.exe Srd_AI_US_raw.xlsx par=radiation rng=sheet1!A1:LXY25 
*=== Now import data from GDX
Parameter radiation(i,t);
$gdxin Srd_AI_US_raw.gdx
$load radiation
$gdxin

$call gdxxrw.exe Wsp_AI_US_raw.xlsx par=speed rng=sheet1!A1:LXY25 
*=== Now import data from GDX
Parameter speed(i,t);
$gdxin Wsp_AI_US_raw.gdx
$load speed
$gdxin

$call gdxxrw.exe PUE_AI_US_raw.xlsx par=pu rng=sheet1!A1:LXY25 
*=== Now import data from GDX
Parameter pu(i,t);
$gdxin PUE_AI_US_raw.gdx
$load pu
$gdxin

$call gdxxrw.exe CI_AI_US_raw.xlsx par=ci rng=sheet1!A1:I25
*=== Now import data from GDX
Parameter ci(i,n);
$gdxin CI_AI_US_raw.gdx
$load ci
$gdxin

$call gdxxrw.exe LU_AI_US_raw.xlsx par=lu rng=sheet1!A1:I25
*=== Now import data from GDX
Parameter lu(i,n);
$gdxin LU_AI_US_raw.gdx
$load lu
$gdxin

$call gdxxrw.exe PI_AI_US_raw.xlsx par=pri rng=sheet1!A1:Y2
*=== Now import data from GDX
Parameter pri(m,i);
$gdxin PI_AI_US_raw.gdx
$load pri
$gdxin

$call gdxxrw.exe Solar_capital_cost.xlsx par=costsolar rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costsolar(j,n);
$gdxin Solar_capital_cost.gdx
$load costsolar
$gdxin

$call gdxxrw.exe Solar_operating_cost.xlsx par=opsolar rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opsolar(j,n);
$gdxin Solar_operating_cost.gdx
$load opsolar
$gdxin

$call gdxxrw.exe Wind_capital_cost.xlsx par=costwind rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costwind(j,n);
$gdxin Wind_capital_cost.gdx
$load costwind
$gdxin

$call gdxxrw.exe Wind_operating_cost.xlsx par=opwind rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opwind(j,n);
$gdxin Wind_operating_cost.gdx
$load opwind
$gdxin

$call gdxxrw.exe Battery_capital_cost.xlsx par=costbattery rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costbattery(j,n);
$gdxin Battery_capital_cost.gdx
$load costbattery
$gdxin

$call gdxxrw.exe Battery_operating_cost.xlsx par=opbattery rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opbattery(j,n);
$gdxin Battery_operating_cost.gdx
$load opbattery
$gdxin

$call gdxxrw.exe Interface_capital_cost.xlsx par=costinterface rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costinterface(j,n);
$gdxin Interface_capital_cost.gdx
$load costinterface
$gdxin

$call gdxxrw.exe Interface_operating_cost.xlsx par=opinterface rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opinterface(j,n);
$gdxin Interface_operating_cost.gdx
$load opinterface
$gdxin

$call gdxxrw.exe Cap_ratio.xlsx par=cpratio rng=sheet1!A1:Y2
*=== Now import data from GDX
Parameter cpratio(m,i);
$gdxin Cap_ratio.gdx
$load cpratio
$gdxin

$call gdxxrw.exe Heat_pump_capital_cost.xlsx par=costhp rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costhp(j,n);
$gdxin Heat_pump_capital_cost.gdx
$load costhp
$gdxin

$call gdxxrw.exe DAC_cost.xlsx par=costDAC rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costDAC(j,n);
$gdxin DAC_cost.gdx
$load costDAC
$gdxin

$call gdxxrw.exe LRF_carbon_AI_US_raw.xlsx par=lrfc rng=sheet1!A1:I2
*=== Now import data from GDX
Parameter lrfc(m,n);
$gdxin LRF_carbon_AI_US_raw.gdx
$load lrfc
$gdxin

$call gdxxrw.exe LIF_land_AI_US_raw.xlsx par=lifl rng=sheet1!A1:I2
*=== Now import data from GDX
Parameter lifl(m,n);
$gdxin LIF_land_AI_US_raw.gdx
$load lifl
$gdxin

Acronym zero

Parameter
NY /25/
cap /0.1662/
vcin /2/
vcout /25/
vr /11/
d /0.1/
sbattery /0.571/
sinterface /0.571/
shpump /0.571/
bigM /1000000000/
epsilon /0.001/
dacmax /11400/
df /3.4/
daceff/1.72/
opstorage /0.01075/
optransport /0.00517/
bmax /1000/
cyceff /0.91/
hpmax /1000/
COP /3/
pen /0.049/
lf /0.48415/
lus /19/
luw /99/

ICsolar 
sfoc
ICwind 
wfoc
ICdac
ICbattery
bfoc
ICinterface 
ifoc
IChpump  

radin(t)
wspeed(t)
Pw(t)
PUE(t)
carbon
land
cr
gprice
crd
ldi

TCeq(j,n,i)
Paiceq(j,n,i)
Paiaeq(j,n,i)
Pgrideq(j,n,i)
Psreq(j,n,i)
Pwreq(j,n,i)
emmeq(j,n,i)
nbeq(j,n,i)
capeq(j,n,i)
nbcpeq(j,n,i)
niteq(j,n,i)
Pseq(j,n,i)
Pweq(j,n,i)
Ndeq(j,n,i)
Avemeq(j,n,i);

Binary variable
x1(t)
x2(t)
;

integer variable
nbattery
nhpump
ndac
;

Positive variable

Asolar
ratedcapacity
Pratedwind

Psolar(t)
Pwind(t)
Pgrid(t)
Ptotal(t)
Pai(t)
Pcharge(t)
Pdischarge(t)
Pbattery(t)
Phpump(t)
Pheat(t)
Pdac(t)

bop(t)
hpumpop(t)

emission(t)
emissiontotal

Ctotal
Csolar
Cwind
Cbattery
Cinterface
Chpump
Cdac

capinterface

OPEXtotal
OPEXsolar
OPEXwind
OPEXgrid
OPEXbattery
OPEXPenalty
OPEXinterface
OPEXdac
OPEXtransport
OPEXstorage

SALtotal 
SALsolar 
SALwind
SALbattery
SALinterface
SALhpump
 
Pdemandtotal

Pit(t)

Pgridtotal

Psolartotal
Pwindtotal

Psolarutilized(t)
Pwindutilized(t)
emissionoriginal

Paictotal

Paiatotal

Pclean(t)
Pcleantotal

dacop(t)
carboncap(t)
carbontotal

AvEm
;

Variable
TC
;

Equations
eqPsolar(t)
eqPwind(t)
eqPtotal(t)

eqPsolarutilized(t)
eqPwindutilized(t)

eqPgridtotal
eqPsolartotal
eqPwindtotal

eqPbalance(t)

eqPheat(t)
eqPhpump(t)
eqhpumpop(t)
eqPhrelation(t)

eqbop(t)

eqSOC(t)
eqPbattery(t)

eqPci(t)
eqPdi(t)

eqPai(t)
eqPit(t)

eqCsolar
eqCwind
eqCbattery
eqCinterface
eqCdac
eqChpump
eqCtotal

eqrated
eqOPEXsolar
eqOPEXwind
eqOPEXgrid
eqOPEXbattery
eqOPEXPenalty
eqOPEXinterface
eqOPEXdac
eqOPEXtransport
eqOPEXstorage
eqOPEXtotal

eqSALtotal
eqSALbattery
eqSALinterface
eqSALhpump

eqTC

eqPdemandtotal

eqcarboncaptured(t)
eqcarbontotal
eqdacmax(t)

eqemission(t)
eqemissiontotal

eqemissionoriginal

eqPaictotal
eqPaiatotal
eqPclean(t)
eqPcleantotal

eqRenewablePenetration

eqbinary(t)
eqdischargelimit1(t)
eqchargelimit1(t)

eqdischargelimit2(t)
eqchargelimit2(t)

eqlandconstraint

eqAvEm
;

eqPsolar(t).. Psolar(t) =e= cap*Asolar*radin(t)/1000 ;
eqPwind(t).. Pwind(t) =e= Pratedwind*Pw(t) ;
eqPtotal(t).. Ptotal(t) =e= Psolarutilized(t)+Pwindutilized(t)+Pgrid(t)+Pdischarge(t)*cyceff;

eqPsolarutilized(t).. Psolarutilized(t) =l= Psolar(t) ; 
eqPwindutilized(t).. Pwindutilized(t) =l= Pwind(t) ; 

eqPgridtotal.. Pgridtotal =e= sum(t,Pgrid(t));
eqPsolartotal.. Psolartotal =e= sum(t,Psolarutilized(t)); 
eqPwindtotal.. Pwindtotal =e= sum(t,Pwindutilized(t));  

eqPbalance(t).. Ptotal(t) =e= Pai(t)+Pcharge(t)*cyceff+Pdac(t)+Phpump(t) ;

eqPheat(t).. Pheat(t) =e= Phpump(t)*COP ;
eqPhpump(t).. Phpump(t) =l= hpumpop(t)*hpmax;
eqhpumpop(t).. hpumpop(t) =l= nhpump ;
eqPhrelation(t).. Pheat(t) =e= Pdac(t)*df ;

eqbop(t).. bop(t) =l= nbattery ; 

eqSOC(t).. Pbattery(t) =e= (ord(t) = 1) * 0 + (ord(t) > 1) * (Pbattery(t-1) + Pcharge(t-1)*cyceff - Pdischarge(t-1)*cyceff);
eqPbattery(t).. Pbattery(t) =l= nbattery*bmax ;

eqPci(t).. Pcharge(t) =l= capinterface*1000 ;
eqPdi(t).. Pdischarge(t) =l= capinterface*1000 ;

eqPai(t).. Pai(t) =e= Pit(t)*PUE(t);
eqPit(t).. Pit(t) =e= 100*1000*lf ;

eqCsolar.. Csolar =e= Asolar*ICsolar ;
eqCwind.. Cwind =e= Pratedwind*ICwind ; 
eqCbattery.. Cbattery =e= nbattery*ICbattery*2*1000 ;
eqCinterface.. Cinterface =e= capinterface*ICinterface*2*1000 ;
eqCdac.. Cdac =e= carbontotal*NY*ICdac ;
eqChpump.. Chpump =e= nhpump*IChpump*2 ;
eqCtotal.. Ctotal =e= Csolar+Cwind+Cbattery+Cinterface+Cdac+Chpump ;

eqrated.. ratedcapacity =e= sum(t,Psolar(t))/1000000/cr ;
eqOPEXsolar.. OPEXsolar =e= sfoc*ratedcapacity*NY ;
eqOPEXwind.. OPEXwind =e= wfoc*Pratedwind*NY ;
eqOPEXgrid.. OPEXgrid =e= sum(t,Pgrid(t))*gprice*NY ;
eqOPEXbattery.. OPEXbattery =e= bfoc*nbattery*NY ;
eqOPEXPenalty.. OPEXPenalty =e= sum(t,emission(t))*pen*NY*0 ;
eqOPEXinterface.. OPEXinterface =e= capinterface*ifoc*NY ;
eqOPEXdac.. OPEXdac =e= 0.04*Cdac*NY ;
eqOPEXtransport.. OPEXtransport =e= optransport*carbontotal*NY ;
eqOPEXstorage.. OPEXstorage =e= opstorage*carbontotal*NY ;
eqOPEXtotal.. OPEXtotal =e= OPEXsolar+OPEXwind+OPEXgrid+OPEXbattery+OPEXPenalty+OPEXinterface+OPEXdac+OPEXtransport+OPEXstorage ;

eqSALtotal.. SALtotal =e= (SALbattery+SALinterface+SALhpump)/((1+d)**NY) ;
eqSALbattery.. SALbattery =e= nbattery*ICbattery*sbattery ; 
eqSALinterface.. SALinterface =e= capinterface*ICinterface*sinterface ;
eqSALhpump.. SALhpump =e= nhpump*IChpump*shpump ;

eqTC.. TC =e= Ctotal+((OPEXtotal)/(NY*d)*(1-1/((1+d)**NY))-SALtotal) ;

eqPdemandtotal.. Pdemandtotal =e= sum(t,Ptotal(t)) ;

eqcarboncaptured(t).. carboncap(t) =e= Pdac(t)*daceff ;
eqcarbontotal.. carbontotal =e= sum(t,carboncap(t));
eqdacmax(t).. carboncap(t) =l= ndac*dacmax ;

eqemission(t).. emission(t) =e= Pgrid(t)*carbon;
eqemissiontotal.. emissiontotal =e= sum(t,emission(t))-carbontotal ;

eqemissionoriginal.. emissionoriginal =e= sum(t,Pai(t))*carbon ; 

eqPaictotal.. Paictotal =e= sum(t,Pai(t))/(d)*(1-1/((1+d)**NY)) ;
eqPaiatotal.. Paiatotal =e= sum(t,Pai(t)) ;

eqPclean(t).. Pclean(t) =e= Ptotal(t)-Pgrid(t) ; 
eqPcleantotal.. Pcleantotal =e= sum(t,Pclean(t)) ;

eqRenewablePenetration.. emissiontotal =e= crd*emissionoriginal ;

eqbinary(t).. x1(t)+x2(t) =l= 1 ;
eqdischargelimit1(t).. Pdischarge(t) =l= bigM*x1(t) ;
eqchargelimit1(t).. Pcharge(t) =l= bigM*x2(t) ;

eqdischargelimit2(t).. Pdischarge(t) =l= nbattery*bmax ;
eqchargelimit2(t).. Pcharge(t) =l= nbattery*bmax ;

eqlandconstraint.. Pgridtotal*land+Psolartotal*lus+Pwindtotal*luw =l= Paiatotal*land*ldi ;

eqAvEm.. AvEm =e= emissionoriginal - emissiontotal ;

model AI_global_RP_50 / all /;

loop (j$(ord(j)= 2),

loop (n$(ord(n)<= 8),

ICsolar = costsolar(j,n);
sfoc = opsolar(j,n);
ICwind = costwind(j,n);
wfoc = opwind(j,n);
ICdac = costDAC(j,n);
IChpump = costhp(j,n);
ICbattery =costbattery(j,n);
bfoc = opbattery(j,n);
ICinterface =costinterface(j,n);
ifoc =opinterface(j,n);

loop (i$(ord(i)<= 24),

radin(t) = radiation(i,t) ;
wspeed(t) = speed(i,t) ;
carbon = ci(i,n);
land = lu(i,n);
PUE(t) = pu(i,t);

Pw(t)$(wspeed(t) gt vcin and wspeed(t) le vr) = 1000*(wspeed(t)- vcin)/(vr-vcin);
Pw(t)$(wspeed(t) le vcin)=0;
Pw(t)$(wspeed(t) gt vr and wspeed(t) le vcout)= 1000;
Pw(t)$(wspeed(t) gt vcout)= 0;

loop (m$(ord(m)<= 1),
cr = cpratio(m,i);
gprice = pri(m,i);
crd = lrfc(m,n);
ldi = lifl(m,n);
)

solve AI_global_RP_50 using mip minimizing TC ;

TCeq(j,n,i)=TC.l;
Paiceq(j,n,i)=Paictotal.l;
Paiaeq(j,n,i)=Paiatotal.l;
Pgrideq(j,n,i)=Pgridtotal.l;
Psreq(j,n,i)=ratedcapacity.l;
Pwreq(j,n,i)=Pratedwind.l;
emmeq(j,n,i)=nhpump.l;
nbeq(j,n,i)=nbattery.l;
capeq(j,n,i)=capinterface.l;
nbcpeq(j,n,i)=Cbattery.l;
niteq(j,n,i)=Cinterface.l;
Pseq(j,n,i)=Psolartotal.l;
Pweq(j,n,i)=Pwindtotal.l;
Ndeq(j,n,i)=ndac.l;
Avemeq(j,n,i)=AvEm.l;

)
)
);

TCeq(j,n,i)$(NOT TCeq(j,n,i)) = zero;
Paiceq(j,n,i)$(NOT Paiceq(j,n,i)) = zero;
Paiaeq(j,n,i)$(NOT Paiaeq(j,n,i)) = zero;
Pgrideq(j,n,i)$(NOT Pgrideq(j,n,i)) = zero;
Psreq(j,n,i)$(NOT Psreq(j,n,i)) = zero;
Pwreq(j,n,i)$(NOT Pwreq(j,n,i)) = zero;
emmeq(j,n,i)$(NOT emmeq(j,n,i)) = zero;
nbeq(j,n,i)$(NOT nbeq(j,n,i)) = zero;
capeq(j,n,i)$(NOT capeq(j,n,i)) = zero;
nbcpeq(j,n,i)$(NOT nbcpeq(j,n,i)) = zero;
niteq(j,n,i)$(NOT niteq(j,n,i)) = zero;
Pseq(j,n,i)$(NOT Pseq(j,n,i)) = zero;
Pweq(j,n,i)$(NOT Pweq(j,n,i)) = zero;
Ndeq(j,n,i)$(NOT Ndeq(j,n,i)) = zero;
Avemeq(j,n,i)$(NOT Avemeq(j,n,i)) = zero;

display TCeq;
display Paiceq;
display Paiaeq;
display Pgrideq;
display Psreq;
display Pwreq;
display emmeq;
display nbeq;
display capeq;
display nbcpeq;
display niteq;
display Pseq;
display Pweq;
display Ndeq;
display Avemeq;


