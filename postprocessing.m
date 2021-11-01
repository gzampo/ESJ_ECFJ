clear all 
close all
% C1 configuration m=+infty
chanEQL=load('./C2resultsDirEps002/uvpcEQ.dat');
chanEQR=load('./C2resultsDirEps002/u2v2p2c2EQ.dat');
chanDNS=load('./C2resultsDirEps002/uvpcDNS.dat');
%chanNoStr=load('./C1results/uvpcNoStruct.dat');
cx_chanEQL=reshape(chanEQL(:,6),101,101);
cx_chanEQR=reshape(chanEQR(:,6),101,101);
cx_chanDNS=reshape(chanDNS(:,6),101,101);
%cx_chanNoStr=reshape(chanNoStr(:,6),101,101);


cx1_chanEQL=reshape(chanEQL(:,8),101,101);
cx1_chanEQR=reshape(chanEQR(:,9),101,101);

c_chanEQL=reshape(chanEQL(:,5),101,101);
c_chanEQR=reshape(chanEQR(:,5),101,101);
c_chanDNS=reshape(chanDNS(:,5),101,101);
%c_chanNoStr=reshape(chanNoStr(:,5),101,101);

cx_chanEQL(isnan(cx_chanEQL))=0;
cx_chanEQR(isnan(cx_chanEQR))=0;
cx1_chanEQL(isnan(cx1_chanEQL))=0;
cx1_chanEQR(isnan(cx1_chanEQR))=0;
c_chanEQL(isnan(c_chanEQL))=0;
c_chanEQR(isnan(c_chanEQR))=0;


figure(1);
% figure;
% hold on
% contourf(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanDNS',10,'LineStyle','none');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',10,'r','LineWidth',1.1,'ShowText','on');
% colorbar;
% set(gca,'FontSize',18)
c_cDNL=c_chanDNS(1:51,1:101);
c_cDNR=c_chanDNS(51:101,1:101);

ax1=axes;
[C1,h1] =  contourf(linspace(-1,0.5,51),linspace(-1.5,1.5,101),c_cDNL',[linspace(0,0.9,10),linspace(0.93,1,3)],'LineStyle','none');
 caxis([0,1])
hc(1)=colorbar; 
set(gca,'FontSize',24)
hold on;
axis equal

ax2=axes;
[C2,h2] = contourf(linspace(0.5,2,51),linspace(-1.5,1.5,101),c_cDNR',[linspace(0,0.9,10),linspace(0.93,1,3)],'LineStyle','none');
 caxis([0,1])
hold off;
 
linkaxes([ax1,ax2])
%move x- and y-axis of axes2
set(ax2, 'XAxisLocation','top',...
             'YAxisLocation','right',...
             'Color','none');    
         ax2.Visible = 'off';
         axis equal;
hc(2)=colorbar;
%reduce axes position to make room for the second colorbar
pos=get(ax1,'Position');
 set([ax1,ax2],'Position',[pos(1) pos(2) 0.9*pos(3) pos(4)]);
cpos=get(hc(1),'position');
%move the second colorbar to the right
set(hc(2),'position',[cpos(1) cpos(2:4)]);
set(hc(1),'position',[cpos(1)+0.15 cpos(2:4)]);
colormap(ax1,'parula')
%cmapg=gray(90);
%colormap(ax2,cmapg(3 :3:end,:))
colormap(ax2,'parula')
 set(gca,'FontSize',24)
 axis([-1 2 -1.5 1.5])
 hold on
%%% uncomment to plot comparison in all field
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.21,0.5,9),'r','LineWidth',1.1,'ShowText','on');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.198,0.205,25),'r','LineWidth',1.1,'ShowText','on');
%  
%  for i=1:10
%  xcoord=[-0.015 0.015];
%  ycoordmin=[-0.015 -0.015];
%  ycoordmax=[0.015 0.015];
%  %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
%  fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.1*i,'w','LineWidth',0.1)
%  end
%  %fig = gcf;
%  %fig.PaperUnits = 'inches';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 cEQ=c_chanEQL+c_chanEQR;
 cEQvis= cEQ(:,51:101);
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',[linspace(0,0.9,10),linspace(0.93,1,3)],'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',[linspace(0,0.9,10),linspace(0.93,1,3)],'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 
 for i=1:50
 xcoord=[-0.02*0.3/2 0.02*0.3/2];
 ycoordmin=[-0.02*0.3/2 -0.02*0.3/2];
 ycoordmax=[0.02*0.3/2 0.02*0.3/2];
 %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
 fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.02*i,'w','LineWidth',0.1)
 end
 fieldsx=reshape(chanDNS(:,3),101,101);
 fieldsy=reshape(chanDNS(:,4),101,101);

