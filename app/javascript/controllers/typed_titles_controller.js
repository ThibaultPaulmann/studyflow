import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed-titles"
export default class extends Controller {
  static targets = ["form"];
  connect() {
    console.log("connected to typed titles");
    console.log(this.formTarget);

    if (this.formTarget.querySelector(".auto-type-course") !== null) {
      console.log("found auto type course");
      const typedCourse = new Typed(".auto-type-course", {
        strings: ["Create a new Course", "Help your Classmates"],
        typeSpeed: 130,
        backSpeed: 90,
        loop: true,
      });
    }

    if (this.formTarget.querySelector(".auto-type-assignment") !== null) {
      console.log("found auto type assignment");
      const typedAssignment = new Typed(".auto-type-assignment", {
        strings: ["Create an Assignment", "Help your Classmates"],
        typeSpeed: 130,
        backSpeed: 90,
        loop: true,
      });
    }
  }
}
