// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

let debounce = require('lodash/debounce');

export default class extends Controller {
  static targets = [ "submit", "order" ]

  connect(){
    this.submitWithDebounce = debounce(this.submitWithDebounce, 300).bind(this)
  }

  submitWithDebounce() {
    this.submitTarget.click();
    this.submitTarget.disabled = false;
  }

  submit() {
    this.submitTarget.click();
    this.submitTarget.disabled = false;
  }

  sort(event) {
    this.disableOtherSortButtons(event.currentTarget);

    const icon = event.currentTarget.firstChild;
    let order = 'asc'

    if (icon.dataset.icon === 'caret-up') {
      icon.dataset.icon = 'caret-down';
      order = 'desc';
    } else {
      icon.dataset.icon = 'caret-up';
    }

    const sortBy = event.currentTarget.parentNode.dataset.header
    this.orderTarget.value = `${sortBy}_${order}`

    this.submit();
  }

  disableOtherSortButtons(target) {
    document.querySelectorAll('.sort-btn').forEach((btn) => {
      btn.classList.remove('sort-enabled');
    })

    target.classList.add('sort-enabled');
  }

}
