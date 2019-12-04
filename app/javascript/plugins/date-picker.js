import flatpickr from "flatpickr";

// Source: https://flatpickr.js.org/

flatpickr("#user_date_of_birth", {
  // altInput: true
});

flatpickr("#itinerary_start_date", {
  // altInput: true
});

flatpickr("#itinerary_end_date", {
  // altInput: true
});

flatpickr("#event_start_date", {
  enableTime: true,
});

flatpickr("#event_end_date", {
  enableTime: true,
});

// flatpickr(".date-time-picker", {
//   // enableTime: true,
//   // altFormat: "D, F j, Y h:iK",
//   // dateFormat: "Y-m-d\\TH:i",
//   // 
// })
