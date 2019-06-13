import flatpickr from "flatpickr";

// Source: https://flatpickr.js.org/
flatpickr("input[type='date']", {
  altInput: true,
  altFormat: "D, F j, Y",
  dateFormat: "Y-m-d"
})
flatpickr("input[type='datetime-local']", {
  enableTime: true,
  altInput: true,
  altFormat: "D, F j, Y h:iK",
  dateFormat: "Y-m-d\\TH:i"
})
