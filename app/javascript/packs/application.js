document.addEventListener("DOMContentLoaded", function() {
    // Example of simple form validation
    document.querySelector('.signup-button').addEventListener('click', function(event) {
      const emailInput = document.querySelector('.email-input');
      if (!emailInput.value.includes('@')) {
        event.preventDefault(); // Stop the form from submitting
        alert('Please enter a valid email address.');
        emailInput.focus();
      }
    });
  
    // Example of toggling content
    document.querySelectorAll('.info-block').forEach(block => {
      block.addEventListener('click', function() {
        this.classList.toggle('expanded');
      });
    });
  });
  