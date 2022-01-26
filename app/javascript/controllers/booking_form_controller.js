import { Controller } from "stimulus";
import flatpickr from "flatpickr";

const disableBookingForm = () => {
  const bookingTable = document.getElementById('booking-price-table');
  const bookingSubmit = document.getElementById('booking-submit');

  bookingTable.classList.add('d-none');
  bookingSubmit.disabled = true;
}

export default class extends Controller {
  static targets = ["startDate", "endDate", "bookFlat", "bookingPriceTable", "bookingSubmit", "bookingDays", "bookingPrice" ]

  connect() {
    const unavailableDates = JSON.parse(this.bookFlatTarget.dataset.unavailable);

    flatpickr(".datepicker", {
      minDate: "today",
      disable: unavailableDates,
      allowInput: true
    });
  }

  updateStartDate() {
    const unavailableDates = JSON.parse(this.bookFlatTarget.dataset.unavailable);
    const checkIn = new Date(this.startDateTarget.value);
    const checkOut = new Date(this.endDateTarget.value);

    if (checkIn >= checkOut) {
      this.startDateTarget.value = "";
      disableBookingForm();
    } else {
      flatpickr(this.startDateTarget, {
        minDate: "today",
        maxDate: this.endDateTarget.value,
        disable: [unavailableDates, this.endDateTarget.value],
        allowInput: true
      });
    }
  }

  updateEndDate() {
    const unavailableDates = JSON.parse(this.bookFlatTarget.dataset.unavailable);
    const checkIn = new Date(this.startDateTarget.value);
    const checkOut = new Date(this.endDateTarget.value);

    if (checkIn >= checkOut) {
      this.endDateTarget.value = "";
      disableBookingForm();
    } else {
      flatpickr(this.endDateTarget, {
        minDate: this.startDateTarget.value,
        disable: [unavailableDates, this.startDateTarget.value],
        allowInput: true
      });
    }
  }

  updatePriceTable() {
    const startDate = this.startDateTarget.value;
    const endDate = this.endDateTarget.value;

    if (startDate && endDate) {
      const checkIn = new Date(startDate);
      const checkOut = new Date(endDate);
      const days = (checkOut.getTime() - checkIn.getTime()) / (1000*60*60*24);
      const price = document.getElementById('book-flat').dataset.price;
      
      this.bookingPriceTableTarget.classList.remove('d-none');
      this.bookingSubmitTarget.disabled = false;
      this.bookingDaysTarget.innerHTML = days;
      this.bookingPriceTarget.innerHTML = `$${days * price}`;
    }
  }
}
