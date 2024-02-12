clear
clc

optimal_population = HalteGaMatlab5();

startTime = tic;
elapsedTime = toc(startTime);
awal = 0;
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

while putaran < banyak_putaran
    for i = 1:length(halte)
        
        disp('shuttle yang beroperasi ada : 3');

        fprintf('\n\n   --- Pengumuman pada shuttle 1 ---\n');
            
        p_halte = optimal_population(i);
        
        if i < length(halte)
            next_halte = halte{i};
        else
            next_halte = halte{i};
        end

        fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', next_halte, p_halte);
        disp(p_bus(1));
        p_bus_value = round(p_bus(1));

        if p_bus_value <= 0
            p_turun = 0;
        else
            p_turun = randi([1, p_bus_value]);
        end

        jarak = jarak_halte(i);
        
        if p_halte == 0 && p_turun == 0
            fprintf('Melewati karena tidak ada penumpang.\n');
        else
            if i < length(halte)
                next_halte = halte{i+1};
            else
                next_halte = halte{i};
            end

            fprintf('Pemberhentian selanjutnya adalah %s.\n', next_halte);
            p_bus(1) = p_bus(1) + p_halte;
                
                if p_bus(1) > 13
                    sisa(1) = p_bus(1) - 13;
                    fprintf('Mohon maaf, shuttle 1 sudah penuh. \n%d penumpang bisa menunggu shuttle 2.\n', sisa(1));
                    waktu_tunda = (p_turun + p_halte) * waktu_penumpang;
                    fprintf('Halte terdekat setelah ini adalah: halte %s, jaraknya %dm.\n', halte{i}, jarak);
                    fprintf('Shuttle 1 akan berangkat ke %s setelah:\n', halte{i});
                    countdown(waktu_tunda);
                    w_datang = (jarak / kecepatan) + waktu_tunda;
                    fprintf('Shuttle 1 akan sampai di %s dalam:\n', halte{i });
                    countdown(w_datang);
                    p_bus(1) = p_bus(1) - sisa(1);
                    fprintf('Jumlah penumpang di shuttle 1 saat ini adalah: %d.\n', kap_bus);
                elseif p_bus(1) <= 13
                    fprintf('Jumlah penumpang di shuttle saat ini adalah: %d.\n', p_bus(1));
                    waktu_tunda = (p_turun + p_halte) * waktu_penumpang;
                    fprintf('Halte terdekat setelah ini adalah: %s, jaraknya %dm.\n', halte{i+1}, jarak);
                    fprintf('Shuttle 1 akan berangkat setelah:\n');
                    countdown(waktu_tunda);
                    w_datang = (jarak / kecepatan) + waktu_tunda;
                    fprintf('Shuttle 1 akan sampai di %s dalam:\n', halte{i+1});
                    countdown(w_datang);
                end
        end

        % Untuk shuttle 2
        fprintf('\n\n   --- Pengumuman pada shuttle 2 ---\n');

p_halte = randi([0, 15]);
p_turun = randi([0, p_bus(2)]);

if elapsedTime >= 180 || sisa(1) > 0
    fprintf('Shuttle 2 keluar garasi\n');
    fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', halte{i}, p_halte);
    
    if sisa(1) > 0
        fprintf('Pemberhentian selanjutnya adalah halte %s.\n', halte{i});
    else
        fprintf('Pemberhentian selanjutnya adalah halte %s.\n', halte{i});
    end

    if p_bus(2) > 0
        fprintf('Jumlah penumpang yang akan turun ada %d\n', p_turun);
        p_bus(2) = p_bus(2) - p_turun;
    end

    p_bus(2) = p_bus(2) + sisa(1);
    fprintf('Jumlah penumpang di %s saat ini ada %d orang\n', halte{i}, p_halte);
    p_bus(2) = p_bus(2) + p_halte;
    if p_bus(2) > 13
        sisa(2) = p_bus(2) - 13;
        fprintf('Mohon maaf, shuttle 2 sudah penuh. \n%d penumpang bisa menunggu shuttle 3\n', sisa(2));
        waktu_tunda = (p_turun + p_halte) * waktu_penumpang;
        
        if sisa(1) > 1
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm \n', halte{i+1}, jarak_halte(i+2));
            fprintf('Shuttle 2 akan berangkat ke %s setelah : \n', halte{i+1});
            countdown(waktu_tunda);
            w_datang = (jarak / kecepatan) + waktu_tunda;
            fprintf('Shuttle 2 akan sampai di %s dalam : \n', halte{i+1});
            countdown(w_datang);
        else
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm \n', halte{i}, jarak_halte(i));
            fprintf('Shuttle 2 akan berangkat ke %s setelah : \n', halte{i});
            countdown(waktu_tunda);
            w_datang = (jarak / kecepatan) + waktu_tunda;
            fprintf('Shuttle 2 akan sampai di %s dalam : \n', halte{i});
            countdown(w_datang);
        end
        p_bus(2) = p_bus(2) - sisa(2);
        fprintf('Penumpang yang ada di shuttle 2 saat ini adalah %d orang\n', kap_bus);
    elseif p_bus(2) <= 13
        fprintf('Jumlah penumpang di shuttle 2 saat ini adalah %d penumpang\n', p_bus(2));
        waktu_tunda = (p_turun + p_halte) * waktu_penumpang;
        if sisa(1) > 1
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm \n', halte{i+1}, jarak_halte(i+1));
            fprintf('Shuttle 2 akan berangkat ke %s setelah : \n', halte{i+1});
            countdown(waktu_tunda);
            w_datang = (jarak / kecepatan) + waktu_tunda;
            fprintf('Shuttle 2 akan sampai di %s dalam : \n', halte{i+2});
            countdown(w_datang);
        else
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm \n', halte{i}, jarak_halte(i));
            fprintf('Shuttle 2 akan berangkat ke %s setelah : \n', halte{i});
            countdown(waktu_tunda);
            w_datang = (jarak / kecepatan) + waktu_tunda;
            fprintf('Shuttle 2 akan sampai di %s dalam : \n', halte{i});
            countdown(w_datang);
        end
    end

