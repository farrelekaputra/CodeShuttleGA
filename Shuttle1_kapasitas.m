function Shuttle1_kapasitas(optimal_population, i, halte, startTime, p_bus, jarak_halte, kecepatan, kap_bus, waktu_penumpang, populasiHalte)
            p_halte = populasiHalte(i);

            if i < length(halte)
                next_halte = halte{i};
            else
                next_halte = halte{i};
            end

            fprintf('Jumlah penumpang yang menunggu di %s adalah: %d orang.\n', next_halte, p_halte);
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
end