import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const bookFlat = document.getElementById('book-flat');

  if (bookFlat) {
    const unavailableDates = JSON.parse(bookFlat.dataset.unavailable);

    flatpickr(".datepicker", {
      minDate: "today",
      disable: unavailableDates,
      allowInput: true
    });
  }

  const searchFlats = document.getElementById('search-flats');

  if (searchFlats) {
    flatpickr(".datepicker", {
      minDate: "today",
      altInput: true,
      allowInput: true
    });
  }
}

export { initFlatpickr };
