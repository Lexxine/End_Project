document.addEventListener("DOMContentLoaded", function() {
    // Znajdź wszystkie elementy .recipe-item
    const recipeItems = document.querySelectorAll('.recipe-item');

    // Funkcja do pokazywania konkretnych przepisów
    function showRecipes(startIndex, endIndex) {
        for (let i = startIndex; i < endIndex; i++) {
            if (recipeItems[i]) {
                recipeItems[i].classList.add('visible');
            }
        }
    }

    // Początkowo pokaż pierwszą partię przepisów
    showRecipes(0, 32); // Zakładam, że chcesz pokazać pierwsze 32 przepisy

    // Obsługa przycisku "Load More"
    const loadMoreButton = document.getElementById('load-more');
    let visibleCount = 32; // Początkowa ilość widocznych przepisów
    const increment = 10; // Ilość przepisów do pokazania po kliknięciu "Load More"

    loadMoreButton.addEventListener('click', function() {
        visibleCount += increment;
        showRecipes(visibleCount - increment, visibleCount);

        // Ukryj przycisk "Load More", jeśli wszystkie przepisy są już widoczne
        if (visibleCount >= recipeItems.length) {
            loadMoreButton.style.display = 'none';
        }
    });
});
