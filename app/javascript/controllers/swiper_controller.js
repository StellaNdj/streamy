import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {

  initialize() {
    this.mediaQueries = [
      { query: "(max-width: 600px)", slidesPerView: 2 },
      { query: "(min-width: 601px) and (max-width: 1000px)", slidesPerView: 4 },
      { query: "(min-width: 1000px)", slidesPerView: 6 }
    ];

    this.swiper = null;
    this.updateSlidesPerView = this.updateSlidesPerView.bind(this);
  }

  connect() {
    // Add event listeners for each media query
    this.mediaQueries.forEach(mq => {
      const mediaQueryList = window.matchMedia(mq.query);
      mediaQueryList.addListener(this.updateSlidesPerView.bind(this));
    });

    this.updateSlidesPerView();
  }

  updateSlidesPerView() {
    // Find the matching media query
    const matchingMediaQuery = this.mediaQueries.find(mq => window.matchMedia(mq.query).matches);

    // Update the dataset based on the matching media query
    if (matchingMediaQuery) {
      this.element.dataset.slidesPerView = matchingMediaQuery.slidesPerView;
    }

    // Reinitialize the Swiper instance
    if (this.swiper && this.swiper.destroy) {
      this.swiper.destroy(true, true);
      this.swiper = null;
    }
    this.initializeSwiper();
  }

  initializeSwiper() {
    const slidesPerView = parseInt(this.element.dataset.slidesPerView, 10);

    this.swiper = new Swiper('.swiper-container', {
      // Swiper options go here
      slidesPerView: slidesPerView,
      spaceBetween: 1,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  }

}
