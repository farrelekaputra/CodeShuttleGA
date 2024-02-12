function Shuttle3_kapasitas(sisa,sortedIndices,optimal_population,startTime,i,halte,p_bus,jarak_halte,kecepatan,kap_bus,waktu_penumpang)
p_halte = randi([0, 15]);
p_turun = randi([0, p_bus(3)]);
elapsedTime = toc(startTime);

if elapsedTime >= 240 || sisa(1) > 0
    fprintf('Shuttle 3 keluar garasi\n');
    fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', halte{i+1}, p_halte);
    
    if sisa(1) > 0
        fprintf('Pemberhentian selanjutnya adalah halte %s\n', halte{sortedIndices(2)});
    else
        fprintf('Pemberhentian selanjutnya adalah halte %s\n', halte{sortedIndices(1)});
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

elseif elapsedTime <= 240 || sisa(1) == 0
    fprintf('Shuttle 3 saat ini masih di garasi\n');
elseif elapsedTime >= 240 || p_halte == 0 || p_turun == 0
    fprintf('Melewati %s karena tidak ada penumpang\n', halte{i+1});
end