function TableScan(){};

TableScan.sumColumn = function(tableID, columnName)
{
	var oTable = document.getElementById(tableID);
	if(oTable == null)
	{
		return 0;
	}
	
	//find column
	var oFirstRow = oTable.rows[0];
	for (var i=0; i<oFirstRow.cells.length; i++)
	{
		var oTd = oFirstRow.cells[i];
		if (oTd.textContent == columnName)
		{
			var iColumn = i;
			break;
		}
	}
	
	if(iColumn == undefined)
	{
		return 0;
	}
	
	//add sum up
	var nSum = 0;
	for(var i = 1; i<oTable.rows.length; i++)
	{
		var oTd = oTable.rows[i].cells[iColumn];
		if(oTd)
		{
			var oNumber = Number(oTd.textContent);
			if(!isNaN(oNumber))
			{
				nSum += oNumber;
			}
		}
	}

	return Math.round(nSum*100)/100;
};