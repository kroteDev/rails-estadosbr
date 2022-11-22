RR = Estado.find_by_sigla("RR")
RR.cidades.create(
  [
   { nome: "Alto Alegre" },
   { nome: "Amajari" },
   { nome: "Boa Vista" },
   { nome: "Bonfim" },
   { nome: "Cantá" },
   { nome: "Caracaraí" },
   { nome: "Caroebe" },
   { nome: "Iracema" },
   { nome: "Mucajaí" },
   { nome: "Normandia" },
   { nome: "Pacaraima" },
   { nome: "Rorainópolis" },
   { nome: "São João da Baliza" },
   { nome: "São Luiz" },
   { nome: "Uiramutã" }
  ]
)