import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['nav', 'navLogo'];
  connect() {
    window.addEventListener('scroll', this.handleScroll.bind(this));
    console.log(this.navLogoTarget);
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    if(window.scrollY > 0) {
      this.navTarget.style.backgroundColor = 'rgba(10, 41, 68, 0.8)';
      this.navTarget.style.backdropFilter = 'blur(10px)';
      this.navLogoTarget.style.borderColor = 'rgba(10, 41, 68, 0.8)';
    } else {
      this.navTarget.style.backgroundColor = '#00050d';
      this.navLogoTarget.style.borderColor = '#00050d';
    }
  }
}
