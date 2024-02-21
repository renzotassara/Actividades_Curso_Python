function Filtros(imagen,cte_mascara,umbral,m,n)


mascara = cte_mascara*[1,1,1;1,1,1;1,1,1];

%% Imagen original
figure(1);
subplot(1,8,1);
imshow(imagen), title('Imagen Original'); %Imprimo imagen

matrizR = imagen(:,:,1); %matrices Red, Green, Blue
matrizG = imagen(:,:,2);
matrizB = imagen(:,:,3);

%% ========== Filtro Anisotropico ============

imagen_ADF(:,:,1)=imdiffusefilt(imagen(:,:,1));
imagen_ADF(:,:,2)=imdiffusefilt(imagen(:,:,2));
imagen_ADF(:,:,3)=imdiffusefilt(imagen(:,:,3));

subplot(1,8,2);
imshow(imagen_ADF), title('ADF');

%% ========= Filtro Pasa Bajos ============

imagen_PB(:,:,1) = filter2(mascara, matrizR);  %FiltroPasaBajo
imagen_PB(:,:,2) = filter2(mascara, matrizG);
imagen_PB(:,:,3) = filter2(mascara, matrizB);

imagen_PB = uint8(imagen_PB);   
subplot(1,8,3);
imshow(imagen_PB), title('Pasa Bajos');


%% ===============Binarizacion===============
imagen_gris = rgb2gray(imagen); %Imagen en escala de grises
imagen_binarizada = im2bw(imagen_gris, umbral);

subplot(1,8,4);
imshow(imagen_binarizada), title('Binarizado');

%% ============ Filtro ADF + Bin ============

imagen_gris_ADF = rgb2gray(imagen_ADF);
imagen_binarizada_ADF = im2bw(imagen_gris_ADF, umbral);

subplot(1,8,5);
imshow(imagen_binarizada_ADF), title('ADF + Bin');


%% ============Filtro PB + Bin ============
imagen_gris_PB = rgb2gray(imagen_PB);
imagen_binarizada_PB = im2bw(imagen_gris_PB, umbral);

subplot(1,8,6);
imshow(imagen_binarizada_PB), title('PB + Bin');

%% ============Filtro ADF + Mediana +  Bin ============  Parece que es por aca la cosa
imagen_mediana_ADF = medfilt2(imagen_gris_ADF, [m n]);  %Filtro mediana para eliminar sal y pimienta
imagen_bin_med_ADF = im2bw(imagen_mediana_ADF, umbral); %Binarizacion

subplot(1,8,7);
imshow(imagen_bin_med_ADF), title('ADF + Med + Bin'); 
%% ========== Filtro PB + Mediana + Bin ==============
imagen_mediana_PB = medfilt2(imagen_gris_PB, [m n]);
imagen_bin_med_PB = im2bw(imagen_mediana_PB, umbral);

subplot(1,8,8);
imshow(imagen_bin_med_PB), title('PB + Mediana + Bin');