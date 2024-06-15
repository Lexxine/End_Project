document.addEventListener('DOMContentLoaded', function () {
    const scrollLeftButton = document.getElementById('scrollLeft');
    const scrollRightButton = document.getElementById('scrollRight');
    const boardWrapper = document.getElementById('boardWrapper');
    const boardItems = document.querySelectorAll('.board-item');
    const visibleClass = 'visible';
    const itemsPerPage = 7; // Number of visible items at a time
    let currentIndex = 0;

    function updateVisibleItems() {
        boardItems.forEach((item, index) => {
            if (index >= currentIndex && index < currentIndex + itemsPerPage) {
                item.classList.add(visibleClass);
            } else {
                item.classList.remove(visibleClass);
            }
        });
        boardWrapper.style.transform = `translateX(-${currentIndex * (100 / itemsPerPage)}%)`;
    }

    scrollLeftButton.addEventListener('click', function () {
        if (currentIndex > 0) {
            currentIndex--;
            updateVisibleItems();
        }
    });

    scrollRightButton.addEventListener('click', function () {
        if (currentIndex < boardItems.length - itemsPerPage) {
            currentIndex++;
            updateVisibleItems();
        }
    });

    // Initialize visible items
    updateVisibleItems();
});
