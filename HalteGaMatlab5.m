function [output] = HalteGaMatlab5()
    % variabel yang dibutuhkan
    PopSize = 15;
    JumGen = 20;
    CrossoverRate = 0.8;
    MutationRate = 0.02;

    % mulai inisialisasi populasi
    Populasi = randi([0, 20], PopSize, 1);

    % Inisialisasi target
    target = randi([0, 16], PopSize, 1);

    for gen = 1:JumGen
        % evaluasi populasi
        Fitness = EvaluasiPopulasi(Populasi, target); % Penambahan target sebagai argumen
    
        % seleksi populasi
        [parents1, parents2] = SeleksiParent(Populasi, Fitness);

        % crossover
        children = crossover(parents1, parents2, CrossoverRate);

        % mutasi
        children = mutasi(children, MutationRate);

        % seleksi
       Populasi = seleksi_survivor(Populasi, children, Fitness, target);

        % Plot populasi
        plot_populasi(Populasi, gen, target); % Penambahan target sebagai argumen
        bestPopulation = Populasi;
    end

    output = bestPopulation;
end

function fitness = EvaluasiPopulasi(Populasi, target) % Penambahan target sebagai parameter
    fitness = -abs(Populasi - target);
end

% Parent selection
function [parents1, parents2] = SeleksiParent(Populasi, Fitness)
    PopSize = size(Populasi, 1);
    parents1 = Populasi(seleksi_tournamen(Fitness, PopSize), :);
    parents2 = Populasi(seleksi_tournamen(Fitness, PopSize), :);
end

function indices = seleksi_tournamen(Fitness, n)
    PopSize = size(Fitness, 1);
    indices = zeros(n, 1);
    for i=1:n
        idx = randperm(PopSize, 2);
        [~,I] = max(Fitness(idx));
        indices(i) = idx(I);
    end
end

% Crossover
function children = crossover(parents1, parents2, crossoverRate)
    PopSize = size(parents1, 1);
    children = parents1;
    for i = 1:PopSize
        if rand() < crossoverRate
            alpha = rand();
            childValue = alpha * parents1(i) + (1 - alpha) * parents2(i);
            children(i) = round(childValue);
        end
    end
end

%mutasi
function children = mutasi(children, mutationRate)
    PopSize = size(children, 1);
    for i = 1:PopSize
        if rand() < mutationRate
            children(i) = round(children(i) + 0.1*randn());
        end
    end
end

% seleksi survivor
function Populasi = seleksi_survivor(Populasi, children, Fitness, target)
    combinedPopulasi = [Populasi; children];
    combinedFitness = [Fitness; EvaluasiPopulasi(children, target)];
    [~,I] = sort(combinedFitness, 'descend');
    Populasi = combinedPopulasi(I(1:size(Populasi, 1)));
end

function plot_populasi(Populasi, gen, target)
    x = 1:length(Populasi);
    y = Populasi;

    plot(x, y, 'b*-'); 
    hold on;
    for i = 1:length(target)
        line([i i], [0, target(i)], 'color', 'red', 'LineStyle', '-'); 
    end
    hold off;
    title([' ']);
    ylim([0, max(Populasi) + 1]);
    ylabel('Many Passengers');
    xlabel('Bus Stop');
end