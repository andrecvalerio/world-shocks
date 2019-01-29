%NOTE: in this script I wasn't able to generate the IRFs for the
%international variables, because I wanted them to appear as the file
%irf_paper.m generates, therefore, to obtain this IRF I have to run
%irf_paper.m

imfhat;      %matrix with the IRFs
nlinha=ndv;  %number of variables
% State each shock separatedely, first WGDP, then PCOM, VIX
nshock  = 1;     %number of shocks; since I want each figure to contain the
                 %responses of all selected variables to only one shock, I have
                 %to perform the operation 2 times, one for each shock


%imfhat is matriz of T X (nvar x nvar) dimension
%  - T = number of periods
%  - nvar x nvar - the default is to consider every variable in the system,
%  therefore each variable receive a shock and we observe the response of
%  all variables, hence nvar x nvar.
%  - The first nvar columns of imfhat shows the IRF of each variable in
%  response to a shock in the variable stored in the first column

% Organizing IRFs and CIs to plot
%IRF for shocks - WGDP, PCOM, VIX 
which_shock  = 3; %WGDP
which_shock2 = 4; %PCOM
which_shock3 = 5; %VIX


% Name each shock separatedely
name_shock  = varlist(which_shock);   %WGDP
name_shock2 = varlist(which_shock2); %PCOM
name_shock3 = varlist(which_shock3); %VIX


new_nvar=3; % define the No of lines the plot has. Since I want to analyse 5 
            % domestic variables, the plot is divided in 3x2 square for
            % each shock

%%%%%%%%%%%% Obtaining the IRFs for the first shock - WGDP shock
[t,numvar]=size(imfhat);
irf2=zeros(t,nvar,nshock);
for n=1:length(which_shock)
irf2(:,:,n)=imfhat(:,(nvar*(which_shock(n)-1)+1):(nvar*which_shock(n)));
end

%Lower CI for shocks 1 and 2 and at 68% and 90%
irf2_low68=zeros(t,nvar,nshock);
for n=1:length(which_shock)
irf2_low68(:,:,n)=imferrl1(:,(nvar*(which_shock(n)-1)+1):(nvar*which_shock(n)));
end

irf2_low90=zeros(t,nvar,nshock);
for n=1:length(which_shock)
irf2_low90(:,:,n)=imferrl1(:,(nvar*(which_shock(n)-1)+1):(nvar*which_shock(n)));
end

irf2_up68=zeros(t,nvar,nshock);
for n=1:length(which_shock)
irf2_up68(:,:,n)=imferrh1(:,(nvar*(which_shock(n)-1)+1):(nvar*which_shock(n)));
end

irf2_up90=zeros(t,nvar,nshock);
for n=1:length(which_shock)
irf2_up90(:,:,n)=imferrh(:,(nvar*(which_shock(n)-1)+1):(nvar*which_shock(n)));
end

wgdp       = irf2(:,:,1).*(2.186557);
wgdp_low68 = irf2_low68(:,:,1).*(2.186557);
wgdp_up68  = irf2_up68(:,:,1).*(2.186557);

%%%%%%%%%%%% Obtaining the IRFs for the second shock - VIX shock
[t,numvar]=size(imfhat);
irf3=zeros(t,nvar,nshock);
for n=1:length(which_shock3)
irf3(:,:,n)=imfhat(:,(nvar*(which_shock3(n)-1)+1):(nvar*which_shock3(n)));
end

%Lower CI for shocks 1 and 2 and at 68% and 90%
irf3_low68=zeros(t,nvar,nshock);
for n=1:length(which_shock3)
irf3_low68(:,:,n)=imferrl1(:,(nvar*(which_shock3(n)-1)+1):(nvar*which_shock3(n)));
end

irf3_low90=zeros(t,nvar,nshock);
for n=1:length(which_shock3)
irf3_low90(:,:,n)=imferrl1(:,(nvar*(which_shock3(n)-1)+1):(nvar*which_shock3(n)));
end

