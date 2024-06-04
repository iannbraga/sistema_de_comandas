import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pagamento"
export default class extends Controller {
  connect() {
    console.log("Conectado");

    // Get all quantity input elements
    this.quantidadeInputs = this.element.querySelectorAll(".quantidade-pagar");

    // Initialize event listener for quantity changes
    this.quantidadeInputs.forEach(input => {
      input.addEventListener("change", this.updateValorPagar.bind(this));
    });

    // Get all preco-total span elements
    this.precoTotalSpans = this.element.querySelectorAll(".preco-total");

    // Get all valor-pagar input elements
    this.valorPagarInputs = this.element.querySelectorAll(".valor-pagar");

    // Initialize values for each row
    this.initializeRowValues();
  }

  updateValorPagar(event) {
    const quantidadeInput = event.target;
    const quantidade = parseFloat(quantidadeInput.value);
  
    const precoTotalSpan = quantidadeInput.closest("tr").querySelector(".preco-total");
    const precoTotal = parseFloat(precoTotalSpan.textContent);
  
    const valorPagarInput = quantidadeInput.closest("tr").querySelector(".valor-pagar");
  
    // Get the total quantity for this item
    const quantidadeTotalSpan = quantidadeInput.closest("tr").querySelector(".quantidade-total");
    const quantidadeTotal = parseFloat(quantidadeTotalSpan.textContent);
  
    // Calculate the "Valor a Pagar" based on available quantity
    const valorPagar = (quantidade / quantidadeTotal) * precoTotal;
    valorPagarInput.value = valorPagar.toFixed(2);
  
    this.updateTotalPagamento();
  }

  updateTotalPagamento() {
    const valorPagarInputs = this.element.querySelectorAll(".valor-pagar");
    let valorTotalPago = 0;

    for (const input of valorPagarInputs) {
      valorTotalPago += parseFloat(input.value);
    }

    const valorTotalPagoInput = this.element.querySelector("#pagamento_valor_total_pago");
    valorTotalPagoInput.value = valorTotalPago.toFixed(2);
  }

  initializeRowValues() {
    for (let i = 0; i < this.quantidadeInputs.length; i++) {
      const quantidadeInput = this.quantidadeInputs[i];
      const precoTotalSpan = this.precoTotalSpans[i];
      const valorPagarInput = this.valorPagarInputs[i];

      const quantidade = parseFloat(quantidadeInput.value);
      const precoTotal = parseFloat(precoTotalSpan.textContent);
      valorPagarInput.value = (quantidade * precoTotal).toFixed(2);
    }
  }
}
