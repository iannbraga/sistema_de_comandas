module ProdutosHelper
  def mostrar_icones
    icones = [
      "fa-solid fa-compact-disc",
      "fa-solid fa-music",
      "fa-solid fa-beer-mug-empty",
      "fa-solid fa-bottle-water",
      "fa-solid fa-water",
      "fa-solid fa-whiskey-glass",
      "fa-solid fa-utensils",
    ]
    icones.map { |icone| ["#{icone}"] }
  end
end
