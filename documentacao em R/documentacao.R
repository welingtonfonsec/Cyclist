# Estudo de caso - Cyclistic

## Estudo de casos - Cyclistic - Google Certificado - Analista de Dados

O projeto final de Data Analytics do Google é uma etapa crucial para concluir o curso de análise de dados do Google e obter a certificação em análise de dados. Este estudo de caso visa aplicar e demonstrar o conhecimento adquirido ao longo do curso, utilizando diversas ferramentas como Google Sheets, R, SQL e Tableau.

O projeto final é uma oportunidade de mostrar sua habilidade em aplicar técnicas de análise de dados, desde a coleta e limpeza dos dados até a visualização e interpretação dos resultados. Ao concluir esse estudo de caso, o aluno estará preparado para receber a certificação em análise de dados do Google e poderá demonstrar sua expertise na área de análise de dados para futuros empregadores ou clientes.

Através deste projeto, o estudante terá a oportunidade de consolidar seus conhecimentos e habilidades em análise de dados, bem como aprofundar sua compreensão sobre o e-commerce. Ao finalizar o estudo de caso, o aluno estará apto a enfrentar desafios reais de análise de dados e contribuir significativamente para o sucesso de empresas e organizações.

## Cenário

Você é um analista de dados júnior que trabalha na equipe de analistas de marketing da Cyclistic, uma empresa de compartilhamento de bicicletas em Chicago. O diretor de marketing acredita que o sucesso futuro da empresa depende da maximização do número de planos anuais contratados. Portanto, sua equipe quer entender como os ciclistas casuais e os membros anuais usam as bicicletas da Cyclistic de forma diferente. A partir desses insights, sua equipe criará uma nova estratégia de marketing para converter passageiros casuais em membros anuais. Mas, primeiro, os executivos da Cyclistic devem aprovar suas recomendações que, portanto, devem ser apoiadas com insights de dados convincentes e visualizações de dados profissionais.

## Personagens e equipes

● Cyclistic: Um programa de compartilhamento de bicicletas que conta com mais de 5.800 bicicletas e 600 estações de compartilhamento. A Cyclistic se diferencia por também oferecer bicicletas reclináveis, triciclos manuais e bicicletas de carga, tornando o compartilhamento de bicicletas mais inclusivo para pessoas com deficiência e ciclistas que não podem usar uma bicicleta padrão de duas rodas. A maioria dos ciclistas opta por bicicletas tradicionais; cerca de 8% dos motociclistas usam as opções assistivas. Os usuários da Cyclistic são mais propensos a pedalar por lazer, mas cerca de 30% utilizam as bicicletas para se deslocarem ao trabalho diariamente. 

● Lily Moreno: Diretora de marketing e sua gerente. Lily é responsável pelo desenvolvimento de campanhas e iniciativas de promoção do programa de compartilhamento de bicicletas. As campanhas podem incluir e-mail, mídias sociais e outros canais. 

● Equipe de análise de marketing da Cyclistic: Uma equipe de analistas de dados responsáveis por coletar, analisar e relatar dados que ajudam a orientar a estratégia de marketing da Cyclistic. Você se juntou a essa equipe há seis meses e tem estado ocupado aprendendo sobre a missão e os objetivos de negócios da Cyclistic – e como você, como analista de dados júnior, também pode ajudar a Cyclistic a alcançá-los. 

● Equipe executiva da Cyclistic: A equipe executiva notoriamente detalhista decidirá se aprova o programa de marketing recomendado.

## Perguntas

Três perguntas nortearão o futuro programa de marketing: 
  1. Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente? 
  2. Por que os passageiros casuais iriam querer adquirir planos anuais da Cyclistic? 
  3. Como a Cyclistic pode usar a mídia digital para influenciar os passageiros casuais a se tornarem membros?
  
  Abaixo segue análise do conjunto de dados em questão feita em R.

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Carregando os Dados e Bibliotecas 

### Carregando as bibliotecas:
```{r}
library("dplyr")
library("ggplot2")
library("tidyverse")
library("lubridate")
library("skimr")
library("e1071")
library("ggthemes")
library("reshape2")
library("kableExtra")
library("geosphere")
library("scales")
library("knitr")
library("bsplus")
library("writexl")
```

