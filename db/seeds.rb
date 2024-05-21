# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

outros = [
  {
    nome: "Ficha",
    descricao: "de Sinuca",
    preco: 2.50,
    estoque: 0,
    categoria: "Outros",
    icone: "fa-solid fa-compact-disc",
  },
  {
    nome: "Ficha",
    descricao: "de Música",
    preco: 1.00,
    estoque: 0,
    categoria: "Outros",
    icone: "fa-solid fa-music",
  },
]

cervejas = [
  # Antartica
  {
    nome: "Antártica",
    descricao: "269ml",
    preco: 4.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Antártica",
    descricao: "350ml",
    preco: 5.00,
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
  # Original
  {
    nome: "Original",
    descricao: "269ml",
    preco: 4.00,
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
  # Heineken
  {
    nome: "Heineken",
    descricao: "269ml",
    preco: 7.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Heineken",
    descricao: "Long",
    preco: 9.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Heineken",
    descricao: "600ml",
    preco: 15.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Heineken",
    descricao: "Zero",
    preco: 15.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  # Amstel
  {
    nome: "Amstel",
    descricao: "269ml",
    preco: 14.00,
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
  # Budweiser
  {
    nome: "Budweiser",
    descricao: "Long",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Budweiser",
    descricao: "269ml",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Budweiser",
    descricao: "600ml",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  # Corona
  {
    nome: "Corona",
    descricao: "Latão",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Corona",
    descricao: "Long",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  # Brahma
  {
    nome: "Brahama",
    descricao: "600ml",
    preco: 14.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  {
    nome: "Brahama",
    descricao: "Zero",
    preco: 10.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  # Kaiser
  {
    nome: "Kaiser",
    descricao: "350ml",
    preco: 4.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
  # Skol
  {
    nome: "Skol",
    descricao: "269ml",
    preco: 5.00,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",
  },
]

bebidas = [
  {
    nome: "Água",
    descricao: "s/ gás",
    preco: 4,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-bottle-water",
  },
  {
    nome: "Água",
    descricao: "c/ gás",
    preco: 5,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-bottle-water",
  },
  # Coca Cola
  {
    nome: "Coca",
    descricao: "350ml",
    preco: 5,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca",
    descricao: "KS",
    preco: 5,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca",
    descricao: "600ml",
    preco: 7,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca",
    descricao: "1L",
    preco: 10,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca",
    descricao: "2L",
    preco: 15,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Guaraná
  {
    nome: "Guaraná",
    descricao: "2L",
    preco: 10,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Sukita
  {
    nome: "Sukita",
    descricao: "600ml",
    preco: 5,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Tônica
  {
    nome: "Tônica",
    descricao: "Lata",
    preco: 6,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Gatorede
  {
    nome: "Gatorede",
    descricao: "",
    preco: 8,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # H2O
  {
    nome: "H2O",
    descricao: "",
    preco: 6,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Suco
  {
    nome: "Suco",
    descricao: "1L",
    preco: 8,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Água de coco
  {
    nome: "Água",
    descricao: "de Coco",
    preco: 12,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Energéticos
  {
    nome: "Monster",
    descricao: "",
    preco: 12,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Redbull",
    descricao: "",
    preco: 12,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "FireNigth",
    descricao: "de Coco",
    preco: 10,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
]

doses = [
  # Whisky
  {
    nome: "Dreher",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Ballantinos",
    descricao: "",
    preco: 10,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Passaporte",
    descricao: "",
    preco: 10,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Montila",
    descricao: "",
    preco: 5,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Jurupinga",
    descricao: "",
    preco: 5,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "José Cuervo",
    descricao: "",
    preco: 10,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Paratudo",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Domus",
    descricao: "",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  # Cachaças
  {
    nome: "Cachaça",
    descricao: "Murici",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça",
    descricao: "Abacaxi",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça",
    descricao: "Caja",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça",
    descricao: "Pimenta biquinho",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },

]

salgados = [
  {
    nome: "Torcida",
    descricao: "",
    preco: 7.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Micos",
    descricao: "",
    preco: 3.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Micão",
    descricao: "",
    preco: 4.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Torresmo",
    descricao: "",
    preco: 7.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
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
    nome: "Frango a passarinho c/ calabresa",
    descricao: "",
    preco: 42,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango a passarinho c/ fritas, calabresa e cheddar",
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

outros.each do |outro|
  p "Cadastrando #{outro[:nome]}"
  Produto.create(outro)
end

cervejas.each do |cerveja|
  p "Cadastrando #{cerveja[:nome]}"
  Produto.create(cerveja)
end

bebidas.each do |bebida|
  p "Cadastrando #{bebida[:nome]}"
  Produto.create(bebida)
end

doses.each do |dose|
  p "Cadastrando #{dose[:nome]}"
  Produto.create(dose)
end

salgados.each do |salgado|
  p "Cadastrando #{salgado[:nome]}"
  Produto.create(salgado)
end

porcoes.each do |porcao|
  p "Cadastrando #{porcao[:nome]}"
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