irf3_up68=zeros(t,nvar,nshock);
for n=1:length(which_shock3)
irf3_up68(:,:,n)=imferrh1(:,(nvar*(which_shock3(n)-1)+1):(nvar*which_shock3(n)));
end

irf3_up90=zeros(t,nvar,nshock);
for n=1:length(which_shock3)
irf3_up90(:,:,n)=imferrh(:,(nvar*(which_shock3(n)-1)+1):(nvar*which_shock3(n)));
end

if which_country == 1
    vix       = irf3(:,:,1).*(2.818251);
    vix_low68 = irf3_low68(:,:,1).*(2.818251);
    vix_up68  = irf3_up68(:,:,1).*(2.818251);
else
    vix       = irf3(:,:,1).*(-2.818251);
    vix_low68 = irf3_up68(:,:,1).*(-2.818251);
    vix_up68  = irf3_low68(:,:,1).*(-2.818251);
end
    

%%%%%%%%%%%% Obtaining the IRFs for the third shock - PCOM shock
[t,numvar]=size(imfhat);
irf4=zeros(t,nvar,nshock);
for n=1:length(which_shock2)
irf4(:,:,n)=imfhat(:,(nvar*(which_shock2(n)-1)+1):(nvar*which_shock2(n)));
end

%Lower CI for shocks 1 and 2 and at 68% and 90%
irf4_low68=zeros(t,nvar,nshock);
for n=1:length(which_shock2)
irf4_low68(:,:,n)=imferrl1(:,(nvar*(which_shock2(n)-1)+1):(nvar*which_shock2(n)));
end

irf4_low90=zeros(t,nvar,nshock);
for n=1:length(which_shock2)
irf4_low90(:,:,n)=imferrl1(:,(nvar*(which_shock2(n)-1)+1):(nvar*which_shock2(n)));
end

irf4_up68=zeros(t,nvar,nshock);
for n=1:length(which_shock2)
irf4_up68(:,:,n)=imferrh1(:,(nvar*(which_shock2(n)-1)+1):(nvar*which_shock2(n)));
end

irf4_up90=zeros(t,nvar,nshock);
for n=1:length(which_shock2)
irf4_up90(:,:,n)=imferrh(:,(nvar*(which_shock2(n)-1)+1):(nvar*which_shock2(n)));
end

pcom       = irf4(:,:,1).*(1.326154);
pcom_low68 = irf4_low68(:,:,1).*(1.326154);
pcom_up68  = irf4_up68(:,:,1).*(1.326154);

%%%%%%%%%%% Ploting the first shock - WGDP shock
zero=0*(1:imstp);
ncoluna = 2; % defining the number of columns in the subplot
figure('Name','Impulse Response Function and 68% C.Interval');
I=1:6;       % defining the number of squares in the subplot, since I want
             % a plot of 3x2, I need 6 squares
vector = [1 2 6 7 8];     % which variables will respond to the shock
                            % GDP, CPI, EMBI, EXR, INTR
for i = 1:length(vector)    % will plot each variable in a specfic square
    j = vector(i);
     for n=1:nshock
         subplot(new_nvar,ncoluna,I(n));
         plot (1:imstp,zero,'k-',1:imstp,wgdp(:,j,n),'k-',1:imstp,wgdp_low68(:,j,n),'k:',1:imstp,wgdp_up68(:,j,n),'k:');
         ymax=max(0,1.20*max(wgdp_up68(:,j,n)));
         ymin=min(0,1.20*min(wgdp_low68(:,j,n)));
         if ymax==0;
             ymax=0.005;
         end
         if ymin==0;
             ymin=-0.005;
         end
         axis([-inf,imstp,ymin,ymax]);
         if n==1
             ylabel(ylab(j));
         end
         if j==1 %will name the shock in the figure; beware of this when performing changes in the code
             title(name_shock);
         elseif j==2
             title(name_shock);
         end
         set(gca,'FontSize',7);
     end
     I=I+nshock;
