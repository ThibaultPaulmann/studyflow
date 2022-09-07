import flatpickr from "flatpickr";

const initFlatPickr = () => {
  flatpickr(".datepicker", {

  });
}
// function initFlatPickr() {
//   console.log("flatpickr started");

//   const dueDateInput = document.getElementById("input-schedule-meeting");


//   // Check that the query selector id matches the one you put around your form.

//     flatpickr(dueDateInput, {
//       minDate: "today",
//       dateFormat: "Y-m-d",
//       mode: "single",
//     });

//     console.log("im in the file");

//     dueDateInput.addEventListener("change", (e) => {

//       flatpickr(endDateInput, {
//         minDate: e.target.value,
//         disable: unavailableDates,
//         dateFormat: "Y-m-d",
//       });
//     });
//   }

export { initFlatPickr };
