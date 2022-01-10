import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const unavailableDates = JSON.parse(document.querySelector('#book-flat').dataset.unavailable);

  flatpickr(".datepicker", {
    minDate: "today",
    disable: unavailableDates,
    altInput: true,
    allowInput: true
  });
}

export { initFlatpickr };
