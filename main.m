
%Proyecto final IA1
%Tassara Renzo

clear;
clc;

%% ====Filtro====
%{
1) ADF
2) Pasa Bajos
3) Binarizacion
4) ADF + Binarizacion
5) Pasa Bajos + Binarizacion
6) ADF + Mediana + Binarizacion (recomendado)
7) PB + Mediana + Binarizacion
%}
filtro = 6;
vector_elemento = [0,0,0,0];
%% ==== Imagen ====
imagen = imread('Dato (16).jpg'); %Imagen a importar

%% ==== Descomentar si hay que eliminar vectores de la Base_de_Datos====

 % load('Momentos_Hu.mat');
 % tornillos_ADF_Med_Bin(:, :) = [];
 % arandelas_ADF_Med_Bin(:, :) = [];
 % tuercas_ADF_Med_Bin(:, :) = [];
 % clavos_ADF_Med_Bin(:, :) = [];
 % save('Momentos_Hu.mat', 'tornillos_ADF','tornillos_PB','tornillos_Bin','tornillos_ADF_Bin','tornillos_PB_Bin','tornillos_ADF_Med_Bin','tornillos_PB_Med_Bin','clavos_ADF','clavos_PB','clavos_Bin','clavos_ADF_Bin','clavos_PB_Bin','clavos_ADF_Med_Bin','clavos_PB_Med_Bin','arandelas_ADF','arandelas_PB','arandelas_Bin','arandelas_ADF_Bin','arandelas_PB_Bin','arandelas_ADF_Med_Bin','arandelas_PB_Med_Bin','tuercas_ADF','tuercas_PB','tuercas_Bin','tuercas_ADF_Bin','tuercas_PB_Bin','tuercas_ADF_Med_Bin','tuercas_PB_Med_Bin');

%% ==== Procesamiento ====
opcion = input("Ingrese el numero de la accion a realizar \n 1) Analizar imagen \n 2) Entrenar IA \n 3) Comparar filtros \n");

while(opcion ~= 1 && opcion ~= 2 && opcion ~= 3)    %Error por si el usuario pone otro valor
    opcion = input("Ingrese 1, 2 o 3 por favor: ");
end
if (opcion == 2)
        figure(1);
        subplot(4,1,1);
        imshow(imagen(200:500,:,:)), title('Imagen Nº1');
        subplot(4,1,2);
        imshow(imagen(500:800,:,:)), title('Imagen Nº2');
        subplot(4,1,3);
        imshow(imagen(800:1100,:,:)), title('Imagen Nº3');
        subplot(4,1,4);
        imshow(imagen(1100:1400,:,:)), title('Imagen Nº4');
        disp("Ingresar a que corresponde cada imagen respectivamente siendo:");
        disp("1) Tornillo");
        disp("2) Clavo");
        disp("3) Tuerca");
        disp("4) Arandela");

        for(i = 1:4)
            vector_elemento(i) = input(['La imagen Nº', num2str(i), ' es: ']);
            while (vector_elemento(i) ~= 1 && vector_elemento(i) ~= 2 && vector_elemento(i) ~= 3 && vector_elemento(i) ~= 4)
                vector_elemento(i) = input(['Ingrese 1,2,3 o 4 \n La imagen Nº', num2str(i), ' es: ']);
            end
        end
            for (filtro = 1:7)

        disp(['Filtro Nº',num2str(filtro)]);
        Analisis_imagen(imagen, filtro, opcion,vector_elemento);
    end
else
    Analisis_imagen(imagen, filtro, opcion,vector_elemento);
end

