import pandas as pd
from flask import Flask, jsonify, request
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)  # Habilita CORS se necessário

CSV_PATH = '/home/joaozin987/Teste de Nivelamento/operadoras_ativas/Relatorio_cadop.csv'

# Verifica se o arquivo existe
if not os.path.exists(CSV_PATH):
    raise FileNotFoundError(f"O arquivo {CSV_PATH} não foi encontrado.")

# Carregar o CSV com tratamento de erro
def load_csv():
    try:
        df = pd.read_csv(CSV_PATH, sep=';', encoding='latin-1', engine='python')
        df.columns = df.columns.str.strip()  # Remove espaços extras nos nomes das colunas
        print("Colunas encontradas:", df.columns.tolist())  # Debug para verificar as colunas

        if 'Registro_ANS' not in df.columns:
            raise KeyError("A coluna 'Registro_ANS' não foi encontrada no arquivo CSV.")
        
        df['Registro_ANS'] = pd.to_numeric(df['Registro_ANS'], errors='coerce').fillna(0).astype(int)
        return df
    except Exception as e:
        print("Erro ao carregar o CSV:", e)
        raise

df = load_csv()

@app.route('/')
@app.route('/operadoras', methods=['GET'])
def get_operadoras():
    data = df.fillna('').to_dict(orient='records') 
    return jsonify(data)

@app.route('/operadoras/<int:registro_ans>', methods=['GET'])
def get_operadora(registro_ans):
    operadora = df[df['Registro_ANS'] == registro_ans].fillna('')
    if operadora.empty:
        return jsonify({'error': 'Operadora não encontrada'}), 404
    return jsonify(operadora.to_dict(orient='records')[0])

if __name__ == '__main__':
    app.run(debug=True, use_reloader=False)