end

% saving the figures
if which_country == 1       % saving for Brazil
    saveas(gcf,'irf_wgdp_br','jpg');
elseif which_country == 2   %saving for Chile
    saveas(gcf,'irf_wgdp_ch','jpg');
elseif which_country == 3   %saving for Colombia
    saveas(gcf,'irf_wgdp_col','jpg');
elseif which_country == 5   %saving for Mexico
    saveas(gcf,'irf_wgdp_mex','jpg');
elseif which_country == 4   %saving for Peru
    saveas(gcf,'irf_wgdp_per','jpg');
end
 
%%%%%%%%%%% Ploting the second shock - VIX shock
zero=0*(1:imstp);
ncoluna = 2; % defining the number of columns in the subplot
figure('Name','Impulse Response Function and 68% C.Interval');
I=1:6;       % defining the number of squares in the subplot, since I want
             % a plot of 3x2, I need 6 squares
vector = [1 2 6 7 8];     % which variables will respond to the shock
                            % GDP, CPI, EMBI, EXR, INTR
for i = 1:length(vector)    % will plot each variable in a specfic square
    j = vector(i);
     for n=1:nshock
         subplot(new_nvar,ncoluna,I(n));
         plot (1:imstp,zero,'k-',1:imstp,vix(:,j,n),'k-',1:imstp,vix_low68(:,j,n),'k:',1:imstp,vix_up68(:,j,n),'k:');
         ymax=max(0,1.20*max(vix_up68(:,j,n)));
         ymin=min(0,1.20*min(vix_low68(:,j,n)));
         if ymax==0;
             ymax=0.005;
         end
         if ymin==0;
             ymin=-0.005;
         end
         axis([-inf,imstp,ymin,ymax]);
         if n==1
             ylabel(ylab(j));
         end
         if j==1 %will name the shock in the figure; beware of this when performing changes in the code
             title(name_shock2);
         elseif j==2
             title(name_shock2);
         end
         set(gca,'FontSize',7);
     end
     I=I+nshock;
end

% saving the figures
if m == 1
    if which_country == 1       % saving for Brazil
        saveas(gcf,'irf_vix_br','jpg');
    elseif which_country == 2   %saving for Chile
        saveas(gcf,'irf_vix_ch','jpg');
    elseif which_country == 3   %saving for Colombia
        saveas(gcf,'irf_vix_col','jpg');
    elseif which_country == 5   %saving for Mexico
        saveas(gcf,'irf_vix_mex','jpg');
    elseif which_country == 4   %saving for Peru
        saveas(gcf,'irf_vix_per','jpg');
    end
elseif m == 4
    if which_country == 1       % saving for Brazil
    saveas(gcf,'irf_vix_br_m4','jpg');
    elseif which_country == 2   %saving for Chile
        saveas(gcf,'irf_vix_ch_m4','jpg');
    elseif which_country == 3   %saving for Colombia
        saveas(gcf,'irf_vix_col_m4','jpg');
    elseif which_country == 5   %saving for Mexico
        saveas(gcf,'irf_vix_mex_m4','jpg');
    elseif which_country == 4   %saving for Peru
        saveas(gcf,'irf_vix_per_m4','jpg');
    end
end

%%%%%%%%%%% Ploting the second shock - PCOM shock
zero=0*(1:imstp);
ncoluna = 2; % defining the number of columns in the subplot
figure('Name','Impulse Response Function and 68% C.Interval');
I=1:6;       % defining the number of squares in the subplot, since I want
             % a plot of 3x2, I need 6 squares
vector = [1 2 6 7 8];     % which variables will respond to the shock
                            % GDP, CPI, EMBI, EXR, INTR
