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
z=surf(zrange,yrange,Fzs,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fz for 1 V/m initial field');
xlabel('z, nm');
ylabel('y, nm');
zlabel('Force, N');
%set(findall(fig,'-property','FontSize'),'FontSize',12)

multisave(z,[enddir '/' lbl],[lbl '-Fz'],{'png','fig','jpg'}); 
figure;
z=surf(zrange,yrange,Fys,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fy for 1 V/m initial field')
xlabel('z, nm');
ylabel('y, nm');
zlabel('Force, N')

multisave(z,[enddir '/' lbl],[lbl '-Fy'],{'png','fig','jpg'}); 
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
z=pcolor(zrange,yrange,SFzs);
set(z,'EdgeColor','none','LineStyle','none');
title('Signum Fz');
xlabel('z, nm');
ylabel('y, nm');

multisave(z,[enddir '/' lbl],[lbl '-SignumFz'],{'png','fig','jpg'}); 
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
z=pcolor(zrange,yrange,SFzs);
set(z,'EdgeColor','none','LineStyle','none');
title('Signum Fy');
xlabel('z, nm');
ylabel('y, nm');
multisave(z,[enddir '/' lbl],[lbl '-SignumFy'],{'png','fig','jpg'}); 

figHandles = findall(0,'Type','figure');
set(findall(figHandles,'-property','FontSize'),'FontSize',25)
