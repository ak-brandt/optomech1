NE=result.NormeE
[Fz,Fy]=fdip(NE,1.6,1.195,10e-9,5e-9);
figure;
%surf(Fz);
%figure
%surf(Fy);
enddir='/home/ak/Документы/Lab/Optical Force/Figures/FindMin/'
lbl='R-800-wl-400-n-1.8-n0-1.33-corrected-force-for-npn-1.59-25-orders-step-5-ro-10'
fr=161;%
fl=321;
%Fzs=Fz(:,fr+1:fl);
%Fzs(fr+1:fr*2,fr+1:fl)=Fz(end:-1:1,fr+1:fl);
%Fys=Fy(:,fr+1:fl);
%Fys(fr+1:fr*2,fr+1:fl)=Fy(end:-1:1,fr+1:fl);

yframe=80;

Fzs=Fz(yframe:-1:1,fr+1:fl);
Fzs(yframe+1:yframe*2,:)=Fz(1:yframe,fr+1:fl);
Fys=-Fy(yframe:-1:1,fr+1:fl);
Fys(yframe+1:yframe*2,:)=Fy(1:yframe,fr+1:fl);



figure
z=surf(Fzs,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fz for 1 V/m initial field');
xlabel('10e-8 m');
ylabel('10e-8 m');
zlabel('Force, N');

multisave(z,[enddir '/' lbl],[lbl '-Fz'],{'png','fig','jpg'}); 
figure;
z=surf(Fys,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('Fy for 1 V/m initial field')
xlabel('10e-8 m');
ylabel('10e-8 m');
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
z=pcolor(SFzs);
set(z,'EdgeColor','none','LineStyle','none');
title('Signum Fz');
xlabel('10e-8 m');
ylabel('10e-8 m');

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
z=pcolor(SFys);
set(z,'EdgeColor','none','LineStyle','none');
title('Signum Fy');
xlabel('10e-8 m');
ylabel('10e-8 m');
multisave(z,[enddir '/' lbl],[lbl '-SignumFy'],{'png','fig','jpg'}); 
