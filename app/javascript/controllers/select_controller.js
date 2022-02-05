import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["option"]

  toggleClick() {
    this.optionTarget.classList.toggle("pressed");
    // const user = this.optionTarget.innerText;
    const selections = document.querySelectorAll(".pressed");
    console.log(selections[0].innerText);
    const user = selections[0].innerText;
    const adversary = selections[1].innerText;
    document.getElementById("battle_user").value = user;
    document.getElementById("battle_adversary").value = adversary;
  }
}
