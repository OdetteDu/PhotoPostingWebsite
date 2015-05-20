function Search(searchFieldId, searchResultsId, searchUrl, param, updateFunc)
{
     var searchField = document.getElementById(searchFieldId);
     var searchResults = document.getElementById(searchResultsId);

     searchField.onkeyup = function(){
          var text = searchField.value;
          var url = searchUrl + "?"+ param + "=" + encodeURIComponent(text);
          var request = new AjaxRequest("GET", url, function(response){
               var result = updateFunc(response);
               searchResults.innerHTML = result;
          });
     };
};
