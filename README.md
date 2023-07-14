## Índice

[1. Introdução](#introdução)

[2. Tarefa de negócios](#tarefa-de-negócios)

[3. Dados](#dados)

[4. Processamento e Limpeza](#processamento-e-limpeza)

[5. Análise e Visualização](#análise-e-visualização)

[6. Conclusão e recomendações](#conclusão-e-recomendações)


## Introdução

Este estudo de caso foi elaborado pela Google em parceria com a Coursera, como projeto final para obtenção do [Certificado Profissional Google Data Analytics](https://grow.google/certificates/data-analytics/#?modal_active=none). O cenário consiste na análise dos dados de demanda da empresa de compartilhamento de bicicletas Cyclistic.

A empresa oferta seu serviço de aluguel de bicicletas de duas formas: passes individuais chamados de ciclistas "casuais" e assinaturas anuais chamadas de ciclistas "membros". A empresa conta com cerca de 6.000 bicicletas que circulam por meio de 700 estações nas ciclovias da cidade de Chicago, localizada no estado de Illinois, Estados Unidos.

A busca pela maximização do número de clientes da categoria membros anuais é crucial, pois isso é essencial para impulsionar o crescimento futuro da empresa. A adesão de membros anuais além de contribuir para a fidelização dos clientes, pode significar a garantia de uma base financeira sólida. Os insights obtidos na analise podem desempenhar um papel fundamental no desenvolvimento de estratégias de marketing assertivas, focadas em converter um maior número de usuários casuais em membros anuais.

## Tarefa de negócios

* Como os membros anuais e os ciclistas casuais usam as bicicletas ciclísticas de maneira diferente?

* Por que os usuários casuais iriam querer adquirir planos anuais da Cyclist?

* Como a Cyclist pode usar a mídia digital para influenciar os usuários casuais a se tornarem membros?

>**Objetivo**: Limpar, analisar e visualizar os dados para observar como os ciclistas casuais usam o aluguel de bicicletas de maneira diferente dos ciclistas associados anuais e obter insights.

## Dados

* **Fonte de dados**: Dados públicos da Motivate International Inc. (Serviço de compartilhamento de bicicletas Divvy de Chicago) sob [esta licença](https://ride.divvybikes.com/data-license-agreement);
* [Dados históricos](https://divvy-tripdata.s3.amazonaws.com/index.html) de viagens de ciclistas (de 2013 em diante) disponíveis em no formato **.csv**.
* **Intervalo dos dados da análise**: janeiro a dezembro de 2022 (1 GB, descompactado);
* O conjunto de dados possui registros individuais de uso de bicicletas compartilháveis que constam de data e hora de início e término do passeio, latitude e longitude, informações da estação, tipo de bicicleta e tipo de ciclista (casual/membro).

## Processamento e Limpeza

* Os dados foram baixados para o HD local para manipulação e análise usando o **RStudio**;
* Toda a **documentação e script** do trabalho está [aqui.](https://github.com/welingtonfonsec/Cyclist/blob/main/documentacao%20em%20R/documentacao.R)
* [**Dashboard**](https://app.powerbi.com/view?r=eyJrIjoiN2I4NmE1YTQtOTVkYy00OTk0LTgxNGItYjEzNzBkZTMxNzFhIiwidCI6ImM1ZTg3YmRkLWVkZGQtNDhhNC04ZTAyLTVlNTkzNjkxOGVhZCJ9&pageName=ReportSectionea2d602974fb01cb81f0) desenvolvido no **Microsoft Power BI**;
* Para auxiliar na análise, foram adicionadas 10 novas colunas (data, dia da semana, mês, estação, hora de inicio, hora de fim, tempo total, tempo total em minutos, hora e quilometros percorridos;
* Antes da limpeza, todo o dataset possuia <span style="background-color: #f2f2f2">5.667.717</span> linhas.
* **Processo de limpeza:** No processo foram apagadas:
  * Linhas com nomes de estação inicial e final ausentes encontrados;
  * Outras colunas que não possuiam utilidade para esta análise;
  * Valores de duração de viagem negativos, zerados e abaixo de 1.



>Após a limpeza e consolidação dos dados em uma tabela, foram retornadas 4.270.103 linhas para a análise.


## Análise e Visualização

Foram analisados os dados de viagem de aproximadamente 4.2 milhões de registros de passeio no conjunto de dados final. Para observar tendências diferenciadas entre o uso por usuários casuais e membros anuais, foram desenvolvidas visualizações diretamente no RStudio. Para uma visualização mais dinâmica, feita no **Microsoft Power BI**, clique [aqui.](https://app.powerbi.com/view?r=eyJrIjoiN2I4NmE1YTQtOTVkYy00OTk0LTgxNGItYjEzNzBkZTMxNzFhIiwidCI6ImM1ZTg3YmRkLWVkZGQtNDhhNC04ZTAyLTVlNTkzNjkxOGVhZCJ9&pageName=ReportSectionea2d602974fb01cb81f0)

### Distribuição percentual do total de passeios

<img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/distribuicaopercentual.png" alt="" width="50%">

**Percepções**

* 60% do total de passeios foram feitos por ciclistas membros.
* 40% do total de passeios foram feitos por ciclistas casuais.
* Apesar da maior parte da demanda seja de ciclistas membros, ainda existe um enorme potencial de crescimento. Esse crescimento deve ser via conversão dos casuais em membros. Esse é o foco do longo prazo.

### Distribuição semanal do número de passeios

<img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/distribuicaosemanal.png" alt="" width="50%">

**Percepções**

* É bem evidente que os passeios feitos por ciclistas casuais atingem o pico durante o fim de semana em comparação com os membros anuais, que permanecem relativamente estáveis.
* Ao analisar as médias de ciclistas casuais, é notado que a média do final de semana é em torno de 35% maior que a média de meio de semana. 
* A análise das médias de ciclistas membros nota que a média de final de semana é em em torno de 19% menor que a média do meio de semana.
* Isso pode indicar que os ciclistas casuais priorizam o aluguel de bicicletas para fins de lazer. 

### Distribuição semanal da duração média dos passeios

<img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/mediadaduracaodopasseio.png" alt="" width="50%">

**Percepções**

* A duração média do passeio dos ciclistas casuais é quase o dobro da média dos cisclistas membros.
* A duração média do passeio de ambos os tipos de ciclistas aumenta nos finais de semana.
* Isso pode reforçar a tese de que os ciclistas casuais usam o aluguel de bicicletas priorizando o lazer.


### Duração do passeio x Distância do passeio

</head>
<body>
    <table>
        <tr>
            <td><img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/mediatempomin.png"></td>
            <td><img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/mediakmpercorrido.png"></td>
        </tr>
    </table>
</body>
</html>

**Percepções**

* Os gráficos destacam claramente a diferença entre a média de tempo total do passeio e a média de distância percorrida para cada tipo de usuário.
* Embora ambos os tipos de usuários percorram uma distância média semelhante , os ciclistas casuais pedalam quase que o dobro de tempo em comparação com os membros anuais.
* Mais uma evidencia que os ciclistas casuais, usam os passeios para lazer. Essa discrepancia pode ser que ciclistas casuais, por priorizarem o lazer, não se preocupam com o tempo gasto no passeio. Ao contráro dos ciclista membros, que ao usar para se deslocarem para o trabalho, o fator tempo gasto é uma variável importante.


### Distribuição do número de passeios por horário

<img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/horario.png" alt="" width="75%">

**Percepções**

* A diferença proporcional de ciclistas casuais e membros começa a cair no início da noite, se iguala às 22 horas e segue a madrugada com proporções bem parecidas até às 4 da manhã. Após esse horario os membros superam o ciclistas casuais.
* Os ciclistas membros fazem a maior parte dos passeios durante os horários de expediente e decrescem com a chegada da noite.
* Esse dado corrobora com a hipotese de que que os ciclistas casuais usam o aluguel de bicicletas para fins de lazer, enquanto os membros a usam para ir ao trabalho.


### Distribuição mensal do número de passeios

</head>
<body>
    <table>
        <tr>
            <td><img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/mes.png"></td>
            <td><img src="https://github.com/welingtonfonsec/Cyclist/blob/main/graficos/estacoesdoano.png"></td>
        </tr>
    </table>
</body>
</html>

**Percepções**

* O número de ciclistas casuais cai drasticamente durante os meses de inverno (dezembro a fevereiro) para pouco mais de 3% do seu total.
* O numero de ciclistas casuais atinge o máximo nos meses de maio, junho, julho, agosto e setembro (fim da primavera, verão e inicio do outono), chegando a 74% do seu total.


### Conclusão e recomendações

* Uma observação comum é que os ciclistas casuais estão usando o aluguel de bicicletas para fins de lazer e turismo , enquanto os associados anuais a utilizam predominantemente para fins de deslocamento .
* Estratégias de marketing direcionadas para o local devem ser planejadas em locais de lazer como parques, teatros, restaurantes, hoteis e cafés.
* Com a informação de que os ciclistas casuais usam as bicicletas por periodos de tempo mais longos, seria interessante campanhas focadas em custo/beneficio para essa categoria.
* Notificações em redes sociais e mensagens de texto em horários de baixo movimento de ciclistas casuais podem ser usadas para atraí-los.
* Campanhas nos finais de semana e nas estações outono, primavea e verão, podem ajudar a aumentar os números durante esse periodo. Pois o potencial de crescimento de novos membros é enorme.
* Promoções aplicadas nos meses de inverno, em dias com temperaturas menos rigorosas, talvez combinada com feriados ou Natal, pode ajudar a aumentar os números nesse periodo.







