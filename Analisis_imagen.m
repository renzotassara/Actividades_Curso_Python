%Analisis imagen

function Analisis_imagen(imagen, filtro, opcion,vector_elemento)

cte_mascara = 1/9;
mascara = cte_mascara*[1,1,1;1,1,1;1,1,1];
umbral = 0.4;
m = 3;
n = 3;

%% Muestra del recorte de imagen
if (opcion == 1 || opcion == 2)
    figure(2);
    imagen1 = imagen(200:500,:,:);
    imagen2 = imagen(500:800,:,:);
    imagen3 = imagen(800:1100,:,:);
    imagen4 = imagen(1100:1400,:,:);
    
    %% Red, Green, Blue
    matrizR_1 = imagen1(:,:,1); %matrices Red, Green, Blue primera parte de imagen
    matrizG_1 = imagen1(:,:,2);
    matrizB_1 = imagen1(:,:,3);
    
    matrizR_2 = imagen2(:,:,1); %matrices Red, Green, Blue segunda parte de imagen
    matrizG_2 = imagen2(:,:,2);
    matrizB_2 = imagen2(:,:,3);
    
    matrizR_3 = imagen3(:,:,1); %matrices Red, Green, Blue tercera parte de imagen
    matrizG_3 = imagen3(:,:,2);
    matrizB_3 = imagen3(:,:,3);
    
    matrizR_4 = imagen4(:,:,1); %matrices Red, Green, Blue cuarta parte de imagen
    matrizG_4 = imagen4(:,:,2);
    matrizB_4 = imagen4(:,:,3);
    
    %% ========== Filtro Anisotropico ============
    imagen_ADF_1(:,:,1)=imdiffusefilt(matrizR_1);
    imagen_ADF_1(:,:,2)=imdiffusefilt(matrizG_1);
    imagen_ADF_1(:,:,3)=imdiffusefilt(matrizB_1);
    
    imagen_ADF_2(:,:,1)=imdiffusefilt(matrizR_2);
    imagen_ADF_2(:,:,2)=imdiffusefilt(matrizG_2);
    imagen_ADF_2(:,:,3)=imdiffusefilt(matrizB_2);
    
    imagen_ADF_3(:,:,1)=imdiffusefilt(matrizR_3);
    imagen_ADF_3(:,:,2)=imdiffusefilt(matrizG_3);
    imagen_ADF_3(:,:,3)=imdiffusefilt(matrizB_3);
    
    imagen_ADF_4(:,:,1)=imdiffusefilt(matrizR_4);
    imagen_ADF_4(:,:,2)=imdiffusefilt(matrizG_4);
    imagen_ADF_4(:,:,3)=imdiffusefilt(matrizB_4);
    
    %% ========== Filtro Pasa Bajo ==============
    
    imagen_PB_1(:,:,1)=filter2(mascara,matrizR_1);
    imagen_PB_1(:,:,2)=filter2(mascara,matrizG_1);
    imagen_PB_1(:,:,3)=filter2(mascara,matrizB_1);
    
    imagen_PB_2(:,:,1)=filter2(mascara,matrizR_2);
    imagen_PB_2(:,:,2)=filter2(mascara,matrizG_2);
    imagen_PB_2(:,:,3)=filter2(mascara,matrizB_2);
    
    imagen_PB_3(:,:,1)=filter2(mascara,matrizR_3);
    imagen_PB_3(:,:,2)=filter2(mascara,matrizG_3);
    imagen_PB_3(:,:,3)=filter2(mascara,matrizB_3);
    
    imagen_PB_4(:,:,1)=filter2(mascara,matrizR_4);
    imagen_PB_4(:,:,2)=filter2(mascara,matrizG_4);
    imagen_PB_4(:,:,3)=filter2(mascara,matrizB_4);
    
    imagen_PB_1 = uint8(imagen_PB_1);
    imagen_PB_2 = uint8(imagen_PB_2);
    imagen_PB_3 = uint8(imagen_PB_3);
    imagen_PB_4 = uint8(imagen_PB_4);
    
    %% =========== Binarizacion ==========
        imagen_gris_1 = rgb2gray(imagen1); %Imagen en escala de grises
        imagen_binarizada_1 = im2bw(imagen_gris_1, umbral);
        imagen_gris_2 = rgb2gray(imagen2); %Imagen en escala de grises
        imagen_binarizada_2 = im2bw(imagen_gris_2, umbral);
        imagen_gris_3 = rgb2gray(imagen3); %Imagen en escala de grises
        imagen_binarizada_3 = im2bw(imagen_gris_3, umbral);
        imagen_gris_4 = rgb2gray(imagen4); %Imagen en escala de grises
        imagen_binarizada_4 = im2bw(imagen_gris_4, umbral);
    
    if (filtro == 1)    %ADF
        subplot(4,2,2);
        imshow(imagen_ADF_1), title('Primero ADF');
        subplot(4,2,4);
        imshow(imagen_ADF_2), title('Segundo ADF');
        subplot(4,2,6);
        imshow(imagen_ADF_3), title('Tercero ADF');
        subplot(4,2,8);
        imshow(imagen_ADF_4), title('Cuarto ADF');
        
        imagen_filtrada = cat(3, imagen_ADF_1, imagen_ADF_2, imagen_ADF_3, imagen_ADF_4);
    
        %Agregar funcion la cual me voy a los otros metodos
    
    elseif (filtro == 2)    %PB
        subplot(4,2,2);
        imshow(imagen_PB_1), title('Primero PB');
        subplot(4,2,4);
        imshow(imagen_PB_2), title('Segundo PB');
        subplot(4,2,6);
        imshow(imagen_PB_3), title('Tercero PB');
        subplot(4,2,8);
        imshow(imagen_PB_4), title('Cuarto PB');
        
        imagen_filtrada = cat(3, imagen_PB_1, imagen_PB_2, imagen_PB_3, imagen_PB_4);
    
    elseif (filtro == 3)    %Bin
        subplot(4,2,2);
        imshow(imagen_binarizada_1), title('Primero Bin');
        subplot(4,2,4);
        imshow(imagen_binarizada_2), title('Segundo Bin');
        subplot(4,2,6);
        imshow(imagen_binarizada_3), title('Tercero Bin');
        subplot(4,2,8);
        imshow(imagen_binarizada_4), title('Cuarto Bin');
        
        imagen_filtrada = cat(3, imagen_binarizada_1, imagen_binarizada_2, imagen_binarizada_3, imagen_binarizada_4);
    
    elseif(filtro == 4)   %ADF+Bin
        imagen_gris_ADF_1 = rgb2gray(imagen_ADF_1); %Imagen en escala de grises
        imagen_ADF_Bin_1 = im2bw(imagen_gris_ADF_1, umbral);
        imagen_gris_ADF_2 = rgb2gray(imagen_ADF_2); %Imagen en escala de grises
        imagen_ADF_Bin_2 = im2bw(imagen_gris_ADF_2, umbral);
        imagen_gris_ADF_3 = rgb2gray(imagen_ADF_3); %Imagen en escala de grises
        imagen_ADF_Bin_3 = im2bw(imagen_gris_ADF_3, umbral);
        imagen_gris_ADF_4 = rgb2gray(imagen_ADF_4); %Imagen en escala de grises
        imagen_ADF_Bin_4 = im2bw(imagen_gris_ADF_4, umbral);
    
        subplot(4,2,2);
        imshow(imagen_ADF_Bin_1), title('Primero ADF+Bin');
        subplot(4,2,4);
        imshow(imagen_ADF_Bin_2), title('Segundo ADF+Bin');
        subplot(4,2,6);
        imshow(imagen_ADF_Bin_3), title('Tercero ADF+Bin');
        subplot(4,2,8);
        imshow(imagen_ADF_Bin_4), title('Cuarto ADF+Bin');
        
        imagen_filtrada = cat(3, imagen_ADF_Bin_1, imagen_ADF_Bin_2, imagen_ADF_Bin_3, imagen_ADF_Bin_4);
    
    elseif(filtro == 5)   %PB+Bin
        imagen_gris_PB_1 = rgb2gray(imagen_PB_1); %Imagen en escala de grises
        imagen_PB_Bin_1 = im2bw(imagen_gris_PB_1, umbral);
        imagen_gris_PB_2 = rgb2gray(imagen_PB_2); %Imagen en escala de grises
        imagen_PB_Bin_2 = im2bw(imagen_gris_PB_2, umbral);
        imagen_gris_PB_3 = rgb2gray(imagen_PB_3); %Imagen en escala de grises
        imagen_PB_Bin_3 = im2bw(imagen_gris_PB_3, umbral);
        imagen_gris_PB_4 = rgb2gray(imagen_PB_4); %Imagen en escala de grises
        imagen_PB_Bin_4 = im2bw(imagen_gris_PB_4, umbral);
    
        subplot(4,2,2);
        imshow(imagen_PB_Bin_1), title('Primero PB+Bin');
        subplot(4,2,4);
        imshow(imagen_PB_Bin_2), title('Segundo PB+Bin');
        subplot(4,2,6);
        imshow(imagen_PB_Bin_3), title('Tercero PB+Bin');
        subplot(4,2,8);
        imshow(imagen_PB_Bin_4), title('Cuarto PB+Bin');
        
        imagen_filtrada = cat(3, imagen_PB_Bin_1, imagen_PB_Bin_2, imagen_PB_Bin_3, imagen_PB_Bin_4);
    
    elseif(filtro == 6) %ADF+mediana+Bin
        imagen_gris_ADF_1 = rgb2gray(imagen_ADF_1); %Imagen en escala de grises
        imagen_mediana_ADF_1 = medfilt2(imagen_gris_ADF_1, [m n]);
        imagen_ADF_mediana_Bin_1 = im2bw(imagen_mediana_ADF_1, umbral);
        imagen_gris_ADF_2 = rgb2gray(imagen_ADF_2); %Imagen en escala de grises
        imagen_mediana_ADF_2 = medfilt2(imagen_gris_ADF_2, [m n]);
        imagen_ADF_mediana_Bin_2 = im2bw(imagen_mediana_ADF_2, umbral);
        imagen_gris_ADF_3 = rgb2gray(imagen_ADF_3); %Imagen en escala de grises
        imagen_mediana_ADF_3 = medfilt2(imagen_gris_ADF_3, [m n]);
        imagen_ADF_mediana_Bin_3 = im2bw(imagen_mediana_ADF_3, umbral);
        imagen_gris_ADF_4 = rgb2gray(imagen_ADF_4); %Imagen en escala de grises
        imagen_mediana_ADF_4 = medfilt2(imagen_gris_ADF_4, [m n]);
        imagen_ADF_mediana_Bin_4 = im2bw(imagen_mediana_ADF_4, umbral);
    
        subplot(4,2,2);
        imshow(imagen_ADF_mediana_Bin_1), title('Primero ADF+mediana+Bin');
        subplot(4,2,4);
        imshow(imagen_ADF_mediana_Bin_2), title('Segundo ADF+mediana+Bin');
        subplot(4,2,6);
        imshow(imagen_ADF_mediana_Bin_3), title('Tercero ADF+mediana+Bin');
        subplot(4,2,8);
        imshow(imagen_ADF_mediana_Bin_4), title('Cuarto ADF+mediana+Bin');
    
        imagen_filtrada = cat(3, imagen_ADF_mediana_Bin_1, imagen_ADF_mediana_Bin_2, imagen_ADF_mediana_Bin_3, imagen_ADF_mediana_Bin_4);
    
    elseif(filtro == 7) %PB+mediana+Bin
        imagen_gris_PB_1 = rgb2gray(imagen_PB_1); %Imagen en escala de grises
        imagen_mediana_PB_1 = medfilt2(imagen_gris_PB_1, [m n]);
        imagen_bin_med_PB_1 = im2bw(imagen_mediana_PB_1, umbral);
        imagen_gris_PB_2 = rgb2gray(imagen_PB_2); %Imagen en escala de grises
        imagen_mediana_PB_2 = medfilt2(imagen_gris_PB_2, [m n]);
        imagen_bin_med_PB_2 = im2bw(imagen_mediana_PB_2, umbral);
        imagen_gris_PB_3 = rgb2gray(imagen_PB_3); %Imagen en escala de grises
        imagen_mediana_PB_3 = medfilt2(imagen_gris_PB_3, [m n]);
        imagen_bin_med_PB_3 = im2bw(imagen_mediana_PB_3, umbral);
        imagen_gris_PB_4 = rgb2gray(imagen_PB_4); %Imagen en escala de grises
        imagen_mediana_PB_4 = medfilt2(imagen_gris_PB_4, [m n]);
        imagen_bin_med_PB_4 = im2bw(imagen_mediana_PB_4, umbral);
    
        subplot(4,2,2);
        imshow(imagen_bin_med_PB_1), title('Primero PB+mediana+Bin');
        subplot(4,2,4);
        imshow(imagen_bin_med_PB_2), title('Segundo PB+mediana+Bin');
        subplot(4,2,6);
        imshow(imagen_bin_med_PB_3), title('Tercero PB+mediana+Bin');
        subplot(4,2,8);
        imshow(imagen_bin_med_PB_4), title('Cuarto PB+mediana+Bin');
    
        imagen_filtrada = cat(3, imagen_bin_med_PB_1, imagen_bin_med_PB_2, imagen_bin_med_PB_3, imagen_bin_med_PB_4);
    
    end
        subplot(4,2,1);
        imshow(imagen1), title('Original 1');
        subplot(4,2,3);
        imshow(imagen2), title('Original 2');
        subplot(4,2,5);
        imshow(imagen3), title('Original 3');
        subplot(4,2,7);
        imshow(imagen4), title('Original 4');
        subplot(4,2,2);
        imshow(imagen_filtrada(:,:,1)), title('Filtro 1');
        subplot(4,2,4);
        imshow(imagen_filtrada(:,:,2)), title('Filtro 2');
        subplot(4,2,6);
        imshow(imagen_filtrada(:,:,3)), title('Filtro 3');
        subplot(4,2,8);
        imshow(imagen_filtrada(:,:,4)), title('Filtro 4');
        Momentos(imagen_filtrada,filtro,opcion,vector_elemento);

elseif(opcion == 3)
    Filtros(imagen,cte_mascara,umbral,m,n)
end
