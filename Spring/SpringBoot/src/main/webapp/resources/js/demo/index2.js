document.addEventListener("DOMContentLoaded", function () {
    const tiles = document.querySelectorAll(".recipe-item");


    tiles.forEach(function (tile) {
        const heartButtons = tile.querySelectorAll(".heart-button");
        const modalForm = tile.querySelector(".modal");

        tile.addEventListener("mouseenter", function (event) {
            heartButtons.forEach(function (button) {
                button.style.display = "block";
            });
        });

        tile.addEventListener("mouseleave", function (event) {
            heartButtons.forEach(function (button) {
                button.style.display = "none";
            });
        });

        heartButtons.forEach(function (button) {
            button.addEventListener("click", function (event) {
                modalForm.style.display = "block";

            });
        });
    });
});
