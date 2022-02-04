import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["option", "heading"]

  toggleClick() {
    console.log(this.optionTargets);
    // this.optionTarget.classList.toggle("pressed");
  }
}
