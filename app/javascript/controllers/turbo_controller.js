import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo"
export default class extends Controller {
  connect() {
    console.log("Connected")
  }

  initialize() {
    this.element.setAttribute("data-action", "click->turbo#click")
  }

  click(e){
    e.preventDefault()
    this.button = this.element.getAttribute("i")
  }
}
