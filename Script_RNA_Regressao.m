clearvars; clc; 

%%
simula = 'sim'; %'sim' ou 'nao'
saidasimul = 'sim'; % 'sim' ou 'nao'

%%
%  Leitura dos dados que est�o na planilha Dados.xlsx

ent_rede = xlsread('Dados.xlsx','ent_rede');                          
ent_rede = ent_rede';

sai_rede = xlsread('Dados.xlsx','sai_rede');                          
sai_rede = sai_rede';

if simula == 'sim'
    ent_simula = xlsread('Dados.xlsx','ent_simula');                          
    ent_simula = ent_simula';
    
    if saidasimul == 'sim'
        sai_simula = xlsread('Dados.xlsx','sai_simula');                          
        sai_simula = sai_simula';
    end
end 

%% COMANDO QUE GERA A RNA e CONFIGURA��ES DO TREINAMENTO

net = newff(ent_rede,sai_rede,[6 3 5],{'tansig' 'tansig' 'tansig' 'purelin'}, 'trainlm');

net.trainParam.epochs =30000;           %N�mero m�ximo de itera��es
net.trainParam.max_fail = 1000;         %m�ximo de checagem na valida��o, crit�rio de parada 
net.trainParam.goal = 1e-9;             %erro m�ximo tolerado, crit�rio de parada
net.divideParam.trainRatio = 0.70;
net.divideParam.valRatio   = 0.15;
net.divideParam.testRatio  = 0.15;

% COMANDO: net = newff(entrada,sa�da,[neur.1�.camadaoculta neur.2�.camada.oculta neur.3�.camada.oculta],
%{'f.ativ.1�.camada.oculta' 'f.ativ.2�.camada.oculta' 'f.ativ.n�.camada.oculta' 'f.ativ.camada.saida'},
%'algorit.otimiza��o')

%net � o nome do modelo

%%
% Treinamento da rede

[net,tr] = train(net, ent_rede, sai_rede);

% Constru��o de Gr�ficos

figure(1)
plotperform(tr)

treino_exp_ent=ent_rede(:,tr.trainInd);
valid_exp_ent=ent_rede(:,tr.valInd);
teste_exp_ent=ent_rede(:,tr.testInd);

treino_exp_sai=sai_rede(:,tr.trainInd);
valid_exp_sai=sai_rede(:,tr.valInd);
teste_exp_sai=sai_rede(:,tr.testInd);

%Resultados treinamento
treino_RNA = sim(net,treino_exp_ent);
treino_FOBJ = mse(treino_exp_sai-treino_RNA);
for i=1:size(sai_rede,1);
    e=abs(treino_RNA(i,:) - treino_exp_sai(i,:));
    e=e./treino_exp_sai(i,:);
    treino_ERRO(i)=100*sum(e)/size(tr.trainInd,2);
    cor = corrcoef(treino_RNA(i,:),treino_exp_sai(i,:));
    treino_CORR(i) = cor(1,2);
end


figure(2)
[m1,b1,r1] = postreg(treino_RNA,treino_exp_sai);
title('REGRESS�O - TREINAMENTO')
xlabel('EXPERIMENTAL') % VALORES x-axis 
ylabel('RNA') % VALORES y-axis

%Resultados valida��o
valid_RNA = sim(net,valid_exp_ent);
valid_FOBJ = mse(valid_exp_sai-valid_RNA);
for i=1:size(sai_rede,1);
    e=abs(valid_RNA(i,:) - valid_exp_sai(i,:));
    e=e./valid_exp_sai(i,:);
    valid_ERRO(i)=100*sum(e)/size(tr.valInd,2);
    cor = corrcoef(valid_RNA(i,:),valid_exp_sai(i,:));
    valid_CORR(i) = cor(1,2);
end

figure(3)
[m1,b1,r1] = postreg(valid_RNA,valid_exp_sai);
title('REGRESS�O - VALIDA��O')
xlabel('EXPERIMENTAL') % VALORES x-axis 
ylabel('RNA') % VALORES y-axis

%Dados teste
teste_RNA = sim(net,teste_exp_ent);
teste_FOBJ = mse(teste_exp_sai-teste_RNA);

for i=1:size(sai_rede,1);
    e=abs(teste_RNA(i,:) - teste_exp_sai(i,:));
    e=e./teste_exp_sai(i,:);
    teste_ERRO(i)=100*sum(e)/size(tr.testInd,2);
    cor = corrcoef(teste_RNA(i,:),teste_exp_sai(i,:));
    teste_CORR(i) = cor(1,2);
end

figure(4)
[m1,b1,r1] = postreg(teste_RNA,teste_exp_sai);
title('REGRESS�O - TESTE')
xlabel('EXPERIMENTAL') % VALORES x-axis 
ylabel('RNA') % VALORES y-axis

% SIMULA��O

if simula == 'sim'
    sai_simula_RNA = sim(net,ent_simula);
    
    if saidasimul == 'sim'
        for i=1:size(sai_rede,1);
          e=abs(sai_simula_RNA(i,:) - sai_simula(i,:));
          e=e./sai_simula(i,:);
          simula_ERRO(i)=100*sum(e)/size(sai_simula,2);
          cor = corrcoef(sai_simula_RNA(i,:),sai_simula(i,:));
          simula_CORR(i) = cor(1,2);
        end   
        
    figure(5)
    [m2,b2,r2] = postreg(sai_simula_RNA,sai_simula);
    title('REGRESS�O SIMULA��O')
    xlabel('EXPERIMENTAL') % VALORES x-axis 
    ylabel('RNA') % VALORES y-axis

    end
end



% Pesos e bias das camadas escondidas e camada de sa�da

pesoscam1 = net.IW;                 % display dos pesos layer 1
pesosdemaiscam = net.LW;            % display dos pesos demais camadas (incluindo de sa�da)
bias = net.b;                       % display os bias de todas as camadas

pesos{1,1}=pesoscam1{1,1};

for i=2:size(pesosdemaiscam,1)
    pesos{i,1}=pesosdemaiscam{i,i-1};
end
    
if simula == 'sim';
sai_simula_RNA = sai_simula_RNA';
end
teste_exp_ent = teste_exp_ent';
teste_exp_sai = teste_exp_sai';
treino_exp_ent = treino_exp_ent';
treino_exp_sai = treino_exp_sai';
valid_exp_ent = valid_exp_ent';
valid_exp_sai = valid_exp_sai';
teste_RNA = teste_RNA';
treino_RNA = treino_RNA';
valid_RNA = valid_RNA';


clearvars -except net ent_rede sai_rede ent_simula sai_simula bias pesos teste_CORR teste_ERRO teste_FOBJ teste_RNA teste_exp_ent...
    teste_exp_sai tr treino_CORR treino_ERRO treino_FOBJ treino_RNA treino_exp_ent treino_exp_sai ...
    valid_CORR valid_ERRO valid_FOBJ valid_RNA valid_exp_ent valid_exp_sai simula_CORR simula_ERRO sai_simula_RNA



'FIM. Salvar o workspace antes de treinar outra estrutura'
