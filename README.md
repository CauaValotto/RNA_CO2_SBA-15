# RNA_CO2_SBA-15
Modelo de Rede Neural (MLP) em MATLAB para prever a adsorção de CO₂ em sílicas SBA-15, visando a otimização de materiais para captura de carbono

Este repositório contém todos os arquivos e dados do meu projeto final para o curso de extensão "Redes Neurais Aplicadas a Processos Químicos" da UNIFESP. O projeto consiste no desenvolvimento de um modelo de Rede Neural (Multilayer Perceptron - MLP) para prever a capacidade de adsorção de CO₂ em sílicas mesoporosas do tipo SBA-15.

#Objetivo do Projeto

O objetivo principal foi desenvolver um modelo de Inteligência Artificial capaz de funcionar como uma ferramenta de triagem virtual. A ideia é acelerar a descoberta de novos materiais para captura de carbono, prevendo seu desempenho antes mesmo da necessidade de síntese em laboratório, o que economiza tempo e recursos.

#Estrutura dos Arquivos

Aqui está uma descrição de cada arquivo presente neste repositório:

* Scripts MATLAB (`.m`)**
    * `Script_RNA_Regressao.m`: Script Principal - Este é o arquivo principal do projeto. Ele carrega os dados, define a arquitetura da rede neural, realiza o treinamento e executa as simulações.
    * `Correlograma_projeto.m`: Script utilizado para gerar a matriz de correlação entre as variáveis do estudo.
    * `plotCorrelograma.m`: Script auxiliar para plotar o correlograma de forma visual.

* Dados (`.xlsx`, `.mat`)**
    * `Dados.xlsx`: Planilha principal com todos os dados experimentais compilados, utilizados para treinar e validar o modelo.
    * `Organização dos dados.xlsx`: Planilha de apoio que detalha a estruturação e separação dos dados para as etapas do projeto.
    * `Mg-SBA-15-CO2-293K.mat` e `MgK_SBA_15_313K.mat`: Arquivos de dados do MATLAB contendo as duas isotermas que foram completamente separadas para a etapa final de simulação, testando a capacidade de generalização do modelo.

* Documentação (`.pdf`)**
    * `Apresentação Redes (1).pdf`: A apresentação de slides utilizada na defesa final do projeto, contendo os gráficos e resultados.
    * `zukal2013.pdf`: O artigo científico original de Zukal, A., Pastva, J., & Čejka, J. (2013), de onde os dados experimentais foram extraídos.

# Como Utilizar

1.  Pré-requisitos: É necessário ter o MATLAB instalado com a toolbox "Deep Learning Toolbox".
2.  Execução: Abra o arquivo `Script_RNA_Regressao.m` no MATLAB.
3.  Assegure-se de que todos os arquivos de dados (`.xlsx` e `.mat`) estejam na mesma pasta ou que o caminho até eles esteja correto dentro do script.
4.  Execute o script para treinar o modelo, visualizar os gráficos de performance e rodar as simulações.

# Referencia e Agradecimentos

Os dados experimentais utilizados neste trabalho foram extraídos do seguinte artigo:
Zukal, A., Pastva, J., & Čejka, J. (2013). MgO-modified mesoporous silicas impregnated by potassium carbonate for carbon dioxide adsorption*. Microporous and Mesoporous Materials, 167, 44–50
DOI: http://dx.doi.org/10.1016/j.micromeso.2012.05.026

Agradecimentos ao Prof. Dr. Tiago Dias Martins e à UNIFESP pela oportunidade e orientação durante o curso.
