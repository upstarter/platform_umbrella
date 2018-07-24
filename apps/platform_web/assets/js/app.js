// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

if('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/assets/sw.js')
   .then(function() { console.log("Service Worker Registered"); });
}
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


import './react_app/index'

document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( burger => {

      burger.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = burger.dataset.target;
        const $target = document.getElementById(target);
        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        burger.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});

const $navbarLinks = Array.prototype.slice.call(document.querySelectorAll('.navbar-menu a'), 0);
const $navMenu = $navbarLinks[0].parentElement;

$navbarLinks.forEach( link => {

  link.addEventListener('click', () => {
    const $burger = document.querySelector('.navbar-burger')

    // Toggle the "is-active" class on burger & "navbar-menu"
    $burger.classList.toggle('is-active');
    $navMenu.classList.toggle('is-active');
  });
});


// FB
// (function(d, s, id) {
//   var js, fjs = d.getElementsByTagName(s)[0];
//   if (d.getElementById(id)) return;
//   js = d.createElement(s); js.id = id;
//   js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
//   fjs.parentNode.insertBefore(js, fjs);
// }(document, 'script', 'facebook-jssdk'));
