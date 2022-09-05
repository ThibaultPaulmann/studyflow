import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-progress"
export default class extends Controller {
  static targets = ["form", "popup"];
  connect() {
    console.log("connected to user-progress controller");
  }

  completed(event) {
    console.log(this.popupTarget);
    this.popupTarget.classList.add("popup-active");
    console.log(this.popupTarget);
  }
}
