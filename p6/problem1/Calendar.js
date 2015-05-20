// JavaScript Document
function Calendar(divID)
{
	this.divID = divID;
};

Calendar.prototype.render = function(date)
{
	var aDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	var aMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	
	//header
	var sPHeader = "<p><a id = 'prevMonth"+this.divID+"'>&lt;</a>" +aMonths[date.getMonth()] + ", " + (date.getYear()+1900)+"<a id = 'nextMonth"+this.divID+"'>&gt;</a></p>";
	
	//table
	var sTable = "";
	
	//days
	var sTrDays = "";
	for (var i=0; i<aDays.length; i++)
	{
		sTrDays += "<td>"+aDays[i]+"</td>";
	}
	sTrDays = "<tr class = 'header'>" + sTrDays + "</tr>";
	sTable += sTrDays;
	
	//dates last month
	var sTdLastMonth = "";
	var dLastMonth = new Date(date.getYear(), date.getMonth(), 0);
	var iDayLastMonth = dLastMonth.getDate();
	for (var i=date.getDay()-1; i>=0; i--)
	{
		sTdLastMonth = "<td class = 'dim'>"+iDayLastMonth+"</td>"+sTdLastMonth;
		iDayLastMonth--;
	}
	
	//dates first week
	var iDate = 1;
	var sTdFirstWeek = "";
	for (var i=date.getDay(); i<aDays.length; i++)
	{
		sTdFirstWeek += "<td>"+iDate+"</td>";
		iDate++;
	}
	
	var sTrFirstWeek = "<tr>" + sTdLastMonth + sTdFirstWeek + "</tr>";
	
	//dates second week to end
	var sTrFollowingWeeks = "";
	var dNextMonth = new Date(date.getYear(), date.getMonth()+1, 0);
	var iNumIterations = (dNextMonth.getDate()-iDate+1)/aDays.length;
	var x = dNextMonth.getDate()-iDate+1;
	for(var j=1; j<=iNumIterations; j++)
	{
		var sTdFollowingWeek = "";
		for(var i=0; i<aDays.length; i++)
		{
			sTdFollowingWeek += "<td>"+iDate+"</td>";
			iDate++;
		}
		sTdFollowingWeek = "<tr>" + sTdFollowingWeek + "</tr>";
		sTrFollowingWeeks += sTdFollowingWeek;
	}
	
	//dates last week
	var sTrLastWeek = "";
	var iDay = 0;
	while(iDate <= dNextMonth.getDate())
	{
		sTrLastWeek += "<td>" + iDate + "</td>";
		iDate++;
		iDay++;
	}

	//dates next month
	var iNextMonth = 1;
	while (iDay > 0 && iDay < aDays.length)
	{
		sTrLastWeek += "<td class = 'dim'>" + iNextMonth + "</td>";
		iNextMonth++;
		iDay++;
	}
	sTrLastWeek = "<tr>"+sTrLastWeek+"</tr>";
	
	sTable = "<table cellspacing='0'>" + sTable + sTrFirstWeek + sTrFollowingWeeks + sTrLastWeek + "</table>";
	var oDiv = document.getElementById(this.divID);
	oDiv.innerHTML = sPHeader + sTable;
	
	var oPrevMonth = document.getElementById("prevMonth"+this.divID);
	var oNextMonth = document.getElementById("nextMonth"+this.divID);
	var obj = this;
	oPrevMonth.onclick = function()
	{
		obj.render(new Date(date.getYear()+1900, date.getMonth()-1, 1));
	}
	
	oNextMonth.onclick = function()
	{
		obj.render(new Date(date.getYear()+1900, date.getMonth()+1, 1));
	}
}