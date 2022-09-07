// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
require("bootstrap")
//= require typed

import { initFlatPickr } from "./plugins/init_flatpickr";


document.addEventListener('turbo:load', () => {
  initFlatPickr();
})
