function AjaxRequest(method, url, successFunc, failFunc)
 {
 	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4)
		{
			if (this.status == 200)
			{
				var response = JSON.parse(xhr.responseText);
				successFunc(response);
			}
			else
			{
				failFunc();
			}
		}
	};
	xhr.open(method, url);
	xhr.send();
 };