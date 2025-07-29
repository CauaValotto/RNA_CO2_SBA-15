function plotCorrelograma(featuresNumericas, nomesNumericas)
% plotCorrelograma - Plota uma matriz de correlacao simples (correlograma).
% Compatível com versões mais antigas do MATLAB.
%
% Entradas:
%   featuresNumericas - Matriz numerica com variaveis (amostras x variaveis)
%   nomesNumericas    - Cell array com os nomes das variaveis (1 x n)

    disp('>> Plotando correlograma das variaveis numericas...');

    % Calcula a matriz de correlacao (Pearson)
    matrizCorrelacao = corr(featuresNumericas, 'rows', 'pairwise');

    % Cria a figura com fundo branco
    figure('Name', 'Correlograma - Matriz de Correlacao', ...
           'NumberTitle', 'off', ...
           'Color', [1 1 1]);

    % Exibe a matriz de correlacao como imagem
    imagesc(matrizCorrelacao);
    colormap(jet);      % Escala de cores
    colorbar;           % Barra de cores à direita
    axis square;        % Mantem proporcao quadrada
    caxis([-1, 1]);     % Garante que a escala de cores vá de -1 a 1

    % Define ticks nos eixos
    n = length(nomesNumericas);
    set(gca, 'XTick', 1:n);
    set(gca, 'YTick', 1:n);
    set(gca, 'XTickLabel', nomesNumericas);
    set(gca, 'YTickLabel', nomesNumericas);
    set(gca, 'FontSize', 9);  % Ajusta tamanho da fonte
    % A função xtickangle foi removida para garantir compatibilidade

    % Adiciona os valores numericos nas celulas da matriz
    for i = 1:n
        for j = 1:n
            valor = matrizCorrelacao(i,j);
            texto = sprintf('%.2f', valor);
            % Ajuste de cor do texto: branco se fundo escuro, preto se claro
            if abs(valor) > 0.6
                corTexto = 'w';
            else
                corTexto = 'k';
            end
            text(j, i, texto, ...
                 'HorizontalAlignment', 'center', ...
                 'FontWeight', 'bold', ...
                 'Color', corTexto, ...
                 'FontSize', 9);
        end
    end

    % Titulo do grafico
    title('Correlograma das Variaveis Numericas', 'FontWeight', 'bold');
end