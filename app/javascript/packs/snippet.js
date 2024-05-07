document.addEventListener('DOMContentLoaded', function() {
    fetch('/snippets.json')
        .then(response => response.json())
        .then(snippets => {
            const list = document.getElementById('snippetsList');
            snippets.forEach(snippet => {
                const item = document.createElement('div');
                item.className = 'snippet';
                item.innerHTML = `
                    <h2>${snippet.title}</h2>
                    <p>${snippet.code}</p>
                    <a href="/snippets/${snippet.id}">View Details</a>
                `;
                list.appendChild(item);
            });
        });
});