### Carregando os 12 arquivos .CSV's:

```{r}
c01 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202201.csv") 
c02 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202202.csv") 
c03 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202203.csv")
c04 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202204.csv")
c05 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202205.csv")
c06 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202206.csv")
c07 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202207.csv")
c08 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202208.csv")
c09 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202209.csv")
c10 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202210.csv")
c11 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202211.csv")
c12 <- read.csv("C:/Users/welin/Desktop/GOOGLE/Estudos de caso/1/202212.csv")
```

### Analisando os tipos de dados:
```{r}
str(c01)

str(c04)

str(c08)

str(c12)

```

## Limpeza e Tratamento dos Dados para analise

### Combinando os 12 arquivos .CSV's em um único dataframe. Que será chamado de "cyclist2022": 

```{r}
cyclist2022 <- rbind(c01, c02, c03, c04, c05, c06, c07, c08, c09, c10, c11, c12)

```

### Abrindo apenas as 6 primeiras linhas:

```{r}
head(cyclist2022)

```

### Identificando os nomes das colunas e numero de linhas antes da limpeza e tratamento:

```{r}
colnames(cyclist2022)
```

```{r}
numero_de_linhas1 <- nrow(cyclist2022)
print(numero_de_linhas1)
```


### Apagando linhas das colunas "start_station_name" e "end_station_name" com valores ausentes e criando o dataset "cyclist2022v1" : 

```{r}
cyclist2022v1 <- subset(cyclist2022, nchar(start_station_name) > 0 & nchar(end_station_name) > 0)

```

### Apagando colunas que não serão utilizadas:

```{r}
cyclist2022v1 <- subset(cyclist2022v1, select = -c(ride_id, start_station_id, end_station_id))
```

### Criando a coluna "data" a partir da coluna "started_at": 

```{r}
cyclist2022v1 <- cyclist2022v1 %>% mutate(data = as.Date(started_at))
head(cyclist2022v1$data)
```

### Criando a coluna "dia_semana" a partir da coluna "data", recém criada:

```{r}
cyclist2022v1 <- cyclist2022v1 %>% mutate(dia_semana = weekdays(ymd(data)))
head(cyclist2022v1$dia_semana)

```

### Criando a coluna "mes" a partir da coluna "data":

```{r}
cyclist2022v1$mes <- month(cyclist2022v1$data, label = TRUE)
head(cyclist2022v1$mes)
```

### Criando as coluna das estações do ano "estacao" a partir da coluna "mes":

```{r}
cyclist2022v1 <- cyclist2022v1 %>%
  mutate(estacao = case_when(
    mes %in% c("jun", "jul", "ago") ~ "Verão",
    mes %in% c("set", "out", "nov") ~ "Outono",
    mes %in% c("dez", "jan", "fev") ~ "Inverno",
    mes %in% c("mar", "abr", "mai") ~ "Primavera",
    TRUE ~ NA_character_
  ))
head(cyclist2022v1$estacao)
```


### Criando a coluna chamada "hora_inicio" a partir da coluna "started_at": 

```{r}
cyclist2022v1 <- cyclist2022v1 %>% mutate(hora_inicio = format(as.POSIXct(started_at), format = "%H:%M:%S"))
head(cyclist2022v1$hora_inicio)
```

### Criando uma nova coluna chamada "hora_fim" a partir da coluna "ended_at":

```{r}
cyclist2022v1 <- cyclist2022v1 %>% mutate(hora_fim = format(as.POSIXct(ended_at), format = "%H:%M:%S"))
head(cyclist2022v1$hora_fim)
```

### Criando a coluna chamada "tempo_total":

```{r}
cyclist2022v1 <- cyclist2022v1 %>%
  mutate(tempo_total = as.character(as.POSIXct(hora_fim, format = "%H:%M:%S") - 
                                      as.POSIXct(hora_inicio, format = "%H:%M:%S")))
head(cyclist2022v1$tempo_total)
```

### Mudando o tipo de "tempo_total" para numérico: 

```{r}
cyclist2022v1$tempo_total <- as.numeric(cyclist2022v1$tempo_total)
str(cyclist2022v1$tempo_total)
head(cyclist2022v1$tempo_total)
```

### Convertendo de segundos para minutos:

