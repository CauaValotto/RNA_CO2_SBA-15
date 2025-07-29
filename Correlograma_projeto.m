%% SCRIPT PRINCIPAL PARA AN�LISE DE CORRELA��O
%--------------------------------------------------------------------------
% Este script principal carrega os dados e chama a fun��o 'plotCorrelograma'
% para gerar o gr�fico de correla��o.
%
% Certifique-se de que este arquivo, o arquivo 'plotCorrelograma.m' e o
% arquivo 'Dados.xlsx' estejam na mesma pasta.
%--------------------------------------------------------------------------

clearvars; clc; close all;

%% 1. LEITURA E PREPARA��O DOS DADOS
%--------------------------------------------------------------------------
try
    ent_rede = xlsread('Dados.xlsx', 'ent_rede');
    sai_rede = xlsread('Dados.xlsx', 'sai_rede');
catch ME
    error('Erro ao ler o arquivo "Dados.xlsx". Verifique se o arquivo est� na pasta e se as abas "ent_rede" e "sai_rede" existem. Detalhe: %s', ME.message);
end

% Garante que os dados estejam no formato (amostras x vari�veis)
if size(ent_rede, 2) > size(ent_rede, 1)
    ent_rede = ent_rede';
end
if size(sai_rede, 2) > size(sai_rede, 1)
    sai_rede = sai_rede';
end

% Combina os dados de entrada e sa�da em uma �nica matriz
dados_completos = [ent_rede, sai_rede];

% Define os nomes das vari�veis (7 entradas + 1 sa�da)
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

%% 2. CHAMADA DA FUN��O PARA GERAR O GR�FICO
%--------------------------------------------------------------------------
% A linha abaixo executa a sua fun��o 'plotCorrelograma', passando os
% dados e os nomes como argumentos.
%--------------------------------------------------------------------------
plotCorrelograma(dados_completos, nomes_variaveis);