U=fieldsx(:,1:50);
V=fieldsy(:,1:50);
[X,Y]=meshgrid(linspace(-1,2,101),linspace(-1.5,0,50));
stlout1=streamline(X,Y,U',V',0*ones(1,15),linspace(-1.5,-0.5,15));
%quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end),U(1:5:end,1:5:end)',V(1:5:end,1:5:end)',5,'k')
stlout2=streamline(X,Y,-U',-V',0*ones(1,15),linspace(-1.5,-0.5,15));
%stlout3=streamline(X,Y,U',V',5*ones(1,20),linspace(-0.0001,-3,20));
%stlout4=streamline(X,Y,-U',-V',5*ones(1,20),linspace(-0.0001,-3,20));
set(stlout1,'LineWidth',2,'Color','k');
set(stlout2,'LineWidth',2,'Color','k');
%set(stlout3,'LineWidth',2,'Color','r');
%set(stlout4,'LineWidth',2,'Color','r');
 %fig = gcf;
 %fig.PaperUnits = 'inches';
 plot([-1 , 2],[0 , 0],'k--','LineWidth',3)
      xlabel('$x_1$','interpreter', 'latex', 'fontsize', 24);
ylabel('$x_3$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
print -painters -depsc ../comparisonC1Dir.eps






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

% C1 configuration m=0
chanEQL=load('./C2resultsEps002/uvpcEQ.dat');
chanEQR=load('./C2resultsEps002/u2v2p2c2EQ.dat');
chanDNS=load('./C2resultsEps002/uvpcDNS.dat');
%chanNoStr=load('./C1results/uvpcNoStruct.dat');
cx_chanEQL=reshape(chanEQL(:,6),101,101);
cx_chanEQR=reshape(chanEQR(:,6),101,101);
cx_chanDNS=reshape(chanDNS(:,6),101,101);
%cx_chanNoStr=reshape(chanNoStr(:,6),101,101);


cx1_chanEQL=reshape(chanEQL(:,8),101,101);
cx1_chanEQR=reshape(chanEQR(:,9),101,101);

c_chanEQL=reshape(chanEQL(:,5),101,101);
c_chanEQR=reshape(chanEQR(:,5),101,101);
c_chanDNS=reshape(chanDNS(:,5),101,101);
%c_chanNoStr=reshape(chanNoStr(:,5),101,101);

cx_chanEQL(isnan(cx_chanEQL))=0;
cx_chanEQR(isnan(cx_chanEQR))=0;
cx1_chanEQL(isnan(cx1_chanEQL))=0;
cx1_chanEQR(isnan(cx1_chanEQR))=0;
c_chanEQL(isnan(c_chanEQL))=0;
c_chanEQR(isnan(c_chanEQR))=0;

figure(3);
% figure;
% hold on
% contourf(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanDNS',10,'LineStyle','none');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',10,'r','LineWidth',1.1,'ShowText','on');
% colorbar;
% set(gca,'FontSize',18)
c_cDNL=c_chanDNS(1:51,1:101);
c_cDNR=c_chanDNS(51:101,1:101);

ax1=axes;
[C1,h1] =  contourf(linspace(-1,0.5,51),linspace(-1.5,1.5,101),c_cDNL',[linspace(0,0.9,10),linspace(0.93,1,3)],'LineStyle','none');
 caxis([0,1])
hc(1)=colorbar; 
set(gca,'FontSize',24)
hold on;
axis equal

ax2=axes;
[C2,h2] = contourf(linspace(0.5,2,51),linspace(-1.5,1.5,101),c_cDNR',[linspace(0,0.9,10),linspace(0.93,1,3)],'LineStyle','none');
 caxis([0,1])
hold off;
 
linkaxes([ax1,ax2])
%move x- and y-axis of axes2
set(ax2, 'XAxisLocation','top',...
             'YAxisLocation','right',...
             'Color','none');    
         ax2.Visible = 'off';
         axis equal;
hc(2)=colorbar;
%reduce axes position to make room for the second colorbar
pos=get(ax1,'Position');
 set([ax1,ax2],'Position',[pos(1) pos(2) 0.9*pos(3) pos(4)]);
cpos=get(hc(1),'position');
%move the second colorbar to the right
set(hc(2),'position',[cpos(1) cpos(2:4)]);
set(hc(1),'position',[cpos(1)+0.15 cpos(2:4)]);
colormap(ax1,'parula')
%cmapg=gray(90);
%colormap(ax2,cmapg(3 :3:end,:))
colormap(ax2,'parula')
 set(gca,'FontSize',24)
 axis([-1 2 -1.5 1.5])
 hold on
%%% uncomment to plot comparison in all field
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.21,0.5,9),'r','LineWidth',1.1,'ShowText','on');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.198,0.205,25),'r','LineWidth',1.1,'ShowText','on');
%  
%  for i=1:10
%  xcoord=[-0.015 0.015];
%  ycoordmin=[-0.015 -0.015];
%  ycoordmax=[0.015 0.015];
%  %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
%  fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.1*i,'w','LineWidth',0.1)
%  end
%  %fig = gcf;
%  %fig.PaperUnits = 'inches';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 cEQ=c_chanEQL+c_chanEQR;
 cEQvis= cEQ(:,51:101);
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',[linspace(0,0.9,10),linspace(0.93,1,3)],'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',[linspace(0,0.9,10),linspace(0.93,1,3)],'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 
 for i=1:50
 xcoord=[-0.02*0.3/2 0.02*0.3/2];
 ycoordmin=[-0.02*0.3/2 -0.02*0.3/2];
 ycoordmax=[0.02*0.3/2 0.02*0.3/2];
 %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
 fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.02*i,'w','LineWidth',0.1)
 end
 fieldsx=reshape(chanDNS(:,3),101,101);
 fieldsy=reshape(chanDNS(:,4),101,101);