```{r}
cyclist2022v1$tempo_total_min <- cyclist2022v1$tempo_total / 60
head(cyclist2022v1$tempo_total_min)
```

### Criando a coluna "hora" a partir da coluna "hora_inicio":

```{r}
cyclist2022v1$hora <- substr(cyclist2022v1$hora_inicio, 1, 2)
head(cyclist2022v1$hora)
```

### Apagando colunas que já não tem importância:

```{r}
cyclist2022v1 <- subset(cyclist2022v1, select = -c(started_at, ended_at))

```

### Apagando linhas com valores negativos, zerados e menores que 1 da coluna tempo_total_min. Por fim, o dataset limpo cyclist2022v4 será criado:  

```{r}
cyclist2022v2 <- subset(cyclist2022v1, tempo_total_min >= 0)

cyclist2022v3 <- cyclist2022v2 %>%
  filter(tempo_total_min != 0)

cyclist2022v4 <- cyclist2022v3 %>%
  filter(tempo_total_min > 1)
```

### Criando a coluna "KM_percorridos" usando as colunas "start_lng", "start_lat, "end_lng" e "end_lat":

```{r}
cyclist2022v4$KM_percorridos <- distVincentySphere(
  cyclist2022v4[, c("start_lng", "start_lat")],
  cyclist2022v4[, c("end_lng", "end_lat")]
) / 1000
```

### Analisando a quantidade de linhas e colunas existentes após limpeza e tratamento:

```{r}
colnames(cyclist2022v4)
```

```{r}
numero_de_linhas4 <- nrow(cyclist2022v4)
print(numero_de_linhas4)
```

## Análise Descritiva

### Analisando os dados estatísticos de duração de passeio:

```{r}
skim(cyclist2022v4$tempo_total_min)

```

### Analisando a média, mediana, máximo e minimo de duração de passeio por membros:

```{r}
aggregate(cyclist2022v4$tempo_total_min ~ cyclist2022v4$member_casual, FUN = mean)

aggregate(cyclist2022v4$tempo_total_min ~ cyclist2022v4$member_casual, FUN = median)

aggregate(cyclist2022v4$tempo_total_min ~ cyclist2022v4$member_casual, FUN = max)

aggregate(cyclist2022v4$tempo_total_min ~ cyclist2022v4$member_casual, FUN = min)

```

### Analisando a média, mediana, máximo e minimo de distancia percorrida dos passeios por tipo de usuário:


```{r}
aggregate(cyclist2022v4$KM_percorridos ~ cyclist2022v4$member_casual, FUN = mean)

aggregate(cyclist2022v4$KM_percorridos ~ cyclist2022v4$member_casual, FUN = median)

aggregate(cyclist2022v4$KM_percorridos ~ cyclist2022v4$member_casual, FUN = max)

aggregate(cyclist2022v4$KM_percorridos ~ cyclist2022v4$member_casual, FUN = min)
```

## Visualização dos Dados

### Analisando a distribuição percentual do total de compartilhamentos/passeios por tipo de usuário/ciclista:

```{r}
# Crie uma tabela de frequência da coluna "member_casual"
frequencia <- table(cyclist2022v4$member_casual)

# Calcule os percentuais
percentuais <- prop.table(frequencia) * 100

# Crie um dataframe com os resultados
dados_grafico <- data.frame(member_casual = names(frequencia),
                            percentual = percentuais)

# Crie o gráfico de barras usando o ggplot2
ggplot(dados_grafico, aes(x = member_casual, y = percentuais, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Tipo de Ciclista", y = "Percentual (%)") +
  theme_minimal() +
  guides(fill = guide_legend(title = "Tipo de Ciclista"))
```

```{r}
contagem <- table(cyclist2022v4$member_casual)
print(contagem)
```


### Analisando a Media do tempo_total_min para cada tipo de membro por dia da semana:

```{r}
media_membro_dia_semana <- aggregate(tempo_total_min ~ dia_semana + member_casual, data = cyclist2022v4, FUN = mean)

```

### Gráfico de barras - "Media da duração do Passeio X Dia da Semana e Tipo de usuário":

