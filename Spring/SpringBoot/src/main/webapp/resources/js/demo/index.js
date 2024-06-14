document.addEventListener("DOMContentLoaded", function() {
    const tiles = document.querySelectorAll("#tilesContainer .card");

    tiles.forEach(function(tile) {
        const editBtn = tile.querySelector(".edit-btn");
        const deleteForm = tile.querySelector("form");

        tile.addEventListener("mouseenter", function() {
            editBtn.style.display = "inline-block";
            deleteForm.style.display = "inline";
        });

        tile.addEventListener("mouseleave", function() {
            editBtn.style.display = "none";
            deleteForm.style.display = "none";
        });
    });
});
