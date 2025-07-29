%% SCRIPT PRINCIPAL PARA ANÁLISE DE CORRELAÇÃO
%--------------------------------------------------------------------------
% Este script principal carrega os dados e chama a função 'plotCorrelograma'
% para gerar o gráfico de correlação.
%
% Certifique-se de que este arquivo, o arquivo 'plotCorrelograma.m' e o
% arquivo 'Dados.xlsx' estejam na mesma pasta.
%--------------------------------------------------------------------------

clearvars; clc; close all;

%% 1. LEITURA E PREPARAÇÃO DOS DADOS
%--------------------------------------------------------------------------
try
    ent_rede = xlsread('Dados.xlsx', 'ent_rede');
    sai_rede = xlsread('Dados.xlsx', 'sai_rede');
catch ME
    error('Erro ao ler o arquivo "Dados.xlsx". Verifique se o arquivo está na pasta e se as abas "ent_rede" e "sai_rede" existem. Detalhe: %s', ME.message);
end

% Garante que os dados estejam no formato (amostras x variáveis)
if size(ent_rede, 2) > size(ent_rede, 1)
    ent_rede = ent_rede';
end
if size(sai_rede, 2) > size(sai_rede, 1)
    sai_rede = sai_rede';
end

% Combina os dados de entrada e saída em uma única matriz
dados_completos = [ent_rede, sai_rede];

% Define os nomes das variáveis (7 entradas + 1 saída)
nomes_variaveis = { ...
    'Temperatura', ...
    'Pressao', ...
    'MgO', ...
    'K2CO3', ...
    'Sbet', ...
    'Vme', ...
    'Dme', ...
    'AdsorcaoTotal' ...
};

%% 2. CHAMADA DA FUNÇÃO PARA GERAR O GRÁFICO
%--------------------------------------------------------------------------
% A linha abaixo executa a sua função 'plotCorrelograma', passando os
% dados e os nomes como argumentos.
%--------------------------------------------------------------------------
plotCorrelograma(dados_completos, nomes_variaveis);

