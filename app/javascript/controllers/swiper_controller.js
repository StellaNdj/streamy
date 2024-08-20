import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    this.swiper = new Swiper('.swiper-container', {
      // Swiper options go here
      slidesPerView: 3,
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      // You can add more options based on your needs
    });
  }
}