for i = 1:length(vector)    % will plot each variable in a specfic square
    j = vector(i);
     for n=1:nshock
         subplot(new_nvar,ncoluna,I(n));
         plot (1:imstp,zero,'k-',1:imstp,pcom(:,j,n),'k-',1:imstp,pcom_low68(:,j,n),'k:',1:imstp,pcom_up68(:,j,n),'k:');
         ymax=max(0,1.20*max(pcom_up68(:,j,n)));
         ymin=min(0,1.20*min(pcom_low68(:,j,n)));
         if ymax==0;
             ymax=0.005;
         end
         if ymin==0;
             ymin=-0.005;
         end
         axis([-inf,imstp,ymin,ymax]);
         if n==1
             ylabel(ylab(j));
         end
         if j==1 %will name the shock in the figure; beware of this when performing changes in the code
             title(name_shock3);
         elseif j==2
             title(name_shock3);
         end
         set(gca,'FontSize',7);
     end
     I=I+nshock;
end

% saving the figures
if which_country == 1       % saving for Brazil
    saveas(gcf,'irf_pcom_br','jpg');
elseif which_country == 2   %saving for Chile
    saveas(gcf,'irf_pcom_ch','jpg');
elseif which_country == 3   %saving for Colombia
    saveas(gcf,'irf_pcom_col','jpg');
elseif which_country == 5   %saving for Mexico
    saveas(gcf,'irf_pcom_mex','jpg');
elseif which_country == 4   %saving for Peru
    saveas(gcf,'irf_pcom_per','jpg');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Saving the IRFs into an excel file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAUTION!! -> this code is outdated, it was developed to the international
% ordering of WGDP - VIX - PCOM

