import pdfplumber
import csv

def process_page_range(start_page, end_page, pdf, writer):
    for page_num in range(start_page, end_page):
        page = pdf.pages[page_num]
        tables = page.extract_tables()
        if tables: 
            for table in tables:
                writer.writerows(table)

with pdfplumber.open('anexos_compactados.zip') as pdf:
    with open('tabelas_extraidas.csv' , "w", newline='') as csvfile:
        writer = csv.writer(csvfile)
        num_pages = len(pdf.pages)
        page_block_size = 50


        for start_page in range(0, num_pages, page_block_size):
            end_page = min(start_page + page_block_size, num_pages)
            print(f"processando páginas de {start_page + 1} a {end_page}")
            process_page_range(start_page, end_page, pdf, writer)   