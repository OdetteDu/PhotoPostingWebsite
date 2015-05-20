var tags = document.getElementsByClassName("tag");
for(i=0; i<tags.length; i++)
{
	tags[i].onmouseover = function()
	{
		var person = this.getElementsByTagName("p");
		person[0].style.display = "inline-block";
	}

	tags[i].onmouseout = function()
	{
		var person = this.getElementsByTagName("p");
		person[0].style.display = "none";
	}
}