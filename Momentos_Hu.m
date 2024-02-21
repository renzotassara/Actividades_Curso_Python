%Base de datos para tornillos

%{
1) ADF
2) Pasa Bajos
3) Binarizacion
4) ADF + Binarizacion
5) Pasa Bajos + Binarizacion
6) ADF + Mediana + Binarizacion (recomendado)
7) PB + Mediana + Binarizacion
%}

tornillos_ADF = [];
tornillos_PB = [];
tornillos_Bin = [];
tornillos_ADF_Bin = [];
tornillos_PB_Bin = [];
tornillos_ADF_Med_Bin = [];
tornillos_PB_Med_Bin = [];

clavos_ADF = [];
clavos_PB = [];
clavos_Bin = [];
clavos_ADF_Bin = [];
clavos_PB_Bin = [];
clavos_ADF_Med_Bin = [];
clavos_PB_Med_Bin = [];

arandelas_ADF = [];
arandelas_PB = [];
arandelas_Bin = [];
arandelas_ADF_Bin = [];
arandelas_PB_Bin = [];
arandelas_ADF_Med_Bin = [];
arandelas_PB_Med_Bin = [];

tuercas_ADF = [];
tuercas_PB = [];
tuercas_Bin = [];
tuercas_ADF_Bin = [];
tuercas_PB_Bin = [];
tuercas_ADF_Med_Bin = [];
tuercas_PB_Med_Bin = [];

%'_ADF','_PB','_Bin','_ADF_Bin','_PB_Bin','_ADF_Med_Bin','_PB_Med_Bin'
save('Momentos_Hu.mat', 'tornillos_ADF','tornillos_PB','tornillos_Bin','tornillos_ADF_Bin','tornillos_PB_Bin','tornillos_ADF_Med_Bin','tornillos_PB_Med_Bin','clavos_ADF','clavos_PB','clavos_Bin','clavos_ADF_Bin','clavos_PB_Bin','clavos_ADF_Med_Bin','clavos_PB_Med_Bin','arandelas_ADF','arandelas_PB','arandelas_Bin','arandelas_ADF_Bin','arandelas_PB_Bin','arandelas_ADF_Med_Bin','arandelas_PB_Med_Bin','tuercas_ADF','tuercas_PB','tuercas_Bin','tuercas_ADF_Bin','tuercas_PB_Bin','tuercas_ADF_Med_Bin','tuercas_PB_Med_Bin');