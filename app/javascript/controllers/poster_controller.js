import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poster"
export default class extends Controller {
  static targets = ["image", "wrapper"]

  // connect() {
  //   console.log('Poster controller ON')
  //   this.colorThief = new ColorThief();
  //   if (this.imageTarget.complete) {
  //     this.applyDominantColor();
  //   } else {
  //     this.imageTarget.addEventListener("load", () => {
  //       this.applyDominantColor();
  //     });
  //   }
  // }

  // applyDominantColor() {
  //   const dominantColor = this.colorThief.getColor(this.imageTarget);
  //   this.wrapperTarget.style.backgroundColor = `rgb(${dominantColor.join(",")})`;
  // }
}
