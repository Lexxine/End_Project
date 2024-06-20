
    let from = 0;
    const to = 10;
    const query = 'chicken'; // Example query, this can be dynamic

    function loadRecipes() {
        $.get('/recipes', {query, from, to: from + to}, function (data) {
            from += to;
            if (data.length > 0) {
                data.forEach(recipe => {
                    $('#recipes-container').append(`
                        <div class="recipe-item col-xl-3 col-md-6 mb-4">
                            <img src="${recipe.imageUrl}" alt="${recipe.name}">
                            <div class="recipe-info">
                                <h2>${recipe.name}</h2>
                            </div>
                        </div>
                    `);
                });
                $('#load-more').show();
            } else {
                $('#load-more').hide();
            }
        });
    }

    $(document).ready(function () {
        loadRecipes();

        $('#load-more').click(function () {
            loadRecipes();
        });
    });


