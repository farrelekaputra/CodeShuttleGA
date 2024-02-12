clear;
clc;

startTime = tic;
optimal_population = HalteGaMatlab5();
jarak_halte = [450, 200, 200, 270, 240, 600, 130, 240, 600, 130, 240, 110, 350, 80, 350, 130, 80];
kap_bus = 13;
halte = {'halte 1', 'halte 2', 'halte 3', 'halte 4', 'halte 5', 'halte 6', 'halte 7', 'halte 8', 'halte 9', 'halte 10', 'halte 11', 'halte 12', 'halte 13', 'halte 14'};
p_bus = [0, 0, 0];
sisa = [0, 0, 0];
putaran = 0;
waktu_penumpang = 3;
kecepatan = randi([20, 35]);
waktu_tunda = 0;
banyak_putaran = 5;

[optimal_population, sortedIndices] = sort(HalteGaMatlab5(), 'descend');

while putaran < banyak_putaran
    for index = 1:length(sortedIndices)
        sisa = [0,0,0];
        i = sortedIndices(index);
        
        % memanggil fungsi untuk program shuttle 1
        fprintf('\n\n --- Pengumuman pada shuttle 1 ---\n');
       Shuttle1_kapasitas(optimal_population, i, halte, startTime, p_bus, jarak_halte, kecepatan, kap_bus, waktu_penumpang, optimal_population);
        
        % memanggil fungsi untuk program shuttle 2
        fprintf('\n\n --- Pengumuman pada shuttle 2 ---\n');
        Shuttle2_kapasitas(sisa,sortedIndices,optimal_population,i,startTime,halte,p_bus,jarak_halte,kecepatan,kap_bus,waktu_penumpang);
        
        % memanggil fungsi untuk program shuttle 3
        fprintf('\n\n   --- Pengumuman pada shuttle 3 ---\n');
        Shuttle3_kapasitas(sisa,sortedIndices,optimal_population,i,startTime,halte,p_bus,jarak_halte,kecepatan,kap_bus,waktu_penumpang);


    end
    fprintf('\nJumlah penumpang di masing-masing shuttle adalah \nshuttle 1   : %d\nshuttle 2   : %d\nshuttle 3   : %d\n', p_bus(1), p_bus(2), p_bus(3));
    fprintf('\n -------------------------------------------------- \n');
    putaran = putaran + 1;
end

output = HalteGaMatlab5();
