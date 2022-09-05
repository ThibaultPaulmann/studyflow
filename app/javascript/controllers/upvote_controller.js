import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upvote"
export default class extends Controller {
  static targets = ["button", "total"]

  connect() {
    console.log(this.#csrfToken())
  }

  handleUpvote(event){
    event.preventDefault()
    const url = event.currentTarget.href
    console.log(url)
    fetch(url, {
      method: "PATCH",
      headers:  { 'X-CSRF-Token': this.#csrfToken(), 'Accept': 'application/json' }})
      .then(res => res.json())
      .then(data => this.element.outerHTML = data["upvote_buttons"])
  }

  #csrfToken() {
    return document.querySelector('meta[name="csrf-token"]').content
  }
}
