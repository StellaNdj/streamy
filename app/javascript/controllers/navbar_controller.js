import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['nav'];
  connect() {
    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    if(window.scrollY > 0) {
      this.navTarget.style.backgroundColor = 'rgba(10, 41, 68, 0.8)';
      this.navTarget.style.backdropFilter = 'blur(10px)';
    } else {
      this.navTarget.style.backgroundColor = '#00050d';
    }
  }
}
