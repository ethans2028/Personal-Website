// const hamburger = document.querySelector('.hamburger');

// hamburger.addEventListener('click', function () {
//     this.classList.toggle('is-active');
// });

const themed = document.getElementsByClassName('themed');
//var downArrow = document.getElementById('down-arrow');
for( let theme of themed )
{
  theme.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
    if (document.body.classList.contains('dark-mode')) {
      // downArrow.style.filter = "invert(0)";
      document.getElementById("themed").innerHTML = "Light Mode";
      document.getElementById("themed").style.transition = "1.5s";
    } else {
      // downArrow.style.filter = "invert(1)";
      document.getElementById("themed").innerHTML = "Dark Mode";
      document.getElementById("themed").style.transition = "1.5s";
    }
    
  });
}