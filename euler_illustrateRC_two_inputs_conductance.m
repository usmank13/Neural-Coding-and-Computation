%euler method simulator
clear all

deltat=0.1 ; %timestep
Tmax=10;

tlist=linspace(0,Tmax,Tmax/deltat +1) ;

%to test linearity, we will solve our system 3 times!
Vlist1=zeros(1,length(tlist));
Vlist2=zeros(1,length(tlist));
Vlist3=zeros(1,length(tlist));


%initialize
V0=0;
Vlist1(1)=V0;
Vlist2(1)=V0;
Vlist3(1)=V0;


%define input CONDUCTANCES

% successive input impulses:  watch them summate NONLINEARLY over time
gapplist1=zeros(1,length(tlist));
    T1=1;
    T2=2;
    gapplist1(find (tlist>T1 & tlist<T2) )=3;    
gapplist2=zeros(1,length(tlist));
    T3=3;
    T4=4;
    gapplist2(find (tlist>T3 & tlist<T4) )=3;    
gapplist3=gapplist1+gapplist2;


%synaptic reversal potential E
E=11;

%circuit parameters
R=10;
C=1;


for n=1:length(tlist)-1
    t=tlist(n);
    Vlist1(n+1)=Vlist1(n) + (-Vlist1(n)/(R*C) + gapplist1(n)*(E-Vlist1(n))/C )*deltat;
    Vlist2(n+1)=Vlist2(n) + (-Vlist2(n)/(R*C) + gapplist2(n)*(E-Vlist2(n))/C )*deltat;
    Vlist3(n+1)=Vlist3(n) + (-Vlist3(n)/(R*C) + gapplist3(n)*(E-Vlist3(n))/C )*deltat;
end

set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20); 

figure
set(gca,'FontSize',16)
subplot(211)
plot(tlist,Vlist1,'.-','LineWidth',2,'MarkerSize',26); hold on
plot(tlist,Vlist2,'.-','LineWidth',2,'MarkerSize',26);
plot(tlist,Vlist3,'.-','LineWidth',2,'MarkerSize',26);
plot(tlist,Vlist1+Vlist2,'o-','LineWidth',2,'MarkerSize',10);
xlabel('t','Fontsize',20); ylabel('V(t)','Fontsize',20); 
legend('V1','V2','V3','V1+V2')

subplot(212)
plot(tlist,gapplist1,'.-','LineWidth',2,'MarkerSize',26); hold on
plot(tlist,gapplist2,'.-','LineWidth',2,'MarkerSize',26);
%plot(tlist,gapplist3,'o-','LineWidth',1,'MarkerSize',26);
xlabel('t','Fontsize',20); ylabel('I(t)','Fontsize',20); 
legend('I1','I2')