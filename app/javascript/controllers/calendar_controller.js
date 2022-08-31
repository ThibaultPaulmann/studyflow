import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [
    "extension",
    "item",
    "extensionDate",
    "extensionAssignments",
  ];

  connect() {
    console.log("Connected calendar controller");
  }

  toggleExtend(event) {
    if (this.itemTargets.includes(event.target)) {
      console.log("extends");
      this.extend(event);
    } else {
      console.log("shrink");
      this.extensionTarget.classList.add("d-none");
    }
  }

  extend(event) {
    console.log("adding date");
    this.extensionDateTarget.innerText = event.target.dataset.date;
    console.log("showing div");
    this.extensionTarget.classList.remove("d-none");
    const assignments = JSON.parse(event.target.dataset.assignments);
    console.log(assignments);
    this.extensionAssignmentsTarget.innerHTML = "";
    assignments.forEach((assignment) => {
      this.extensionAssignmentsTarget.insertAdjacentHTML(
        "beforeend",
        this.renderAssignment(assignment.title, assignment.due_date)
      );
    });
  }

  renderAssignment(name, time) {
    const assignmentCard = `<div class='calendar-assignment-card d-flex justify-content-between'><p class='assignment-name'>${name}</p><p class='assignment-time'>${time}</p></div>`;
    return assignmentCard;
  }
}
