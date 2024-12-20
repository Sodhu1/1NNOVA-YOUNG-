document.addEventListener('DOMContentLoaded', function() {
    const body = document.body;
    const toggleButton = document.querySelector('#toggle-dark-mode');

    // Load saved theme from sessionStorage
    const savedTheme = sessionStorage.getItem('theme');
    if (savedTheme) {
        body.classList.add(savedTheme);
    }

    // Toggle dark mode and save preference
    toggleButton.addEventListener('click', function() {
        if (body.classList.contains('dark-mode')) {
            body.classList.remove('dark-mode');
            body.classList.add('light-mode');
            sessionStorage.setItem('theme', 'light-mode');
        } else {
            body.classList.remove('light-mode');
            body.classList.add('dark-mode');
            sessionStorage.setItem('theme', 'dark-mode');
        }
    });
});
