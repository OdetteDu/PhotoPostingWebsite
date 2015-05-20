function Tagger(container, feedback, leftForm, topForm, widthForm, heightForm)
{
	this.container = document.getElementById(container);
	this.feedback = document.getElementById(feedback);
    this.leftForm= document.getElementById(leftForm);
    this.topForm= document.getElementById(topForm);
    this.widthForm= document.getElementById(widthForm);
    this.heightForm= document.getElementById(heightForm);
	var obj = this;

	this.container.onmousedown = function(event){
        obj.onMouseDown(event);
    }

	document.onmouseup = function(event){
        obj.onMouseUp(event);
    }

	document.onmousemove = function(event){
        obj.onMouseMove(event);
    }
};

Tagger.prototype.onMouseDown = function(event)
{
    var obj = this;
    obj.isMouseDown = true;
    obj.x1 = event.pageX - this.container.offsetLeft;
    obj.y1 = event.pageY - this.container.offsetTop;
    this.feedback.style.left = obj.x1 + 'px';
    obj.left = obj.x1;
    this.feedback.style.top = obj.y1 + 'px';
    obj.top = obj.y1;
    this.feedback.style.width = 0;
    obj.width = 0;
    this.feedback.style.height = 0;
    obj.height = 0;
    feedback.className = "mouseMove";
    event.preventDefault();
};

Tagger.prototype.onMouseUp = function(event)
{
    var obj = this;
    obj.isMouseDown = false;
    if (obj.isMouseDown) 
    {
        return;
    }

    this.feedback.className = "mouseUp";
    this.leftForm.value = obj.left;
    this.topForm.value = obj.top;
    this.widthForm.value = obj.width;
    this.heightForm.value = obj.height;

    event.preventDefault();
};

Tagger.prototype.onMouseMove = function(event)
{
    var obj = this;
    if (!obj.isMouseDown) 
    {
        return;
    }

    var newX = event.pageX - this.container.offsetLeft;
    var newY = event.pageY - this.container.offsetTop;

    if(newX < 0)
    {
        newX = 0;
    }

    if(newX > this.container.offsetWidth-2)
    {
        newX = this.container.offsetWidth-2;
    }

    if(newY < 0)
    {
        newY = 0;
    }

    if(newY > this.container.offsetHeight-5)
    {
        newY = this.container.offsetHeight-5;
    }

    if(newX < obj.x1)
    {
        this.feedback.style.left = newX + 'px';
        obj.left = newX;
    }
    else
    {
        this.feedback.style.left = obj.x1 + 'px';
        obj.left = obj.x1;
    }

    if(newY < obj.y1)
    {
        this.feedback.style.top = newY + 'px';
        obj.top = newY;
    }
    else
    {
        this.feedback.style.top = obj.y1 + 'px';
        obj.top = obj.y1;
    }

    var width = Math.abs(newX - obj.x1);
    this.feedback.style.width = width + 'px';
    obj.width = width;

    var height = Math.abs(newY - obj.y1) ;
    this.feedback.style.height = height + 'px'; 
    obj.height = height;    
};