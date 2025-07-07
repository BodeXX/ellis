# Use uma imagem base do Python com uma versão específica e uma variante "slim" para reduzir o tamanho da imagem.
FROM python:3.12-slim

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho.
COPY requirements.txt .
# Instala as dependências do projeto usando pip. A flag --no-cache-dir evita o armazenamento de cache do pip dentro da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto para o diretório de trabalho.
COPY . .

# Define o comando de execução do contêiner. Ele inicia a aplicação usando uvicorn, especificando o arquivo principal (app), o objeto FastAPI (app), o host (0.0.0.0 para escutar em todas as interfaces) e a porta (8000).
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
