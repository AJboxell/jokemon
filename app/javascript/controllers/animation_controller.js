import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["attack", "star", "avatar", "opponent"]

  star() {
    console.log("Animate!");
    this.starTarget.classList.remove("invisible");
  }

  jump() {
    this.avatarTarget.classList.add("avatar");
    setTimeout(() => { this.avatarTarget.classList.remove("avatar"); }, 1000);
  }

  ojump() {
    this.opponentTarget.classList.add("avatar");
    setTimeout(() => { this.opponentTarget.classList.remove("avatar"); }, 1000);
  }
}
