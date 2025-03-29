import zipfile
import pdfplumber
import csv
from pathlib import Path


abreviacoes = {
    "OD": "Outros Diagnósticos",
    "AMB": "Ambulatório"
}

zip_path = Path("anexos_compactados.zip")
extract_folder = Path("extraidos")
extract_folder.mkdir(exist_ok=True)

with zipfile.ZipFile(zip_path, "r") as zip_ref:
    zip_ref.extractall(extract_folder)


pdf_files = list(extract_folder.glob("*.pdf"))

pdf_path = None
for file in pdf_files:
    if file.name == "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf":  
        pdf_path = file
        break

if not pdf_path:
    raise FileNotFoundError("O PDF 'Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf' não foi encontrado no ZIP!")

for file in pdf_files:
    if file != pdf_path:  
        file.unlink()  

print(f"Processando o PDF: {pdf_path.name}")

def process_pdf(pdf_path, writer):
    with pdfplumber.open(pdf_path) as pdf:
        num_pages = len(pdf.pages)
        print(f"Processando {num_pages} páginas...")
        
        for page_num in range(num_pages):
            page = pdf.pages[page_num]
            tables = page.extract_tables()

            if tables:
                for table in tables:
                    
                    table = [[abreviacoes.get(cell, cell) for cell in row] for row in table]
                    writer.writerows(table)

            print(f"Página {page_num + 1}/{num_pages} processada.")


csv_filename = "tabelas_extraidas.csv"
with open(csv_filename, "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Coluna1", "Coluna2", "Coluna3", "Coluna4"])  

    process_pdf(pdf_path, writer)

print(f"Processo concluído! Os dados foram salvos em '{csv_filename}'")

nome_zip = f"Teste_{'SeuNome'}.zip" 

with zipfile.ZipFile(nome_zip, "w") as zipf:
    zipf.write(csv_filename, arcname=csv_filename)

print(f"Arquivo CSV compactado como '{nome_zip}'")