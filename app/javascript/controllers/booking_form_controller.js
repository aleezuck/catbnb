import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log('hello');
  }

  updatePriceTable() {
    console.log(this.element);
  }
}
