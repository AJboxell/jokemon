import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["option"]

  toggleClick() {
    this.optionTarget.classList.toggle("pressed");
    // const user = this.optionTarget.innerText;
    const selections = document.querySelectorAll(".pressed");
    console.log(selections[0].querySelector(".poke-info").innerHTML);
    const user = selections[0].querySelector(".poke-info").innerHTML;
    const adversary = selections[1].querySelector(".poke-info").innerHTML;
    document.getElementById("battle_user").value = user;
    document.getElementById("battle_adversary").value = adversary;
  }
}
