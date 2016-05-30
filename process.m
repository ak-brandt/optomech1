NE=result.NormeE

R=800 % Sphere radius
wl=400; % Wavelength
dl=5; % Stepsize
n1=1.33; % Medium refractive index
n2=1.8; % Sphere refractive index
n3=1.6; % Nanoparticle refractive index
m=n3/n1;
ro=10; % Nanoparticle radius
[Fz,Fy]=fdip(NE,n3,m,ro*1e-9,dl*1e-9);
figure;
%surf(Fz);
%figure
%surf(Fy);
enddir='/home/ak/Документы/Lab/Optical Force/Figures/FindMin_corrected/'
fr=R/dl+1;
fl=321;

yframe=40;
lbl=['R-' num2str(R) '-wl-' num2str(wl) '-n2-' num2str(n2) '-n1-' num2str(n1) '-corrected-force-for-np-with-n3-' num2str(n3) '-dl-' num2str(dl) '-ro-' num2str(ro) '-yframe-' num2str(yframe)];

zrange=linspace(2.5,(fl-fr-1)*5+2.5,fl-fr);
yrange=linspace(-yframe*5+2.5,yframe*5-2.5,2*yframe);

Fzs=Fz(yframe:-1:1,fr+1:fl);
Fzs(yframe+1:yframe*2,:)=Fz(1:yframe,fr+1:fl);
Fys=-Fy(yframe:-1:1,fr+1:fl);
Fys(yframe+1:yframe*2,:)=Fy(1:yframe,fr+1:fl);




figure
z1=surf(zrange,yrange,Fzs,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fz for 1 V/m initial field');
xlabel('z, nm');
ylabel('y, nm');
zlabel('Force, N');
%set(findall(fig,'-property','FontSize'),'FontSize',12)

figure;
z2=surf(zrange,yrange,Fys,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fy for 1 V/m initial field')
xlabel('z, nm');
ylabel('y, nm');
zlabel('Force, N')


SFzs=sign(Fzs)
%{
zer(1:fr,1:fl-fr-1)=SFzs(1:fr,1:fl-fr-1)+SFzs(1:fr,2:fl-fr)
[Z,Y]=find(not(zer))
ZZ=find(not(zer(1,:)))
PC=zeros(fr,fl-1)
for i=1:1:length(Z)
    PC(Z(i),Y(i))=1;
end;
%}
figure
z3=pcolor(zrange,yrange,SFzs);
set(z3,'EdgeColor','none','LineStyle','none');
title('Signum Fz');
xlabel('z, nm');
ylabel('y, nm');

figure

SFys=sign(Fys)
%{
zer2(1:fr-1,1:fl-fr)=SFys(1:fr-1,1:fl-fr)+SFys(2:fr,1:fl-fr);
[Z2,Y2]=find(not(zer2));
PC2=zeros(fr-1,fl)
for i=1:1:length(Z2)
    PC2(Z2(i),Y2(i))=1;
end;
%}
z4=pcolor(zrange,yrange,SFys);
set(z4,'EdgeColor','none','LineStyle','none');
title('Signum Fy');
xlabel('z, nm');
ylabel('y, nm');

yset=linspace(0,800,5);
xset=linspace(-200,200,5);
yset2=linspace(0,800,9);
xset2=linspace(-200,200,9);

AllFig = findall(0,'Type','figure');
set(findall(AllFig,'-property','FontSize'),'FontSize',30,'fontname','helvetica');

%set(findall(fig,'-property','FontSize'),'FontSize',30,'fontname','arial'); 
set(AllFig,'PaperUnits','inches','PaperPosition', [0 0 11.5 7.5]);
AllAxes = findobj(AllFig,'type','axes');
%set(AllFig,'Units','normal');
set(AllAxes,'Position',[0.12 0.13 0.8 0.8],'linewidth',2,'YTick',xset,'XTick',yset);
figure(z3)

set(gca,'Position',[0.12 0.2 0.8 0.7],'linewidth',2,'YTick',xset2,'XTick',yset2);

figure(z4)
set(gca,'Position',[0.12 0.2 0.8 0.7],'linewidth',2,'YTick',xset2,'XTick',yset2);

gca
multisave(z1,[enddir '/' lbl],[lbl '-Fz'],{'png','fig','jpg'}); 
multisave(z2,[enddir '/' lbl],[lbl '-Fy'],{'png','fig','jpg'}); 
multisave(z3,[enddir '/' lbl],[lbl '-SignumFz'],{'png','fig','jpg'}); 
multisave(z4,[enddir '/' lbl],[lbl '-SignumFy'],{'png','fig','jpg'});

