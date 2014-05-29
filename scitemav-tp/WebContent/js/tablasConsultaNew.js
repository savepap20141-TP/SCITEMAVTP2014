var osset='';

function realizarTabla2(id,columnas,filas){
	var contenido = '';
	$("#spnResultList_"+id).empty();
	
	contenido = contenido + '<div id="container_'+id+'" class="dataTables_scroll"> '+
		'<div id="dt_example_'+id+'" role="grid" class="dataTables_wrapper dataTables_scrollBody" style="width: 100%; height: 100%;"> '+
			'<table cellpadding="0" cellspacing="0" border="0" class="display" id="example_'+id+'"> '+
			' <thead class="tableGri"> '+
	            '<tr role="row">'+
	            	columnas+							                            
	            '</tr>'+
	        '</thead> '+
	        '<tbody id="'+id+'">';
	contenido = contenido + filas;   
	contenido = contenido + '</tbody>'+
			'</table> '+
		'</div> '+
		'<div class="spacer"></div> '+
		'</div>';
	
	$("#spnResultList_"+id).append(contenido);
		$('#example_'+id).dataTable({
		    "aaSorting": [],
		    "oLanguage": {
				           "sLengthMenu": '<select class="form-control input-sm" style="" id="valshow_'+id+'">'+
				             '<option value="10">10</option>'+
				             '<option value="25">25</option>'+
				             '<option value="50">50</option>'+
				             '<option value="100">100</option>'+
				             '<option value="200">200</option>'+
				             '</select>'
				         ,"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ Resultados"
				         ,"sZeroRecords": "No se encontraron resultados"
				         ,"sInfoEmpty": "Mostrando 0 a 0 de 0 Resultados"
				         ,"sInfoFiltered": "(filtrado de _MAX_ totales Resultados)"}
		
		});
	changeListView2();
}
//Estos son los metodos necesarios para que funcione la tabla de consulta

