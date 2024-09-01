// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
//import "@rails/ujs"

import Rails from "@rails/ujs"; // Explicitly import Rails UJS
Rails.start(); // Start Rails UJS
