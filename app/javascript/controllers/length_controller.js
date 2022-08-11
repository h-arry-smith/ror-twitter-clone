import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="length"
export default class extends Controller {
  static values = { max: Number }
  static targets = ['field', 'length']

  connect() {
    this.setLength();
    this.checkSaveConditions();
  }

  change () {
    this.setLength();
    this.checkSaveConditions();
  }

  setLength() {
    this.lengthTarget.textContent = `${this.fieldLength}/${this.maxValue}`;
  }

  checkSaveConditions() {
    if (this.fieldLength <= this.maxValue) {
      this.removeSavePreventer(this.fieldTarget);
      this.lengthTarget.classList.remove("text-danger", "fw-bolder");
    } else {
      this.addSavePreventer(this.fieldTarget);
      this.lengthTarget.classList.add("text-danger", "fw-bolder");
    }
  }

  addSavePreventer(field) {
    this.dispatch('add', { detail: {field} });
  }

  removeSavePreventer(field) {
    this.dispatch('remove', { detail: { field } });
  }

  get fieldLength() {
    return this.fieldTarget.value.length;
  }
}
