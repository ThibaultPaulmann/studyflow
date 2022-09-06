import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo"
export default class extends Controller {
  static targets = ["popup"];

  connect() {
    console.log("Connected turbo")
  }

  open(){
    console.log(this.popupTarget);
    this.popupTarget.classList.add("popup-active");
    console.log(this.popupTarget);
  }

  disconnect(){
    this.popupTarget.hide()
  }
}
