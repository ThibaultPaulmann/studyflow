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
        this.renderAssignment(assignment)
      );
    });
  }

  renderAssignment(assignment) {
    const reg = /T(\d\d):(\d\d)/;
    const match = reg.exec(assignment.due_date);
    const assignmentCard = `<div class='calendar-assignment-card'>\
      <a href='courses/${assignment.course_id}/assignments/${assignment.id}'>\
        <p class='assignment-name'>${assignment.title}</p>\
      </a>\
      <p class='assignment-time'>${match[1]}:${match[2]}</p>\
      </div>`;
    return assignmentCard;
  }
}
