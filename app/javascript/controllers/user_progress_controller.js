import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-progress"
export default class extends Controller {
  static targets = ["form", "popup", "close"];
  connect() {
    console.log("connected to user-progress controller");
  }

  completed(event) {
    this.popupTarget.classList.add("popup-active");
  }

  close(event) {
    console.log("close popup");
    this.popupTarget.classList.remove("popup-active");
  }
}
