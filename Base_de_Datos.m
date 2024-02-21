function Base_de_Datos(MHu,filtro,opcion,vector_elemento)

load("Momentos_Hu.mat");
    for (i = 1:4)
        if (vector_elemento(i) == 1)
            tornillo = MHu(:,:,i);
        elseif(vector_elemento(i) == 2)
            clavo = MHu(:,:,i);
        elseif(vector_elemento(i) == 3)
            tuerca = MHu(:,:,i);
        elseif(vector_elemento(i) == 4)
            arandela = MHu(:,:,i);
        end
    end

    if (filtro == 1)    %ADF
        tornillos_ADF = [tornillos_ADF;tornillo];
        clavos_ADF = [clavos_ADF;clavo];
        tuercas_ADF = [tuercas_ADF;tuerca];
        arandelas_ADF = [arandelas_ADF;arandela];
    elseif(filtro == 2) %PB
        tornillos_PB = [tornillos_PB;tornillo];
        clavos_PB = [clavos_PB;clavo];
        tuercas_PB = [tuercas_PB;tuerca];
        arandelas_PB = [arandelas_PB;arandela];
    elseif(filtro == 3) %Bin
        tornillos_Bin = [tornillos_Bin;tornillo];
        clavos_Bin = [clavos_Bin;clavo];
        tuercas_Bin = [tuercas_Bin;tuerca];
        arandelas_Bin = [arandelas_Bin;arandela];
    elseif(filtro == 4) %ADF+Bin
        tornillos_ADF_Bin = [tornillos_ADF_Bin;tornillo];
        clavos_ADF_Bin = [clavos_ADF_Bin;clavo];
        tuercas_ADF_Bin = [tuercas_ADF_Bin;tuerca];
        arandelas_ADF_Bin = [arandelas_ADF_Bin;arandela];
    elseif(filtro == 5) %PB+Bin
        tornillos_PB_Bin = [tornillos_PB_Bin;tornillo];
        clavos_PB_Bin = [clavos_PB_Bin;clavo];
        tuercas_PB_Bin = [tuercas_PB_Bin;tuerca];
        arandelas_PB_Bin = [arandelas_PB_Bin;arandela];
    elseif(filtro == 6) %ADF+Med+Bin
        tornillos_ADF_Med_Bin = [tornillos_ADF_Med_Bin;tornillo];
        clavos_ADF_Med_Bin = [clavos_ADF_Med_Bin;clavo];
        tuercas_ADF_Med_Bin = [tuercas_ADF_Med_Bin;tuerca];
        arandelas_ADF_Med_Bin = [arandelas_ADF_Med_Bin;arandela];
    elseif(filtro == 7) %PB+Med+Bin
        tornillos_PB_Med_Bin = [tornillos_PB_Med_Bin;tornillo];
        clavos_PB_Med_Bin = [clavos_PB_Med_Bin;clavo];
        tuercas_PB_Med_Bin = [tuercas_PB_Med_Bin;tuerca];
        arandelas_PB_Med_Bin = [arandelas_PB_Med_Bin;arandela];
    end

    save('Momentos_Hu.mat', 'tornillos_ADF','tornillos_PB','tornillos_Bin','tornillos_ADF_Bin','tornillos_PB_Bin','tornillos_ADF_Med_Bin','tornillos_PB_Med_Bin','clavos_ADF','clavos_PB','clavos_Bin','clavos_ADF_Bin','clavos_PB_Bin','clavos_ADF_Med_Bin','clavos_PB_Med_Bin','arandelas_ADF','arandelas_PB','arandelas_Bin','arandelas_ADF_Bin','arandelas_PB_Bin','arandelas_ADF_Med_Bin','arandelas_PB_Med_Bin','tuercas_ADF','tuercas_PB','tuercas_Bin','tuercas_ADF_Bin','tuercas_PB_Bin','tuercas_ADF_Med_Bin','tuercas_PB_Med_Bin');
end



