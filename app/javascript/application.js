// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
Turbo.session.drive = false

// ページ更新時、本棚のタブがちらつくのを防ぐための処理
let el = document.querySelector("#initial");
setTimeout(() => {
  el.id = "";
},100);