elseif elapsedTime < 180 || sisa(1) == 0
    fprintf('Shuttle 2 saat ini masih di garasi\n');
elseif elapsedTime >= 180 || p_halte == 0 || p_turun == 0
    fprintf('Melewati %s karena tidak ada penumpang\n', halte{i+1});
end


fprintf('\n\n   --- Pengumuman pada shuttle 3 ---\n');
p_halte = randi([0, 15]);
p_turun = randi([0, p_bus(3)]);

if elapsedTime >= 240 || sisa(1) > 0
    fprintf('Shuttle 3 keluar garasi\n');
    fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', halte{i+1}, p_halte);
    
    if sisa(1) > 0
        fprintf('Pemberhentian selanjutnya adalah halte %s\n', halte{i+1});
    else
        fprintf('Pemberhentian selanjutnya adalah halte %s\n', halte{i});
    end
    
    if p_bus(3) > 0
        fprintf('Jumlah penumpang yang akan turun ada %d\n', p_turun);
        p_bus(3) = p_bus(3) - p_turun;
    end

    p_bus(3) = p_bus(3) + sisa(1);
    fprintf('Jumlah penumpang di %s saat ini ada %d orang\n', halte{i+1}, p_halte);
    p_bus(3) = p_bus(3) + p_halte;

    if p_bus(3) > 13
        sisa(2) = p_bus(3) - 13;
        fprintf('Mohon maaf, penumpang shuttle 3 sudah penuh. \n%d penumpang bisa menunggu shuttle 3\n', sisa(2));
        waktu_delay = (p_turun + p_halte) * waktu_penumpang;
        
        if sisa(1) > 1
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm\n', halte{i+1}, jarak_halte(i+1));
            fprintf('Shuttle 3 akan berangkat ke %s setelah:\n', halte{i+1});
            countdown(waktu_delay);
            w_datang = floor(jarak_halte(i) / kecepatan) + waktu_delay;
            fprintf('Shuttle 3 akan sampai di %s dalam:\n', halte{i+1});
            countdown(w_datang);
            p_bus(3) = p_bus(3) - sisa(2);
            fprintf('Jumlah penumpang di shuttle 3 saat ini adalah: %d.\n', kap_bus);
        else
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm\n', halte{i}, jarak_halte(i));
            fprintf('Shuttle 3 akan berangkat ke %s setelah:\n', halte{i});
            countdown(waktu_delay);
            w_datang = floor(jarak_halte(i) / kecepatan) + waktu_delay;
            fprintf('Shuttle 3 akan sampai di %s dalam:\n', halte{i});
            countdown(w_datang);
            p_bus(3) = p_bus(3) - sisa(2);
            fprintf('Jumlah penumpang di shuttle 3 saat ini adalah: %d.\n', kap_bus);
        end

    elseif p_bus(3) <= 13
        fprintf('Jumlah penumpang di shuttle 3 saat ini adalah: %d.\n', p_bus(3));
        waktu_delay = (p_turun + p_halte) * waktu_penumpang;
        
        if sisa(1) > 1
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm\n', halte{i+1}, jarak_halte(i+1));
            fprintf('Shuttle 3 akan berangkat ke %s setelah:\n', halte{i+1});
            countdown(waktu_delay);
            w_datang = floor(jarak_halte(i) / kecepatan) + waktu_delay;
            fprintf('Shuttle 3 akan sampai di %s dalam:\n', halte{i+1});
            countdown(w_datang);
        else
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm\n', halte{i}, jarak_halte(i));
            fprintf('Shuttle 3 akan berangkat ke %s setelah:\n', halte{i});
            countdown(waktu_delay);
            w_datang = floor(jarak_halte(i) / kecepatan) + waktu_delay;
            fprintf('Shuttle 3 akan sampai di %s dalam:\n', halte{i});
            countdown(w_datang);
        end
    end

elseif elapsedTime < 240 || sisa(1) == 0
    fprintf('Shuttle 3 saat ini masih di garasi\n');
elseif elapsedTime >= 240 || p_halte == 0 || p_turun == 0
    fprintf('Melewati %s karena tidak ada penumpang\n', halte{i+1});
end
fprintf('\nJumlah penumpang di masing-masing shuttle adalah \nshuttle 1   : %d\nshuttle 2   : %d\nshuttle 3   : %d\n', p_bus(1), p_bus(2), p_bus(3));
fprintf('\n -------------------------------------------------- \n');

    end
 i = i + 1;
if i > 14
    i = 1;
fprintf('Kembali ke halte 1. \n');

putaran = putaran + 1;
end

end

output = HalteGaMatlab5();