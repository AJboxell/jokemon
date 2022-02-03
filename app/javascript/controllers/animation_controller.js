import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["attack", "star"]

  star() {
    console.log("Animate!");
    this.starTarget.classList.remove("invisible");
  }
}
