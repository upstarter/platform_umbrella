// -- Navbar menu JS
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

const $navbarLinks = Array.prototype.slice.call(document.querySelectorAll('.navbar-menu div a'), 0);
const $navMenu = $navbarLinks[0].parentElement.parentElement;

$navbarLinks.forEach( link => {

  link.addEventListener('click', () => {
    const $burger = document.querySelector('.navbar-burger')

    // Toggle the "is-active" class on burger & "navbar-menu"
    $burger.classList.toggle('is-active');
    $navMenu.classList.toggle('is-active');
  });
});