% col_header = ['Horizon', varlist];
% row_header = (1:16)';
% if which_country == 1
%     xlswrite('IRF_br_wgdp',vix1,'Sheet 1','B2');
%     xlswrite('IRF_br_wgdp',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_wgdp',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_wgdp_low',vix1_low68,'Sheet 1','B2');
%     xlswrite('IRF_br_wgdp_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_wgdp_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_wgdp_up',vix1_up68,'Sheet 1','B2');
%     xlswrite('IRF_br_wgdp_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_wgdp_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_vix',vix2,'Sheet 1','B2');
%     xlswrite('IRF_br_vix',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_vix',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_vix_low',vix2_low68,'Sheet 1','B2');
%     xlswrite('IRF_br_vix_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_vix_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_vix_up',vix2_up68,'Sheet 1','B2');
%     xlswrite('IRF_br_vix_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_vix_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_pcom',vix3,'Sheet 1','B2');
%     xlswrite('IRF_br_pcom',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_pcom',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_pcom_low',vix3_low68,'Sheet 1','B2');
%     xlswrite('IRF_br_pcom_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_pcom_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_br_pcom_up',vix3_up68,'Sheet 1','B2');
%     xlswrite('IRF_br_pcom_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_br_pcom_up',row_header,'Sheet 1','A2');
% elseif which_country == 2
%     xlswrite('IRF_ch_wgdp',vix1,'Sheet 1','B2');
%     xlswrite('IRF_ch_wgdp',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_wgdp',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_wgdp_low',vix1_low68,'Sheet 1','B2');
%     xlswrite('IRF_ch_wgdp_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_wgdp_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_wgdp_up',vix1_up68,'Sheet 1','B2');
%     xlswrite('IRF_ch_wgdp_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_wgdp_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_vix',vix2,'Sheet 1','B2');
%     xlswrite('IRF_ch_vix',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_vix',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_vix_low',vix2_low68,'Sheet 1','B2');
%     xlswrite('IRF_ch_vix_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_vix_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_vix_up',vix2_up68,'Sheet 1','B2');
%     xlswrite('IRF_ch_vix_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_vix_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_pcom',vix3,'Sheet 1','B2');
%     xlswrite('IRF_ch_pcom',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_pcom',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_pcom_low',vix3_low68,'Sheet 1','B2');
%     xlswrite('IRF_ch_pcom_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_pcom_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_ch_pcom_up',vix3_up68,'Sheet 1','B2');
%     xlswrite('IRF_ch_pcom_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_ch_pcom_up',row_header,'Sheet 1','A2');
% elseif which_country == 3
%     xlswrite('IRF_col_wgdp',vix1,'Sheet 1','B2');
%     xlswrite('IRF_col_wgdp',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_wgdp',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_wgdp_low',vix1_low68,'Sheet 1','B2');
%     xlswrite('IRF_col_wgdp_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_wgdp_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_wgdp_up',vix1_up68,'Sheet 1','B2');
%     xlswrite('IRF_col_wgdp_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_wgdp_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_vix',vix2,'Sheet 1','B2');
%     xlswrite('IRF_col_vix',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_vix',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_vix_low',vix2_low68,'Sheet 1','B2');
%     xlswrite('IRF_col_vix_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_vix_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_vix_up',vix2_up68,'Sheet 1','B2');
%     xlswrite('IRF_col_vix_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_vix_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_pcom',vix3,'Sheet 1','B2');
%     xlswrite('IRF_col_pcom',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_pcom',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_pcom_low',vix3_low68,'Sheet 1','B2');
%     xlswrite('IRF_col_pcom_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_pcom_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_col_pcom_up',vix3_up68,'Sheet 1','B2');
%     xlswrite('IRF_col_pcom_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_col_pcom_up',row_header,'Sheet 1','A2');
% elseif which_country == 4
%     xlswrite('IRF_mex_wgdp',vix1,'Sheet 1','B2');
%     xlswrite('IRF_mex_wgdp',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_wgdp',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_wgdp_low',vix1_low68,'Sheet 1','B2');
%     xlswrite('IRF_mex_wgdp_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_wgdp_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_wgdp_up',vix1_up68,'Sheet 1','B2');
%     xlswrite('IRF_mex_wgdp_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_wgdp_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_vix',vix2,'Sheet 1','B2');
%     xlswrite('IRF_mex_vix',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_vix',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_vix_low',vix2_low68,'Sheet 1','B2');
%     xlswrite('IRF_mex_vix_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_vix_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_vix_up',vix2_up68,'Sheet 1','B2');
%     xlswrite('IRF_mex_vix_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_vix_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_pcom',vix3,'Sheet 1','B2');
%     xlswrite('IRF_mex_pcom',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_pcom',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_pcom_low',vix3_low68,'Sheet 1','B2');
%     xlswrite('IRF_mex_pcom_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_pcom_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_mex_pcom_up',vix3_up68,'Sheet 1','B2');
%     xlswrite('IRF_mex_pcom_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_mex_pcom_up',row_header,'Sheet 1','A2');
% elseif which_country == 5
%     xlswrite('IRF_per_wgdp',vix1,'Sheet 1','B2');
%     xlswrite('IRF_per_wgdp',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_wgdp',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_wgdp_low',vix1_low68,'Sheet 1','B2');
%     xlswrite('IRF_per_wgdp_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_wgdp_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_wgdp_up',vix1_up68,'Sheet 1','B2');
%     xlswrite('IRF_per_wgdp_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_wgdp_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_vix',vix2,'Sheet 1','B2');
%     xlswrite('IRF_per_vix',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_vix',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_vix_low',vix2_low68,'Sheet 1','B2');
%     xlswrite('IRF_per_vix_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_vix_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_vix_up',vix2_up68,'Sheet 1','B2');
%     xlswrite('IRF_per_vix_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_vix_up',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_pcom',vix3,'Sheet 1','B2');
%     xlswrite('IRF_per_pcom',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_pcom',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_pcom_low',vix3_low68,'Sheet 1','B2');
%     xlswrite('IRF_per_pcom_low',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_pcom_low',row_header,'Sheet 1','A2');
%     xlswrite('IRF_per_pcom_up',vix3_up68,'Sheet 1','B2');
%     xlswrite('IRF_per_pcom_up',col_header,'Sheet 1','A1');
%     xlswrite('IRF_per_pcom_up',row_header,'Sheet 1','A2');
% end