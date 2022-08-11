import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-save"
export default class extends Controller {
  static targets = ['save']

  connect() {
   this.preventers = new Set();
  }

  add(event) {
    this.preventers.add(event.detail.field);
    this.updateSaveButton();
  }

  remove(event) {
    this.preventers.delete(event.detail.field);
    this.updateSaveButton();
  }

  updateSaveButton() {
    this.saveTarget.disabled = this.preventers.size > 0;
  }
}
