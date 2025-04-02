<template>
  <div>
    <h1>Operadoras Ativas na ANS</h1>
    <input v-model="search" placeholder="Buscar por Nome" @input="filterOperadoras" />
    <a href="">Pesquisar</a>
    <table>
      <thead>
        <tr>
          <th>Registro ANS</th>
          <th>Nome</th>
          <th>CNPJ</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="operadora in operadorasFiltradas" :key="operadora['Registro ANS']">
          <td>{{ operadora['Registro ANS'] }}</td>
          <td>{{ operadora['Nome Fantasia'] }}</td>
          <td>{{ operadora['CNPJ'] }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      operadoras: [],
      operadorasFiltradas: [],
      search: "",
    };
  },
  async created() {
    await this.fetchOperadoras();
  },
  methods: {
    async fetchOperadoras() {
      try {
        const response = await axios.get("http://localhost:5000/operadoras");
        this.operadoras = response.data;
        this.operadorasFiltradas = this.operadoras;
      } catch (error) {
        console.error("Erro ao buscar operadoras:", error);
      }
    },
    filterOperadoras() {
      this.operadorasFiltradas = this.operadoras.filter((op) =>
        op["Nome Fantasia"].toLowerCase().includes(this.search.toLowerCase())
      );
    },
  },
};
</script>

<style scoped>
table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
th {
  background-color: #f4f4f4;
}
input{
  padding: 0.5rem;
  margin-bottom: 1rem;
  margin-left: 0.5rem;
  border-radius: 0.3rem;
}
a{
  background-color: rgb(104, 96, 96);
  text-decoration: none;
  padding: 0.5rem;
  margin-left:1rem;
  border-radius: 0.7rem;
  color: white;
  font-family: bold;
  font-size: 16px;
}
a:hover{
  background-color: rgb(143, 146, 146);
}
</style>