function changeListView2(id){
	var iVal = $("#valshow_"+id).val();
	
	/* Update all other length options for the new display */
	var n = osset.aanFeatures.l;
	for ( i=0, iLen=n.length ; i<iLen ; i++ )
	{
		if ( n[i] != $("#valshow_"+id).parentNode )
		{
			$('select', n[i]).val( iVal );
		}
	}
	
	/* Redraw the table */
	osset._iDisplayLength = parseInt(iVal, 10);
	_fnCalculateEnd( osset );
	
	/* If we have space to show extra rows (backing up from the end point - then do so */
	if ( osset.fnDisplayEnd() == osset.fnRecordsDisplay() )
	{
		osset._iDisplayStart = osset.fnDisplayEnd() - osset._iDisplayLength;
		if ( osset._iDisplayStart < 0 )
		{
			osset._iDisplayStart = 0;
		}
	}
	
	if ( osset._iDisplayLength == -1 )
	{
		osset._iDisplayStart = 0;
	}
	_fnDraw( osset );
}
function _fnCalculateEnd( oSettings )
{
	if ( oSettings.oFeatures.bPaginate === false )
	{
		oSettings._iDisplayEnd = oSettings.aiDisplay.length;
	}
	else
	{
		/* Set the end point of the display - based on how many elements there are
		 * still to display
		 */
		if ( oSettings._iDisplayStart + oSettings._iDisplayLength > oSettings.aiDisplay.length ||
			   oSettings._iDisplayLength == -1 )
		{
			oSettings._iDisplayEnd = oSettings.aiDisplay.length;
		}
		else
		{
			oSettings._iDisplayEnd = oSettings._iDisplayStart + oSettings._iDisplayLength;
		}
	}
}
function _fnDraw( oSettings )
{
	/* Provide a pre-callback function which can be used to cancel the draw is false is returned */
	var aPreDraw = _fnCallbackFire( oSettings, 'aoPreDrawCallback', 'preDraw', [oSettings] );
	if ( $.inArray( false, aPreDraw ) !== -1 )
	{
		_fnProcessingDisplay( oSettings, false );
		return;
	}
	
	var i, iLen, n;
	var anRows = [];
	var iRowCount = 0;
	var iStripes = oSettings.asStripeClasses.length;
	var iOpenRows = oSettings.aoOpenRows.length;
	
	oSettings.bDrawing = true;
	
	/* Check and see if we have an initial draw position from state saving */
	if ( oSettings.iInitDisplayStart !== undefined && oSettings.iInitDisplayStart != -1 )
	{
		if ( oSettings.oFeatures.bServerSide )
		{
			oSettings._iDisplayStart = oSettings.iInitDisplayStart;
		}
		else
		{
			oSettings._iDisplayStart = (oSettings.iInitDisplayStart >= oSettings.fnRecordsDisplay()) ?
				0 : oSettings.iInitDisplayStart;
		}
		oSettings.iInitDisplayStart = -1;
		_fnCalculateEnd( oSettings );
	}
	
	/* Server-side processing draw intercept */
	if ( oSettings.bDeferLoading )
	{
		oSettings.bDeferLoading = false;
		oSettings.iDraw++;
	}
	else if ( !oSettings.oFeatures.bServerSide )
	{
		oSettings.iDraw++;
	}
	else if ( !oSettings.bDestroying && !_fnAjaxUpdate( oSettings ) )
	{
		return;
	}
	
	if ( oSettings.aiDisplay.length !== 0 )
	{
		var iStart = oSettings._iDisplayStart;
		var iEnd = oSettings._iDisplayEnd;
		
		if ( oSettings.oFeatures.bServerSide )
		{
			iStart = 0;
			iEnd = oSettings.aoData.length;
		}
		
		for ( var j=iStart ; j<iEnd ; j++ )
		{
			var aoData = oSettings.aoData[ oSettings.aiDisplay[j] ];
			if ( aoData.nTr === null )
			{
				_fnCreateTr( oSettings, oSettings.aiDisplay[j] );
			}

			var nRow = aoData.nTr;
			
			/* Remove the old striping classes and then add the new one */
			if ( iStripes !== 0 )
			{
				var sStripe = oSettings.asStripeClasses[ iRowCount % iStripes ];
				if ( aoData._sRowStripe != sStripe )
				{
					$(nRow).removeClass( aoData._sRowStripe ).addClass( sStripe );
					aoData._sRowStripe = sStripe;
				}
			}
			
			/* Row callback functions - might want to manipulate the row */
			_fnCallbackFire( oSettings, 'aoRowCallback', null, 
				[nRow, oSettings.aoData[ oSettings.aiDisplay[j] ]._aData, iRowCount, j] );
			
			anRows.push( nRow );
			iRowCount++;
			
			/* If there is an open row - and it is attached to this parent - attach it on redraw */
			if ( iOpenRows !== 0 )
			{
				for ( var k=0 ; k<iOpenRows ; k++ )
				{
					if ( nRow == oSettings.aoOpenRows[k].nParent )
					{
						anRows.push( oSettings.aoOpenRows[k].nTr );
						break;
					}
				}
			}
		}
	}
	else
	{
		/* Table is empty - create a row with an empty message in it */
		anRows[ 0 ] = document.createElement( 'tr' );
		
		if ( oSettings.asStripeClasses[0] )
		{
			anRows[ 0 ].className = oSettings.asStripeClasses[0];
		}

		var oLang = oSettings.oLanguage;
		var sZero = oLang.sZeroRecords;
		if ( oSettings.iDraw == 1 && oSettings.sAjaxSource !== null && !oSettings.oFeatures.bServerSide )
		{
			sZero = oLang.sLoadingRecords;
		}
		else if ( oLang.sEmptyTable && oSettings.fnRecordsTotal() === 0 )
		{
			sZero = oLang.sEmptyTable;
		}

		var nTd = document.createElement( 'td' );
		nTd.setAttribute( 'valign', "top" );
		nTd.colSpan = _fnVisbleColumns( oSettings );
		nTd.className = oSettings.oClasses.sRowEmpty;
		nTd.innerHTML = _fnInfoMacros( oSettings, sZero );
		
		anRows[ iRowCount ].appendChild( nTd );
	}
	
	/* Header and footer callbacks */
	_fnCallbackFire( oSettings, 'aoHeaderCallback', 'header', [ $(oSettings.nTHead).children('tr')[0], 
		_fnGetDataMaster( oSettings ), oSettings._iDisplayStart, oSettings.fnDisplayEnd(), oSettings.aiDisplay ] );
	
	_fnCallbackFire( oSettings, 'aoFooterCallback', 'footer', [ $(oSettings.nTFoot).children('tr')[0], 
		_fnGetDataMaster( oSettings ), oSettings._iDisplayStart, oSettings.fnDisplayEnd(), oSettings.aiDisplay ] );
	
	/* 
	 * Need to remove any old row from the display - note we can't just empty the tbody using
	 * $().html('') since this will unbind the jQuery event handlers (even although the node 
	 * still exists!) - equally we can't use innerHTML, since IE throws an exception.
	 */
	var
		nAddFrag = document.createDocumentFragment(),
		nRemoveFrag = document.createDocumentFragment(),
		nBodyPar, nTrs;
	
	if ( oSettings.nTBody )
	{
		nBodyPar = oSettings.nTBody.parentNode;
		nRemoveFrag.appendChild( oSettings.nTBody );
		
		/* When doing infinite scrolling, only remove child rows when sorting, filtering or start
		 * up. When not infinite scroll, always do it.
		 */
		if ( !oSettings.oScroll.bInfinite || !oSettings._bInitComplete ||
		 	oSettings.bSorted || oSettings.bFiltered )
		{
			while( (n = oSettings.nTBody.firstChild) )
			{
				oSettings.nTBody.removeChild( n );
			}
		}
		
		/* Put the draw table into the dom */
		for ( i=0, iLen=anRows.length ; i<iLen ; i++ )
		{
			nAddFrag.appendChild( anRows[i] );
		}
		
		oSettings.nTBody.appendChild( nAddFrag );
		if ( nBodyPar !== null )
		{
			nBodyPar.appendChild( oSettings.nTBody );
		}
	}
	
	/* Call all required callback functions for the end of a draw */
	_fnCallbackFire( oSettings, 'aoDrawCallback', 'draw', [oSettings] );
	
	/* Draw is complete, sorting and filtering must be as well */
	oSettings.bSorted = false;
	oSettings.bFiltered = false;
	oSettings.bDrawing = false;
	
	if ( oSettings.oFeatures.bServerSide )
	{
		_fnProcessingDisplay( oSettings, false );
		if ( !oSettings._bInitComplete )
		{
			_fnInitComplete( oSettings );
		}
	}
}
function _fnCallbackFire( oSettings, sStore, sTrigger, aArgs )
{
	var aoStore = oSettings[sStore];
	var aRet =[];

	for ( var i=aoStore.length-1 ; i>=0 ; i-- )
	{
		aRet.push( aoStore[i].fn.apply( oSettings.oInstance, aArgs ) );
	}

	if ( sTrigger !== null )
	{
		$(oSettings.oInstance).trigger(sTrigger, aArgs);
	}

	return aRet;
}
function _fnProcessingDisplay ( oSettings, bShow )
{
	if ( oSettings.oFeatures.bProcessing )
	{
		var an = oSettings.aanFeatures.r;
		for ( var i=0, iLen=an.length ; i<iLen ; i++ )
		{
			an[i].style.visibility = bShow ? "visible" : "hidden";
		}
	}

	$(oSettings.oInstance).trigger('processing', [oSettings, bShow]);
}
function _fnGetDataMaster ( oSettings )
{
	var aData = [];
	var iLen = oSettings.aoData.length;
	for ( var i=0 ; i<iLen; i++ )
	{
		aData.push( oSettings.aoData[i]._aData );
	}
	return aData;
}