```{r}
ggplot(media_membro_dia_semana, aes(x = dia_semana, y = tempo_total_min, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Dia da Semana", y = "Media do Tempo Total (minutos)", fill = "Tipo de Ciclista") +
  theme_minimal()
```
```{r}
media_tempo_por_usuario <- cyclist2022v4 %>%
  group_by(member_casual) %>%
  summarise(media_tempo = mean(tempo_total_min))

print(media_tempo_por_usuario)

```


```{r}
media_tempo_por_usuario_min <- aggregate(tempo_total_min ~ member_casual, data = cyclist2022v4, FUN = mean)

ggplot(media_tempo_por_usuario_min, aes(x = member_casual, y = tempo_total_min, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Tipo de Ciclista", y = "Tempo Medio (minutos)") +
  theme_minimal() +
  guides(fill = guide_legend(title = "Tipo de Ciclista"))

```







### Gráfico de barras "Media de Quilômetros percorridos X tipo de usuário"

```{r}
# Calcula a média dos quilômetros percorridos por tipo de usuário
media_km_por_usuario <- aggregate(cyclist2022v4$KM_percorridos, by = list(member_casual = cyclist2022v4$member_casual), FUN = mean)

# Cria o gráfico de barras
ggplot(media_km_por_usuario, aes(x = member_casual, y = x, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Tipo de Ciclista", y = "Media Km Percorridos", fill = "Tipo de Ciclista") +
  theme_minimal()
guides(fill = guide_legend(title = "Tipo de Ciclista"))
```

### Analisando a demanda em cada estação do ano por tipo usuário: 

```{r}
ggplot(cyclist2022v4, aes(x = estacao, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Estacoes do Ano", y = "Numero de Passeios", fill = "Tipo de Ciclista") +
  theme_minimal()
```

### Analisando a demanda mensal por tipo de usuário:

```{r}
ggplot(cyclist2022v4, aes(x = mes, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Mes", y = "Numero de Passeios", fill = "Tipo de Ciclista") +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal()
```
```{r}
contagem <- cyclist2022v4 %>%
  group_by(mes, member_casual) %>%
  summarise(contagem = n())

print(contagem)
```




### Analisando a Demanda por dia da semana:

```{r}
ggplot(cyclist2022v4, aes(x = dia_semana)) +
  geom_bar(position = "dodge") +
  labs(x = "Dia da Semana", y = "Demanda") +
  ggtitle("Demanda X Dia da Semana") +
  theme_minimal()
```

### Analisando a Demanda por tipo de usuário e dia da semana:


```{r}
ggplot(cyclist2022v4, aes(x = dia_semana, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Dia da Semana", y = "Numero de Passeios", fill = "Tipo de Ciclista") +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal()
```
```{r}
contagem_dias_usuario <- cyclist2022v4 %>%
  count(dia_semana, member_casual) %>%
  spread(member_casual, n, fill = 0)

print(contagem_dias_usuario)
```


```{r}
ggplot(cyclist2022v4, aes(x = dia_semana, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Dia da Semana", y = "Demanda", fill = "Tipo de usuário") +
  theme_minimal()
```

### Analisando o horário mais demandado:

```{r}
ggplot(cyclist2022v4, aes(x = hora, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Horario", y = "Numero de Passeios", fill = "Tipo de Ciclista") +
  scale_y_continuous(labels = scales::comma) +
  ggtitle("Demanda X Horario") +
  theme_minimal()
```


### Analisando o tipo de bicicleta mais usada:

```{r}
ggplot(cyclist2022v4, aes(x = rideable_type, fill = rideable_type)) +
  geom_bar(position = "dodge") +
  labs(x = "Tipo de Bicicleta", y = "Demanda", fill = "Tipo") +
  ggtitle("Demanda X Tipo de Bicicleta") +
  theme_minimal()
```

### Analisando o tipo de bicicleta mais usada por tipo de usuário:

```{r}
ggplot(cyclist2022v4, aes(x = rideable_type, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(x = "Rideable Type", y = "Demanda", fill = "Tipo de Bicicleta") +
  ggtitle("Demanda de Tipo de Bicicleta X  Tipo de Usuário") +
  theme_minimal()
```


### Analisando os 10 pontos de partida mais demandados:

```{r}
top_places <- cyclist2022v4 %>%
  group_by(start_station_name) %>%
  summarize(count = n()) %>%
  arrange(desc(count)) %>%
  top_n(11)

top_places


```
