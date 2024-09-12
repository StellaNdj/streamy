import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["search", "modalDiv", "modalClose"];
  connect() {
    this.searchTarget.addEventListener('click', (event) => {
      this.modalDivTarget.style.display = 'block';
    })
    
    // this.modalCloseTarget.addEventListener('click', (event) => {
    //   this.modalDivTarget.style.display = "none";
    // })

    this.modalDivTarget.addEventListener('click', (event) => {
      if(event.target === this.modalDivTarget) {
        this.modalDivTarget.style.display = "none";
      }
    })
  }
}
