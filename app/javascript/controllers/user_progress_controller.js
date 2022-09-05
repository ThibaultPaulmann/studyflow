import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-progress"
export default class extends Controller {
  static targets = ["form"];
  connect() {
    console.log("connected to user-progress controller");
  }

  completed(event) {
    console.log("value changed");
  }
}
