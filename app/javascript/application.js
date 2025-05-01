// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
console.log("JS loaded");

import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
import * as bootstrap from "bootstrap"
Rails.start()

