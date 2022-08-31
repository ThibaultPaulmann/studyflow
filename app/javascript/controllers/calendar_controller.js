import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["extension"];

  connect() {
    console.log("Connected calendar controller");
  }

  extend(event) {
    this.extensionTarget.classList.toggle("d-none");
    console.log(event);
    console.log(event.target.value);
    console.log(this.element);
  }
}
