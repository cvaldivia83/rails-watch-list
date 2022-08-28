import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-movies"
export default class extends Controller {
  static targets = ["list", "form", "input"]
  connect() {
    console.log(this.element);
    console.log(this.listTarget);
    console.log(this.formTarget.action);
    console.log(this.inputTarget.value);
  }

  update(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    const options = { headers: { Accept: "text/plain" } };

    fetch(url, options)
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      this.listTarget.outerHTML = data;
    })
  }
}
