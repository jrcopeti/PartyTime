import { Controller } from "@hotwired/stimulus"
import { Popover } from "bootstrap/dist/js/bootstrap.bundle.js";

// Connects to data-controller="popover"
export default class extends Controller {
  connect() {
    console.log("Popover connected");
    new Popover(this.element);
  }
}
