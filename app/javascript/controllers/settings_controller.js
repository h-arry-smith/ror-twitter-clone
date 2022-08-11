import { Controller } from "@hotwired/stimulus"

const MAX_BIO_LENGTH = 200;

// Connects to data-controller="settings"
export default class extends Controller {
  static targets = ['bio', 'length', 'save']

  connect() {
    this.setLength();
    this.checkSaveConditions();
  }

  bio () {
    this.setLength();
    this.checkSaveConditions();
  }

  setLength() {
    this.lengthTarget.textContent = `${this.bioLength}/${MAX_BIO_LENGTH}`;
  }

  checkSaveConditions() {
    this.saveTarget.disabled = false;
    this.lengthTarget.classList.remove("text-danger", "fw-bolder");

    if (this.bioLength > MAX_BIO_LENGTH) {
      this.saveTarget.disabled = true;
      this.lengthTarget.classList.add("text-danger", "fw-bolder");
    }
  }

  get bioLength() {
    return this.bioTarget.value.length;
  }
}
