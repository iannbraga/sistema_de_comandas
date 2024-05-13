# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
cervejas = [
  {
    nome: "Heineken",
    descricao: "600ml",
    preco: 15.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Original",
    descricao: "600ml",
    preco: 12.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Antártica",
    descricao: "600ml",
    preco: 10.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Amstel",
    descricao: "600ml",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
]

doses = [
  {
    nome: "Murici",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Abacaxi",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Caja",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Pimenta biquinho",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
]

porcoes = [
  {
    nome: "Batata simples",
    descricao: "",
    preco: 28,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Batata com calabresa",
    descricao: "",
    preco: 35,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Batata com calabresa e cheddar",
    descricao: "",
    preco: 40,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango a passarinho",
    descricao: "",
    preco: 38,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango a passarinho com batata",
    descricao: "",
    preco: 40,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango a passarinho com batata e calabresa",
    descricao: "",
    preco: 55,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango a passarinho acebolado com batata, calabresa e cheddar",
    descricao: "",
    preco: 55,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Calabresa acebolada",
    descricao: "",
    preco: 20,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
]

cervejas.each do |cerveja|
  p "Cadastrando #{cerveja[:nome]}"
  Produto.create(cerveja)
end

doses.each do |dose|
  p "Cadastrando Dose #{dose[:nome]}"
  Produto.create(dose)
end

porcoes.each do |porcao|
  p "Cadastrando Porções #{porcao[:nome]}"
  Produto.create(porcao)
end

(1..20).each do |i|
  p "Comanda N° #{i}"
  Comanda.create({
    numero: i,
    total: 0,
    status: "Livre",
  })
end
