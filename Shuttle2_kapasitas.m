function Shuttle2_kapasitas(sisa,sortedIndices,optimal_population,i,halte,startTime,p_bus,jarak_halte,kecepatan,kap_bus,waktu_penumpang)

elapsedTime = toc(startTime);
p_halte = populasihalte(i);
p_turun = randi([0, p_bus(2)]);

if elapsedTime > 180 || sisa(1) > 0
    fprintf('Shuttle 2 keluar garasi\n');
    fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', halte{i}, p_halte);
    
    if sisa(1) > 0
        fprintf('Pemberhentian selanjutnya adalah halte %s.\n', halte{sortedIndices(1)});
    else
        fprintf('Pemberhentian selanjutnya adalah halte %s.\n', halte{sortedIndices(2)});
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
            fprintf('Urutan halte terdekat setelah ini adalah: %s, jaraknya %dm \n', halte{i+1}, jarak_halte(i+2));
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