import os
from zipfile import ZipFile
from pathlib import Path

pasta_Teste_de_nivelamento = Path.home() / "/home/joaozin987/Teste de Nivelamento"
zip_name = pasta_Teste_de_nivelamento / "anexos_compactados.zip"

if not pasta_Teste_de_nivelamento.exists():
    print(f"Erro: a pasta '{pasta_Teste_de_nivelamento}' não existe")
    exit(1)

arquivos_pdf = [arquivo for arquivo in pasta_Teste_de_nivelamento.iterdir() if arquivo.suffix == ".pdf"]

if not arquivos_pdf:
    print("Nenhum arquivo PDF encontrado para compactação.")
    exit(1)

with ZipFile(zip_name, "w") as zipf:
    for arquivo in arquivos_pdf:
        zipf.write(arquivo, arcname=arquivo.name)
        print(f"Adicionado: {arquivo.name}")

print(f"Compactação concluída: {zip_name}")
