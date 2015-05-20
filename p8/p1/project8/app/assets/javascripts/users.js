var search = new Search("searchField", "searchResults", "/photos/search", "word", function(response)
{
     var photos = response["result"];
     console.log(response);
     var display = "";
     for(i=0; i<photos.length; i++)
     {
          var photo = photos[i];
          display += "<a href = '"+photo.url+"'><img src='" + photo.image + "' /></a>"
     }
     return display;
});