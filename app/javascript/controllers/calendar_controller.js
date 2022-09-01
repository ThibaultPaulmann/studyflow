import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [
    "extension",
    "item",
    "extensionDate",
    "extensionAssignments",
  ];

  previousTarget = null;

  connect() {
    console.log("Connected calendar controller");
  }

  toggleExtend(event) {
    if (this.itemTargets.includes(event.target)) {
      this.extend(event);
    } else {
      const calendar = document.querySelector(".simple-calendar");
      calendar.style.borderRadius = "20px";
      this.extensionTarget.classList.add("d-none");
      if (this.previousTarget != null) {
        this.previousTarget.style.backgroundColor = "#1f2839";
      }
    }
  }

  extend(event) {
    if (this.previousTarget != null) {
      this.previousTarget.style.backgroundColor = "#1f2839";
    }

    event.target.style.backgroundColor = "rgba(193,207,206,0.4)";
    this.previousTarget = event.target;

    const calendar = document.querySelector(".simple-calendar");
    calendar.style.borderRadius = "0 20px 20px 0";

    this.extensionDateTarget.innerText = event.target.dataset.date;
    this.extensionTarget.classList.remove("d-none");
    const assignments = JSON.parse(event.target.dataset.assignments);
    this.extensionAssignmentsTarget.innerHTML = "";
    assignments.forEach((assignment) => {
      this.extensionAssignmentsTarget.insertAdjacentHTML(
        "beforeend",
        this.renderAssignment(assignment.title, assignment.due_date)
      );
    });
  }

  renderAssignment(name, time) {
    const reg = /T(\d\d):(\d\d)/;
    const match = reg.exec(time);
    const assignmentCard = `<div class='calendar-assignment-card'><p class='assignment-name'>${name}</p><p class='assignment-time'>${match[1]}:${match[2]}</p></div>`;
    return assignmentCard;
  }
}
