%euler method simulator
Vmax = 0;
Nlist = [];
VmaxList = [];
 
    deltat=0.2 ; %timestep
    Tmax=10;

    tlist=linspace(0,Tmax,Tmax/deltat +1) ;
    Vlist=zeros(1,length(tlist));

    %initialize
    V0=0;
    Vlist(1)=V0;
    
    N = 1;
    gapplist=zeros(1,length(tlist));

while (Vmax < 10)
    %define input conductance
    %Iapplist=ones(1,length(tlist));
    %Iapplist=sin(tlist);
    gapplist(5:6) = N;


    %circuit parameters
    R=10;
    C=1;
    E=11;

    for n=1:length(tlist)-1
        t=tlist(n);
        Vlist(n+1)=Vlist(n) + ( -Vlist(n)/(R*C) + gapplist(n)*(E-Vlist(n)) )*deltat;
    end

%     figure
%     set(gca,'FontSize',16)
%     subplot(211)
%     plot(tlist,Vlist,'.-','LineWidth',2,'MarkerSize',26); hold on
%     xlabel('V(t)','Fontsize',20); ylabel('V(t)','Fontsize',20); 
%     %legend('Euler Approx')

%     subplot(212)
%     plot(tlist,gapplist,'-','LineWidth',2); hold on
%     xlabel('t','Fontsize',20); ylabel('gapp(t)','Fontsize',20); 
% 

%     %test linearity
%     Vlist1=zeros(1,length(tlist));
%     Vlist2=zeros(1,length(tlist));
%     Vlist=zeros(1,length(tlist));
% 
%     %initialize
%     V0=0;
%     Vlist1(1)=V0;
%     Vlist2(1)=V0;
%     Vlist(1)=V0;
% 
%     %define input conductance
    %gapplist1=ones(1,length(tlist));
    %gapplist2=1+sin(tlist);
    %gapplist=gapplist1+gapplist2;

%     for n=1:length(tlist)-1
%         t=tlist(n);
%     %     Vlist1(n+1)=Vlist1(n) + ( -Vlist1(n)/(R*C) + gapplist1(n)*(E-Vlist1(n)) )*deltat;
%     %     Vlist2(n+1)=Vlist2(n) + ( -Vlist2(n)/(R*C) + gapplist2(n)*(E-Vlist2(n)) )*deltat;
%         Vlist(n+1)=Vlist(n) + ( -Vlist(n)/(R*C) + gapplist(n)*(E-Vlist(n)) )*deltat;
%     end
    Vmax = max(Vlist);
    VmaxList(N) = Vmax;
    N = N+1;
    Nlist(N) = N;
end


set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20); 

figure
plot(Nlist(1:4), VmaxList/10);
xlabel('N');
ylabel('f');
title('f vs. N');

% set(gca,'FontSize',16)
% subplot(311)
% plot(tlist,Vlist,'-','LineWidth',2,'MarkerSize',26); hold on
% plot(tlist,Vlist1,'-','LineWidth',2,'MarkerSize',26); hold on
% plot(tlist,Vlist2,'-','LineWidth',2,'MarkerSize',26); hold on
% xlabel('V(t)','Fontsize',20); ylabel('V(t)','Fontsize',20); 
%legend('Euler Approx')


% set(gca,'FontSize',16)
% subplot(312)
% plot(tlist,Vlist,'.-','LineWidth',2,'MarkerSize',26); hold on
% % plot(tlist,Vlist1+Vlist2,'.-','LineWidth',2,'MarkerSize',26); hold on
% xlabel('V(t)','Fontsize',20); ylabel('V(t)','Fontsize',20); 
% %legend('Euler Approx')
% 
% 
% subplot(313)
% % plot(tlist,gapplist1,'-','LineWidth',2); hold on
% % plot(tlist,gapplist2,'-','LineWidth',2); hold on
% plot(tlist,gapplist,'-','LineWidth',2); hold on
% xlabel('t','Fontsize',20); ylabel('gapp(t)','Fontsize',20); 
