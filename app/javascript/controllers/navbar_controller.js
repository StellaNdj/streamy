import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['nav', 'navLogo', 'navIcon'];
  connect() {
    window.addEventListener('scroll', this.handleScroll.bind(this));
    console.log()
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    if(window.scrollY > 0) {
      this.navTarget.classList.add('scrolled');
      this.navLogoTarget.classList.add('scrolled');
    } else {
      this.navTarget.classList.remove('scrolled');
      this.navLogoTarget.classList.remove('scrolled');
    }
  }
}
