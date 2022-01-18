import { Controller } from "stimulus";

export default class extends Controller {
  updatePriceTable() {
    const startDate = document.getElementById('booking_start_date').value;
    const endDate = document.getElementById('booking_end_date').value;
    const bookingTable = document.getElementById('booking-price-table');
    const bookingDays = document.getElementById('booking-days');
    const bookingPrice = document.getElementById('booking-price');
    const bookingSubmit = document.getElementById('booking-submit');

    if (startDate && endDate) {
      const checkIn = new Date(startDate);
      const checkOut = new Date(endDate);
      const days = (checkOut.getTime() - checkIn.getTime()) / (1000*60*60*24);
      const price = document.getElementById('book-flat').dataset.price;
      
      bookingTable.classList.remove('d-none');
      bookingSubmit.classList.remove('disabled');
      bookingDays.innerHTML = days;
      bookingPrice.innerHTML = `$${days * price}`;
    }
  }
}
