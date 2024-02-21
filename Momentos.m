function Momentos(imagen,filtro,opcion,vector_elemento)

% imagen_original = imread('Dato (1).jpg');
% imagen1 = imagen_original(200:500,:,:);
% imagen2 = imagen_original(500:800,:,:);
% imagen3 = imagen_original(800:1100,:,:);
% imagen4 = imagen_original(1100:1400,:,:);

%imagen = cat(3, imagen1, imagen2, imagen3, imagen4);  %Concateno las matrices en una matriz tridimensional
[X,Y] = size(imagen(:,:,1));
P = 4;
Q = 4;
Minicial = zeros(X, Y, 4);
Mcentrales = zeros(P, Q, 4);
Mnormales = zeros(P, Q, 4);
MHu = zeros(1,7,4);

for (k = 1:4)

    %% Momento inicial
    for (i = 0:1)
        for (j = 0:1)
            for (x = 1:X)
                for (y = 1:Y)
                    Minicial(i+1,j+1,k) = Minicial(i+1,j+1,k) + (x^i)*(y^j)*imagen(x,y,k);
                end
            end
        end
    end
    
    %% Momentos centrales
    xraya = Minicial(2,1,k)/Minicial(1,1,k);
    yraya = Minicial(1,2,k)/Minicial(1,1,k);
    
    for (p = 0:(P-1))
        for (q = 0:(Q-1))
            for (x = 1:X)
                for (y = 1:Y)
                    Mcentrales(p+1,q+1,k) = Mcentrales(p+1,q+1,k) + ((x - xraya)^p)*((y - yraya)^q)*imagen(x,y,k);
                end
            end
        end
    end
    
    %% Momentos normales
    
    for (p = 0:(P-1))
        for (q = 0:(Q-1))
            if(p+q >= 2)
                Mnormales(p+1,q+1,k) = Mcentrales(p+1,q+1,k)/(Mcentrales(1,1,k)^(1+(p+q)/2));
            else
                Mnormales(p+1,q+1,k) = 0;
            end
        end
    end
    
    %% Momentos invariantes de Hu
    Mn02 = Mnormales(1,3,k);
    Mn03 = Mnormales(1,4,k);
    Mn11 = Mnormales(2,2,k);
    Mn12 = Mnormales(2,3,k);
    Mn20 = Mnormales(3,1,k);
    Mn21 = Mnormales(3,2,k);
    Mn30 = Mnormales(4,1,k);
    
    MHu(1,1,k) = Mn20 + Mn02;
    MHu(1,2,k) = (Mn20 - Mn02)^2 + 4*Mn11^2;
    MHu(1,3,k) = (Mn30 - 3*Mn12)^2 + (3*Mn21 - Mn03)^2;
    MHu(1,4,k) = (Mn30 + Mn12)^2 + (Mn21 + Mn03)^2;
    MHu(1,5,k) = (Mn30 - 3*Mn12)*(Mn30 + Mn12)*((Mn30 + Mn12)^2 - 3*(Mn21 + Mn03)^2) + (3*Mn21 - Mn03)*(Mn21 + Mn03)*(3*(Mn30 + Mn12)^2 - (Mn21 + Mn03)^2);
    MHu(1,6,k) = (Mn20 - Mn02)*((Mn30 + Mn12)^2 - (Mn21 + Mn03)^2) + 4*Mn11*(Mn30 + Mn12)*(Mn21 + Mn03);
    MHu(1,7,k) = (3*Mn21 - Mn03)*(Mn30 + Mn12)*((Mn30 + Mn12)^2 - 3*(Mn21 + Mn03)^2) - (Mn30 - 3*Mn12)*(Mn21 + Mn03)*(3*(Mn30 + Mn12)^2 - (Mn21 + Mn03)^2);
    
    
    %disp(['MHu Nº ' num2str(k)])
    disp(['[',num2str(MHu(1,1,k)),',',num2str(MHu(1,2,k)),',',num2str(MHu(1,3,k)),',',num2str(MHu(1,4,k)),',',num2str(MHu(1,5,k)),',',num2str(MHu(1,6,k)),',',num2str(MHu(1,7,k)),'];']);
end
    if (opcion == 2)
        Base_de_Datos(MHu,filtro,opcion,vector_elemento);
    else
        Knn
    %Knn(MHu(1,:,k));

end
end
