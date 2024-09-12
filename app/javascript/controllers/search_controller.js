import { Controller } from "@hotwired/stimulus";
// import { debounce } from "lodash";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "results"];

  connect() {
    this.performanceSearch = _.debounce(this.performanceSearch.bind(this), 300);
  }

  search() {
    const query = this.inputTarget.value;

    if(query.length > 2) {
      this.performanceSearch(query);
    } else {
      this.resultsTarget.innerHTML = '';
    }
  }

  performanceSearch(query) {
    fetch(`/search?query=${query}`, {
      headers: {
        'Accept': 'application/json'
      }
    })
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = this.renderResults(data);
      });
  }

  renderResults(data) {
    let html = '';

    if(data.movies.length) {
      html += '<ul>';
      data.movies.forEach(movie => {
        html += `<li>${this.highlightMatch(movie.title, this.inputTarget.value)}</li>`;
      });
      html += '</ul>';
    }

    if(data.tv_shows.length) {
      html += '<ul>';
      data.tv_shows.forEach(tv_show => {
        html += `<li>${this.highlightMatch(tv_show.title, this.inputTarget.value)}</li>`;
      });
      html += '</ul>';
    }

    return html || '<p>No results found</p>';
  }

  highlightMatch(text, query) {
    const regex = new RegExp(`(${query})`, 'gi');
    return text.replace(regex, '<strong>$1</strong>');
  }

  submit(event) {
    event.preventDefault();
    const query = this.inputTarget.value;
    window.location.href = `/search/all?query=${query}`;
  }
}
