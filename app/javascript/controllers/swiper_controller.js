import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {

  connect() {
    const slidesPerView = this.element.dataset.slidesPerView;

    this.swiper = new Swiper('.swiper-container', {
      // Swiper options go here
      slidesPerView: parseInt(slidesPerView, 10),
      spaceBetween: 1,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

    });
  }
}