U=fieldsx(:,1:50);
V=fieldsy(:,1:50);
[X,Y]=meshgrid(linspace(-1,2,101),linspace(-1.5,0,50));
stlout1=streamline(X,Y,U',V',0*ones(1,15),linspace(-1.5,-0.5,15));
%quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end),U(1:5:end,1:5:end)',V(1:5:end,1:5:end)',5,'k')
stlout2=streamline(X,Y,-U',-V',0*ones(1,15),linspace(-1.5,-0.5,15));
%stlout3=streamline(X,Y,U',V',5*ones(1,20),linspace(-0.0001,-3,20));
%stlout4=streamline(X,Y,-U',-V',5*ones(1,20),linspace(-0.0001,-3,20));
set(stlout1,'LineWidth',2,'Color','k');
set(stlout2,'LineWidth',2,'Color','k');
%set(stlout3,'LineWidth',2,'Color','r');
%set(stlout4,'LineWidth',2,'Color','r');
 %fig = gcf;
 %fig.PaperUnits = 'inches';
 plot([-1 , 2],[0 , 0],'k--','LineWidth',3)
      xlabel('$x_1$','interpreter', 'latex', 'fontsize', 24);
ylabel('$x_3$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
print -painters -depsc ../comparisonC1Neu.eps


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

% C1 configuration m=-infty
chanEQL=load('./C2MembAds/uvpcEQ.dat');
chanEQR=load('./C2MembAds/u2v2p2c2EQ.dat');
chanDNS=load('./C2MembAds/uvpcDNS.dat');
%chanNoStr=load('./C1results/uvpcNoStruct.dat');
cx_chanEQL=reshape(chanEQL(:,6),101,101);
cx_chanEQR=reshape(chanEQR(:,6),101,101);
cx_chanDNS=reshape(chanDNS(:,6),101,101);
%cx_chanNoStr=reshape(chanNoStr(:,6),101,101);


cx1_chanEQL=reshape(chanEQL(:,8),101,101);
cx1_chanEQR=reshape(chanEQR(:,9),101,101);

c_chanEQL=reshape(chanEQL(:,5),101,101);
c_chanEQR=reshape(chanEQR(:,5),101,101);
c_chanDNS=reshape(chanDNS(:,5),101,101);
%c_chanNoStr=reshape(chanNoStr(:,5),101,101);

cx_chanEQL(isnan(cx_chanEQL))=0;
cx_chanEQR(isnan(cx_chanEQR))=0;
cx1_chanEQL(isnan(cx1_chanEQL))=0;
cx1_chanEQR(isnan(cx1_chanEQR))=0;
c_chanEQL(isnan(c_chanEQL))=0;
c_chanEQR(isnan(c_chanEQR))=0;


% figure;
% hold on
% contourf(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanDNS',10,'LineStyle','none');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',10,'r','LineWidth',1.1,'ShowText','on');
% colorbar;
% set(gca,'FontSize',18)
c_cDNL=c_chanDNS(1:51,1:101);
c_cDNR=c_chanDNS(51:101,1:101);
figure(4);
ax1=axes;
[C1,h1] =  contourf(linspace(-1,0.5,51),linspace(-1.5,1.5,101),c_cDNL',linspace(0,1,11),'LineStyle','none');
 caxis([0,1])
hc(1)=colorbar; 
set(gca,'FontSize',24)
hold on;
axis equal

ax2=axes;
[C2,h2] = contourf(linspace(0.5,2,51),linspace(-1.5,1.5,101),c_cDNR',linspace(0,1,11),'LineStyle','none');
 caxis([0,1])
hold off;
 
linkaxes([ax1,ax2])
%move x- and y-axis of axes2
set(ax2, 'XAxisLocation','top',...
             'YAxisLocation','right',...
             'Color','none');    
         ax2.Visible = 'off';
         axis equal;
hc(2)=colorbar;
%reduce axes position to make room for the second colorbar
pos=get(ax1,'Position');
 set([ax1,ax2],'Position',[pos(1) pos(2) 0.9*pos(3) pos(4)]);
cpos=get(hc(1),'position');
%move the second colorbar to the right
set(hc(2),'position',[cpos(1) cpos(2:4)]);
set(hc(1),'position',[cpos(1)+0.15 cpos(2:4)]);
colormap(ax1,'parula')
%cmapg=gray(90);
%colormap(ax2,cmapg(3 :3:end,:));
colormap(ax2,'parula')
 set(gca,'FontSize',24)
 axis([-1 2 -1.5 1.5])
 hold on
%%% uncomment to plot comparison in all field
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.21,0.5,9),'r','LineWidth',1.1,'ShowText','on');
% contour(linspace(-0.5,0.5,101),linspace(-0.5,0.5,101),c_chanEQL'+c_chanEQR',linspace(0.198,0.205,25),'r','LineWidth',1.1,'ShowText','on');
%  
%  for i=1:10
%  xcoord=[-0.015 0.015];
%  ycoordmin=[-0.015 -0.015];
%  ycoordmax=[0.015 0.015];
%  %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
%  fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.1*i,'w','LineWidth',0.1)
%  end
%  %fig = gcf;
%  %fig.PaperUnits = 'inches';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 cEQ=c_chanEQL+c_chanEQR;
 cEQvis= cEQ(:,51:101);
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',linspace(0,1,11),'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 contour(linspace(-1,2,101),linspace(0,1.5,51),cEQvis',linspace(0,1,11),'Color',[0.8,0,0],'LineWidth',2,'ShowText','off');
 
for i=1:50
 xcoord=[-0.02*0.3/2 0.02*0.3/2];
 ycoordmin=[-0.02*0.3/2 -0.02*0.3/2];
 ycoordmax=[0.02*0.3/2 0.02*0.3/2];
 %plot([xcoord fliplr(xcoord)],[ycoordmin ycoordmax],'k','LineWidth',2)
 fill([xcoord fliplr(xcoord)],[ycoordmin ycoordmax]+0.55 -0.02*i,'w','LineWidth',0.1)
 end
 fieldsx=reshape(chanDNS(:,3),101,101);
 fieldsy=reshape(chanDNS(:,4),101,101);

U=fieldsx(:,1:50);
V=fieldsy(:,1:50);
[X,Y]=meshgrid(linspace(-1,2,101),linspace(-1.5,0,50));
stlout1=streamline(X,Y,U',V',0*ones(1,15),linspace(-1.5,-0.5,15));
%quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end),U(1:5:end,1:5:end)',V(1:5:end,1:5:end)',5,'k')
stlout2=streamline(X,Y,-U',-V',0*ones(1,15),linspace(-1.5,-0.5,15));
%stlout3=streamline(X,Y,U',V',5*ones(1,20),linspace(-0.0001,-3,20));
%stlout4=streamline(X,Y,-U',-V',5*ones(1,20),linspace(-0.0001,-3,20));
set(stlout1,'LineWidth',2,'Color','k');
set(stlout2,'LineWidth',2,'Color','k');
%set(stlout3,'LineWidth',2,'Color','r');
%set(stlout4,'LineWidth',2,'Color','r');
 %fig = gcf;
 %fig.PaperUnits = 'inches';
 plot([-1 , 2],[0 , 0],'k--','LineWidth',3)
      xlabel('$x_1$','interpreter', 'latex', 'fontsize', 24);
