import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["startDate", "endDate"]

  connect() {
    flatpickr(".datepicker", {
      minDate: "today",
      altInput: true,
      allowInput: true
    });
  }

  updateStartDate() {
    const checkIn = new Date(this.startDateTarget.value);
    const checkOut = new Date(this.endDateTarget.value);

    if (checkIn >= checkOut) {
      this.startDateTarget.value = "";
      disableBookingForm();
    } else {
      flatpickr(this.startDateTarget, {
        minDate: "today",
        maxDate: this.endDateTarget.value,
        altInput: true,
        allowInput: true
      });
    }
  }

  updateEndDate() {
    const checkIn = new Date(this.startDateTarget.value);
    const checkOut = new Date(this.endDateTarget.value);

    if (checkIn >= checkOut) {
      this.endDateTarget.value = "";
      disableBookingForm();
    } else {
      flatpickr(this.endDateTarget, {
        minDate: this.startDateTarget.value,
        altInput: true,
        allowInput: true
      });
    }
  }
}