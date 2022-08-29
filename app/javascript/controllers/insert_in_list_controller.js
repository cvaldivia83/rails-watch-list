import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["form", "items"]
  connect() {
    // console.log(this.itemsTarget);
    // console.log(this.formTarget);
  }

  send(event) {
    event.preventDefault();

    const url = this.formTarget.action;

    const options = {
      method: 'POST',
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    };

    fetch(url, options)
    .then(response => response.json())
    .then(data => {
      if (data.inserted_item) {
        this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item);
      }
      this.formTarget.outerHTML = data.form
    })
  }
}
