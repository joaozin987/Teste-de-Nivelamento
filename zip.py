import os
from zipfile import ZipFile
from pathlib import Path

pasta_downloads = Path.home() / "Downloads"
zip_name = pasta_downloads / "anexos_compactados.zip"

if not pasta_downloads.exists():
    print(f"Erro: a pasta '{pasta_downloads}' não existe")
    exit(1)

arquivos_pdf = [arquivo for arquivo in pasta_downloads.iterdir() if arquivo.suffix == ".pdf"]

if not arquivos_pdf:
    print("Nenhum arquivo PDF encontrado para compactação.")
    exit(1)

with ZipFile(zip_name, "w") as zipf:
    for arquivo in arquivos_pdf:
        zipf.write(arquivo, arcname=arquivo.name)
        print(f"Adicionado: {arquivo.name}")

print(f"Compactação concluída: {zip_name}")
