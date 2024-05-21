# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

outros = [
  {
    nome: "Ficha de Sinuca",
    preco: 2.50,
    estoque: 0,
    categoria: "Outros",
    icone: "fa-solid fa-compact-disc",
  },
  {
    nome: "Ficha de Música",
    preco: 1.00,
    estoque: 0,
    categoria: "Outros",
    icone: "fa-solid fa-music",
  },
]

cervejas = [
  {
    nome: "Ficha de Sinuca",
    preco: 2.5,
    estoque: 0,
    categoria: "Outros",
  },
  {
    nome: "Ficha de Música",
    preco: 1.0,
    estoque: 0,
    categoria: "Outros",
  },
  {
    nome: "Antártica 269ml",
    preco: 4.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Antártica 350ml",
    preco: 5.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Antártica 600ml",
    preco: 10.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Original 269ml",
    preco: 4.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Original 600ml",
    preco: 12.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Heineken 269ml",
    preco: 7.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Heineken Long",
    preco: 10.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Heineken 600ml",
    preco: 15.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Heineken Zero",
    preco: 12.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Amstel 269ml",
    preco: 5.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Amstel 600ml",
    preco: 14.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Budweiser Long",
    preco: 10.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Budweiser 269ml",
    preco: 5.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Budweiser 600ml",
    preco: 12.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Corona Latão",
    preco: 7.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Corona Long",
    preco: 10.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Brahama 600ml",
    preco: 9.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Brahama Zero",
    preco: 7.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Kaiser 350ml",
    preco: 4.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
  {
    nome: "Skol 269ml",
    preco: 4.0,
    estoque: 0,
    categoria: "Cerveja",
    icone: "fa-solid fa-beer-mug-empty",

  },
]

bebidas = [
  {
    nome: "Água c/ gás",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-bottle-water",
  },
  {
    nome: "Água s/ gás",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-bottle-water",
  },
  # Coca Cola
  {
    nome: "Coca 350ml",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca KS",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca 600ml",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca 1L",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Coca 2L",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Guaraná
  {
    nome: "Guaraná 1L",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Guaraná 2L",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Sukita
  {
    nome: "Sukita 600ml",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Tônica
  {
    nome: "Tônica Lata",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Gatorede
  {
    nome: "Gatorede",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # H2O
  {
    nome: "H2O Lata",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Suco
  {
    nome: "Suco 1L",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Água de coco
  {
    nome: "Água de Coco",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  # Energéticos
  {
    nome: "Monster",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "Redbull",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
  {
    nome: "FireNigth",
    preco: 0,
    estoque: 0,
    categoria: "Bebidas",
    icone: "fa-solid fa-water",
  },
]

doses = [
  # Whisky
  {
    nome: "Dreher",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Ballantinos",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Passaporte",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Montila",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Jurupinga",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "José Cuervo",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Paratudo",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Domus",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  # Cachaças
  {
    nome: "Cachaça de Murici",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça de Abacaxi",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça de Caja",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },
  {
    nome: "Cachaça de Pimenta biquinho",
    preco: 4,
    estoque: 0,
    categoria: "Dose",
    icone: "fa-solid fa-whiskey-glass",
  },

]

salgados = [
  {
    nome: "Torcida",
    preco: 7.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Micos",
    preco: 3.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Micão",
    preco: 4.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Torresmo",
    preco: 7.00,
    estoque: 0,
    categoria: "Salgados",
    icone: "fa-solid fa-utensils",
  },
]

porcoes = [
  {
    nome: "Fritas simples",
    preco: 28,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Fritas c/ calabresa",
    preco: 35,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Fritas c/ calabresa e cheddar",
    preco: 40,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango à passarinho",
    preco: 38,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango à passarinho c/ fritas",
    preco: 40,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango à passarinho c/ fritas e calabresa",
    preco: 55,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Frango à passarinho c/ fritas, calabresa e cheddar",
    preco: 55,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
  {
    nome: "Calabresa acebolada",
    preco: 20,
    estoque: 0,
    categoria: "Porções",
    icone: "fa-solid fa-utensils",
  },
]

outros.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

cervejas.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

bebidas.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

doses.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

salgados.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

porcoes.each do |item|
  p "Cadastrando #{item[:nome]}"
  Produto.create(item)
end

(1..20).each do |i|
  p "Comanda N° #{i}"
  Comanda.create({
    numero: i,
    total: 0,
    status: "Livre",
  })
end