ylabel('$x_3$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
print -painters -depsc ../comparisonC1Rob.eps




%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% on COrt m=+inf

 centChanDnsL=load('./C2resultsDirEps002/uvpcEQcenter.dat');
 centChanDnsR=load('./C2resultsDirEps002/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2resultsDirEps002/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(2);
 plot(centChanDnsL(:,1),centChanDnsL(:,5),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,5),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,5),'k:','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
%   fig = gcf;
%  fig.PaperUnits = 'inches';
%  %fig.PaperPosition = [0 0 20 20];
%   print -painters -depsc ./figConc/Concenter.eps


%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%% on COrt m=-inf

 centChanDnsL=load('./C2resultsEps002/uvpcEQcenter.dat');
 centChanDnsR=load('./C2resultsEps002/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2resultsEps002/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(2);
 plot(centChanDnsL(:,1),centChanDnsL(:,5),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,5),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,5),'k','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
%   fig = gcf;
%  fig.PaperUnits = 'inches';
%  %fig.PaperPosition = [0 0 20 20];
%   print -painters -depsc ./figConc/Concenter.eps


%%%%%%%%%%%%%%%%%%%%%%%%%%%% on COrt m=-0

 centChanDnsL=load('./C2MembAds/uvpcEQcenter.dat');
 centChanDnsR=load('./C2MembAds/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2MembAds/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(2);
 plot(centChanDnsL(:,1),centChanDnsL(:,5),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,5),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,5),'k-.','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
   fig = gcf;
  fig.PaperUnits = 'inches';
  %fig.PaperPosition = [0 0 20 20];
    xlabel('$x_1$','interpreter', 'latex', 'fontsize', 24);
ylabel('$c$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
   print -painters -depsc ../CCOrt.eps
   
   %%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% on CxOrt m=+inf

 centChanDnsL=load('./C2resultsDirEps002/uvpcEQcenter.dat');
 centChanDnsR=load('./C2resultsDirEps002/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2resultsDirEps002/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(12);
 plot(centChanDnsL(:,1),centChanDnsL(:,6),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,6),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,6),'k:','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
%   fig = gcf;
%  fig.PaperUnits = 'inches';
%  %fig.PaperPosition = [0 0 20 20];
%   print -painters -depsc ./figConc/Concenter.eps


%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%% on CxOrt m=-inf

 centChanDnsL=load('./C2resultsEps002/uvpcEQcenter.dat');
 centChanDnsR=load('./C2resultsEps002/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2resultsEps002/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(12);
 plot(centChanDnsL(:,1),centChanDnsL(:,10),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,10),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,6),'k','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
%   fig = gcf;
%  fig.PaperUnits = 'inches';
%  %fig.PaperPosition = [0 0 20 20];
%   print -painters -depsc ./figConc/Concenter.eps


%%%%%%%%%%%%%%%%%%%%%%%%%%%% on CxOrt m=-0

 centChanDnsL=load('./C2MembAds/uvpcEQcenter.dat');
 centChanDnsR=load('./C2MembAds/u2v2p2c2EQcenter.dat');
 centChanMacro=load('./C2MembAds/uvpcDNScenter.dat');
  %centChanMacronostruct=load('./C1results/uvpcNoStructcenter.dat');
 figure(12);
 plot(centChanDnsL(:,1),centChanDnsL(:,6),'Color',[0.8 0 0],'LineWidth',4);
 hold on
  %plot(centChanDnsL(:,1),centChanDnsL(:,7),'b--','LineWidth',3);
 plot(centChanDnsR(:,1),centChanDnsR(:,6),'Color',[0.8 0 0],'LineWidth',4);
  %plot(centChanDnsR(:,1),centChanDnsR(:,8),'b--','LineWidth',3);
 plot(centChanMacro(:,1),centChanMacro(:,6),'k-.','LineWidth',2);
  %plot(centChanMacronostruct(:,1),centChanMacronostruct(:,5),'g','LineWidth',2);
 grid on
 set(gca,'FontSize',24);
 %title('c on channel centerline')
   fig = gcf;
  fig.PaperUnits = 'inches';
  %fig.PaperPosition = [0 0 20 20];
  xlabel('$x_1$','interpreter', 'latex', 'fontsize', 24);
ylabel('$\partial_1c$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
  %set(gca,'YScale','log')
   print -painters -depsc ../CxCOrt.eps

   
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%% on C .  m=-infty
 clear all
velocityDns=load('./C2resultsEps002/uvpcDNSOnC.dat');
velocityMacro=load('./C2resultsEps002/uvpcEQOnC.dat');
%velocityNoStruct=load('./C1results/uvpcNoStructOnC.dat');
%plot for c
figure(31);


grid on;
hold on 
 
velocityDns(isnan(velocityDns))=0;
dx=velocityDns(100,2)-velocityDns(99,2);
 eps= 0.02;
 theta=0.5;
 %for i=1:11
 %vMeanDNS(i)=sum(velocityDns(121+160*(i-1)+1:121+160*i,2))*dx/eps;
 %end
 for i=1:1:50
 vxMeanDNS(i)=sum((velocityDns(1+9999+199*(i-1):9999+199*i,5)))*dx/(theta*eps);
 xvMeanDNS(i)=mean(velocityDns(1+9999+199*(i-1):9999+199*i,2));
 end
 plot(xvMeanDNS(1:end)+0.5,vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)

plot(velocityMacro(:,2)+0.5,velocityMacro(:,5),'Color',[0.8 0 0],'LineWidth',4);
velocityDns(find(velocityDns==0))=nan;
plot(velocityDns(:,2)+0.5,(velocityDns(:,5)),'k:','LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
%title('c on membrane')
 fig = gcf;
 fig.PaperUnits = 'inches';
 %fig.PaperPosition = [0 0 20 20];
  %print -painters -depsc ./figConc/ConC.eps
   %%%%%%% COMPARISON C0 C1   


%%%%%%DIFFERENCES EVALUATION
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
%plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
c0i=interp1(velocityMacro(:,2),velocityMacro(:,5),xvMeanDNS(1:end));
c1i=interp1(velocityMacro(:,2),velocityMacro(:,8),xvMeanDNS(1:end));
errPercentC0=(c0i-vxMeanDNS(1:end))./((c0i+vxMeanDNS(1:end))/2);
errPercentC1=(c1i-vxMeanDNS(1:end))./((c1i+vxMeanDNS(1:end))/2);
figure(203);
hold on 
plot(xvMeanDNS(1:end),errPercentC0,'-p','Color',[0.8 0 0],'LineWidth',2);
plot(xvMeanDNS(1:end),errPercentC1,'-s','Color',[0.8 0 0],'LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);

figure(103);
hold on 
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
plot(xvMeanDNS(2:end-1),[c0i(2:end/2),fliplr(c0i(2:end/2))],'Color',[0.8 0 0],'LineWidth',2);
plot(xvMeanDNS(2:end-1),[c1i(2:end/2),fliplr(c1i(2:end/2))],'-.','Color',[0.8 0 0],'LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
legend({'exact solution','$\mathcal{O}(\epsilon)$','$\mathcal{O}(\epsilon^2)$'},'interpreter','latex','FontSize',24);
grid on;
figure(103);
axis([-1 0 0.987 0.988])
 print -painters -depsc ../ConCComparisonNeu.eps
%axes1 = axes('Parent',figure);
%set(axes1,'FontSize',24,'TickLabelInterpreter','latex');

%keyboard
  
%%%%%%%%%%%%%%%  %%%%%% on C .  m=+inf
 clear all
velocityDns=load('./C2resultsDirEps002/uvpcDNSOnC.dat');
velocityMacro=load('./C2resultsDirEps002/uvpcEQonC.dat');
%velocityNoStruct=load('./C1resultsDir/uvpcNoStructOnC.dat');
%plot for c
figure(31);
hold on 

grid on;
hold on 
 
velocityDns(isnan(velocityDns))=0;
dx=velocityDns(100,2)-velocityDns(99,2);
 eps= 0.02;
 theta=0.5;
 %for i=1:11
 %vMeanDNS(i)=sum(velocityDns(121+160*(i-1)+1:121+160*i,2))*dx/eps;
 %end
 for i=1:1:50
 vxMeanDNS(i)=sum((velocityDns(1+9999+199*(i-1):9999+199*i,5)))*dx/(theta*eps);
 xvMeanDNS(i)=mean(velocityDns(1+9999+199*(i-1):9999+199*i,2));
 end
 plot(xvMeanDNS(1:end)+0.5,vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)

plot(velocityMacro(:,2)+0.5,velocityMacro(:,5),'Color',[0.8 0 0],'LineWidth',4);
velocityDns(find(velocityDns==0))=nan;
plot(velocityDns(:,2)+0.5,(velocityDns(:,5)),'k','LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
%title('c on membrane')
 fig = gcf;
 fig.PaperUnits = 'inches';
 %fig.PaperPosition = [0 0 20 20];
  %print -painters -depsc ./figConc/ConC.eps
  
  %%%%%%% COMPARISON C0 C1   
figure(102);
hold on 
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
plot(velocityMacro(:,2),velocityMacro(:,5),'-.','Color',[0.8 0 0],'LineWidth',2);
plot(velocityMacro(:,2),0.2*velocityMacro(:,5)./velocityMacro(:,5),'Color',[0.8 0 0],'LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
axis([-1 0 0.198 0.21]);
set(gca,'FontSize',24);
legend({'exact solution','$\mathcal{O}(\epsilon)$','$\mathcal{O}(\epsilon^2)$'},'interpreter','latex','FontSize',24);
grid on;
figure(102);
 print -painters -depsc ../ConCComparisonDir.eps
%axes1 = axes('Parent',figure);
%set(axes1,'FontSize',24,'TickLabelInterpreter','latex');

%%%%%%DIFFERENCES EVALUATION
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
%plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
c0i=interp1(velocityMacro(:,2),0.2*velocityMacro(:,5)./velocityMacro(:,5),xvMeanDNS(1:end));
c1i=interp1(velocityMacro(:,2),velocityMacro(:,5),xvMeanDNS(1:end));
errPercentC0=(c0i-vxMeanDNS(1:end))./((c0i+vxMeanDNS(1:end))/2);
errPercentC1=(c1i-vxMeanDNS(1:end))./((c1i+vxMeanDNS(1:end))/2);
figure(202);
hold on 
plot(xvMeanDNS(1:end),errPercentC0,'-p','Color',[0.8 0 0],'LineWidth',2);
plot(xvMeanDNS(1:end),errPercentC1,'-s','Color',[0.8 0 0],'LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
  
  %%%%%%%%%%%%%%%  %%%%%% on C .  m=0
 clear all
velocityDns=load('./C2MembAds/uvpcDNSOnC.dat');
velocityMacro=load('./C2MembAds/uvpcEQonC.dat');
%velocityNoStruct=load('./C1MembAds/uvpcNoStructOnC.dat');
%plot for c
figure(31);
hold on 

grid on;
hold on 
 
velocityDns(isnan(velocityDns))=0;
dx=velocityDns(100,2)-velocityDns(99,2);
 eps= 0.02;
 theta=0.5;
 %for i=1:11
 %vMeanDNS(i)=sum(velocityDns(121+160*(i-1)+1:121+160*i,2))*dx/eps;
 %end
 for i=1:1:50
 vxMeanDNS(i)=sum((velocityDns(1+9999+199*(i-1):9999+199*i,5)))*dx/(theta*eps);
 xvMeanDNS(i)=mean(velocityDns(1+9999+199*(i-1):9999+199*i,2));
 end
 plot(xvMeanDNS(1:end)+0.5,vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)

plot(velocityMacro(:,2)+0.5,velocityMacro(:,5),'Color',[0.8 0 0],'LineWidth',4);
velocityDns(find(velocityDns==0))=nan;
plot(velocityDns(:,2)+0.5,(velocityDns(:,5)),'k-.','LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
%title('c on membrane')
 fig = gcf;
 fig.PaperUnits = 'inches';
   xlabel('$x_3$','interpreter', 'latex', 'fontsize', 24);
ylabel('$c$','interpreter', 'latex', 'fontsize', 24);
set(get(gca,'YLabel'),'Rotation',0)
axis([-1.5 1.5 0 1])
  %set(gca,'YScale','log')
 %fig.PaperPosition = [0 0 20 20];
  print -painters -depsc ../ConC.eps
  
  %%%%%%% COMPARISON C0 C1   
figure(101);
hold on 
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
plot(velocityMacro(:,2),velocityMacro(:,5),'Color',[0.8 0 0],'LineWidth',2);
plot(velocityMacro(:,2),velocityMacro(:,8),'-.','Color',[0.8 0 0],'LineWidth',2);
%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);
legend({'exact solution','$\mathcal{O}(\epsilon)$','$\mathcal{O}(\epsilon^2)$'},'interpreter','latex','FontSize',24);
grid on;
figure(101);
axis([-1 0 0.04 0.1])
 print -painters -depsc ../ConCComparisonRob.eps
%axes1 = axes('Parent',figure);
%set(axes1,'FontSize',24,'TickLabelInterpreter','latex');

%%%%%%DIFFERENCES EVALUATION
%plot(velocityDns(:,2),(velocityDns(:,5)),'k','LineWidth',2);
%plot(xvMeanDNS(1:end),vxMeanDNS(1:end),'Color',[0 0 0.8],'LineStyle','none','Marker','*','Linewidth',2,'MarkerSize',12)
c0i=interp1(velocityMacro(:,2),velocityMacro(:,5),xvMeanDNS(1:end));
c1i=interp1(velocityMacro(:,2),velocityMacro(:,8),xvMeanDNS(1:end));
errPercentC0=(c0i-vxMeanDNS(1:end))./((c0i+vxMeanDNS(1:end))/2);
errPercentC1=(c1i-vxMeanDNS(1:end))./((c1i+vxMeanDNS(1:end))/2);
figure(201);
hold on 
plot(xvMeanDNS(1:end),errPercentC0,'-p','Color',[0.8 0 0],'LineWidth',2);
plot(xvMeanDNS(1:end),errPercentC1,'-s','Color',[0.8 0 0],'LineWidth',2);

%plot(velocityMacro(:,2),velocityMacro(:,8),'b--','LineWidth',2);
%plot(velocityMacro(:,2),velocityNoStruct(:,5),'g','LineWidth',2);
set(gca,'FontSize',24);