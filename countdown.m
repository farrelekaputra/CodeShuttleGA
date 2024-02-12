function countdown(seconds)
    % Fungsi untuk menampilkan countdown

    for k = seconds:-1:1
        % Convert seconds to hours, minutes, seconds format
        [hours, mins, secs] = hms(k); 

        % Print the time
        fprintf('%02d:%02d:%02d\n', hours, mins, secs);
        
        pause(1); % Jeda selama 1 detik
    end
end

function [hours, mins, secs] = hms(sec)
    % Konversi detik ke jam, menit, dan detik

    hours = floor(sec/3600);
    secs_left = mod(sec,3600);
    mins = floor(secs_left/60);
    secs = floor(mod(secs_left,60));
end