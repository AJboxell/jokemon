import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "attack", "next"]

  connect() {
    // this.element.textContent = "Hello World!"
    console.log("Hello world!");
  }

  hide() {
    this.menuTarget.classList.add("hidden");
    console.log("hidden");
  }

  show() {
    this.menuTarget.classList.remove("hidden");
    console.log("unhidden");
  }
}
