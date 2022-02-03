import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "attack", "next", "adhp", "ushp"]

  connect() {
    // this.element.textContent = "Hello World!"
    console.log("Hello world!");
  }

  hide() {
    this.menuTarget.classList.add("hidden");
    console.log("hidden");
    console.log(this.adhpTarget.innerHTML);
  }

  show() {
    this.menuTarget.classList.remove("hidden");
    console.log("unhidden");
  }
}
