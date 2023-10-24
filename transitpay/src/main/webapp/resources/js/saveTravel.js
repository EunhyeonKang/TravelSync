
$.ajax({
    type: "POST",
    url: "/selectMygroupTravelList",
    success: function (response) {
    },
    error: function (error) {
        console.error(error);
    },
});
$.ajax({
    type: "GET",
    url: "/selectBookmarkTravelList",
    success: function (response) {
        var itemContainer = document.querySelector('.item-list');
        if (response.length > 0) {
            response.forEach(function (data) {
                var itemDiv = document.createElement('div');
                itemDiv.className = 'item';
                var itemcCrd = document.createElement('div');
                itemcCrd.className = 'item-card';
                var itemImage = document.createElement('img');
                var originalURL =data.photo;
                var idMatch = originalURL.match(/id=([^&]+)/);
                var id = idMatch ? idMatch[1] : null;
                var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                itemImage.src = modifiedURL;
                itemImage.className='item-img'
                itemImage.alt = data.content;
                itemcCrd.appendChild(itemImage);

                var itemHeading = document.createElement('h2');
                itemHeading.textContent = data.content;
                itemcCrd.appendChild(itemHeading);

                var paragraphlocation = document.createElement('p');
                paragraphlocation.textContent = '지역 : ' + data.location;

                itemcCrd.appendChild(paragraphlocation);

                itemDiv.appendChild(itemcCrd);
                itemContainer.appendChild(itemDiv);
            })
        }else{

        }
    },
    error: function (error) {
        console.error(error);
    },
});


