# Pin npm packages by running ./bin/importmap
pin "application", to: "application.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "popper", to: "popper.js"
pin "bootstrap", to: "bootstrap.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"