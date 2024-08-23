import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poster"
export default class extends Controller {
  static targets = ["image", "wrapper"]

  connect() {
    console.log('Poster controller ON')
  }
}
