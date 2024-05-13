$(document).ready(function () {

    var produtos = <%= Produto.all.map { | p | [p.id, p.preco]
} %>;

function calcularTotalVenda(nestedField, isPrecoUnitarioChanged = false) {
    var selectElement = nestedField.find('.produto-select');
    var precoElement = nestedField.find('.produto-preco');
    var quantidadeElement = nestedField.find('.quantidade');
    var totalElement = $('.total-venda');

    var produto_select = selectElement.val();
    var produtoAnterior = nestedField.data('produto-id');

    // Verificar se o produto mudou
    var produtoMudou = produto_select != produtoAnterior;
    nestedField.data('produto-id', produto_select); // Atualizar o produto anterior

    // Encontrar o preço correspondente na lista de produtos
    var preco_produto = null;
    for (var i = 0; i < produtos.length; i++) {
        if (produtos[i][0] == produto_select) {
            preco_produto = produtos[i][1];
            break;
        }
    }

    // Atribuir o preço se o produto mudou e não foi manualmente alterado
    if (preco_produto !== null && produtoMudou && !isPrecoUnitarioChanged) {
        precoElement.val(preco_produto);
    }

    var preco_atual = parseFloat(precoElement.val());
    var quantidade = parseFloat(quantidadeElement.val());

    if (!isNaN(preco_atual) && !isNaN(quantidade)) {
        var total_venda = preco_atual * quantidade;
        totalElement.val(calcularTotalGeral()); // Atualiza o total geral
    } else {
        console.log('Erro ao calcular o total');
    }
}

function calcularTotalGeral() {
    var totalGeral = 0;

    // Somar os totais de todos os itens
    $('.nested-fields').each(function (index, nestedField) {
        var precoElement = $(nestedField).find('.produto-preco');
        var quantidadeElement = $(nestedField).find('.quantidade');

        var preco_produto = parseFloat(precoElement.val());
        var quantidade = parseFloat(quantidadeElement.val());

        if (!isNaN(preco_produto) && !isNaN(quantidade)) {
            totalGeral += preco_produto * quantidade;
        }
    });

    return totalGeral;
}

// Calcular o total ao carregar a página
$('.nested-fields').each(function (index, nestedField) {
    calcularTotalVenda($(nestedField));
});

// Atualizar os totais ao alterar a seleção, quantidade ou preço unitário
$(document).on('change input', '.produto-select, .quantidade, .produto-preco', function () {
    var nestedField = $(this).closest('.nested-fields');
    var isPrecoUnitarioChanged = $(this).hasClass('produto-preco');
    calcularTotalVenda(nestedField, isPrecoUnitarioChanged);
});

// Atualizar o total ao remover um item
$(document).on('cocoon:after-remove', function () {
    $('.total-venda').val(calcularTotalGeral());
});