## Como Executar o Projeto

1. **Ativar o Ambiente Virtual:**
   Antes de executar qualquer script, entre na sua linha de comando e ative o ambiente virtual com o seguinte comando:
   ```bash
   source venv/bin/activate
1.1 **Executar o arquivo**
    python arquivo.py
    
## 1. Web Scraping

### 1.1 Download dos Anexos I e II

A primeira etapa consiste na realização do download dos arquivos PDF necessários.

### 1.2 Compactação dos Anexos

Após o download, todos os anexos são compactados em um único arquivo, utilizando o arquivo **zip.py**, que pode gerar arquivos em formato ZIP, RAR, etc.

## 2. Teste de Transformação de Dados

Neste passo, utilizamos o arquivo **extrair.py** para a extração dos dados:

### 2.1 Extração de Dados

Extraímos os dados da tabela **Rol de Procedimentos e Eventos em Saúde** do PDF do Anexo I (todas as páginas).

### 2.2 Salvamento dos Dados

Os dados extraídos são salvos em uma tabela estruturada no formato CSV.

### 2.3 Compactação do CSV

O arquivo CSV gerado é então compactado em um arquivo denominado **Teste_{seu_nome}.zip**.

### 2.4 Substituição de Abreviações

As abreviações das colunas **"OD" e "AMB"** são substituídas pelas descrições completas, conforme a legenda no rodapé.

## 3. Teste de Banco de Dados

Para esta parte do projeto, foram criados scripts em PostgreSQL:

- Os arquivos "2023" e "2024" estão armazenados na tabela **demonstracoes_contabeis**, cada um com 4 arquivos ZIP.
- Também foram instalados os Dados Cadastrais das Operadoras Ativas na ANS em formato CSV, armazenados na pasta **operadoras_ativas**.

### 3.1 Estruturação de Tabelas

Queries foram elaboradas para estruturar as tabelas necessárias para o arquivo CSV, bem como para importar o conteúdo dos arquivos preparados, garantindo o encoding correto.

### 3.2 Análises

Desenvolvi queries analíticas para responder às seguintes perguntas:

- Quais as 10 operadoras com maiores despesas em "EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO HOSPITALAR" **no último trimestre**?
- Quais as 10 operadoras com maiores despesas nessa categoria no **último ano**?

## 4. Interface Web

 Foi desenvolvida uma interface web usando vue.js com as informações mais relevantes do arquivo.
 Esta interface interage com um servidor em Python para realizar as tarefas mencionadas anteriormente.
 para ter acesso a interface use o comando **cd ans-frontend** para entrar na pasta e logo em seguida para executar use **npm run serve**.

## 5. Busca Textual
Os dados da só seram mostrados na interface quando o arquivo **app.py** for executado, sendo assim abra outro terminal e execute o arquivo e logo em seguida os dados serão mostrados.
Utilizei o CSV do item **Operadoras Ativas na ANS** e criei um servidor com uma rota que realiza uma busca textual na lista de cadastros de operadoras preparada anteriormente e retorna os registros mais relevantes.

## 6. Postman

Elaborei uma coleção no Postman para demonstrar o resultado das buscas realizadas. Essa coleção permite a visualização e testes das rotas disponíveis no servidor.

