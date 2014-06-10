/*DATES FORMATTED*/
//Timestamp
function timeStampFormatted(myDate){
	//alert("myDate TS ORIG: " + myDate);
	//alert("myDate TS No 1000: " + new Date(myDate));
	var tempDate = "" + myDate;
	
	if(tempDate != "null"){
		var myDateF = new Date(myDate);
		var hours = myDateF.getHours();
		var minutes = myDateF.getMinutes();
		var ampm = hours >= 12 ? 'PM' : 'AM';
		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? '0'+minutes : minutes;
		var myMonth = myDateF.getMonth();
		var myDay = myDateF.getDate();
		myMonth++;
		//myDay++;
		var dateTime = "";
			if(myMonth <= 9){
				dateTime = "0" + myMonth + "/" + myDay + "/" + myDateF.getFullYear() + " " + hours + ":" + minutes + " " + ampm;
			}
			if(myDay <= 9){
				dateTime = myMonth + "/" + "0" +myDay + "/" + myDateF.getFullYear() + " " + hours + ":" + minutes + " " + ampm;
			}
			if(myDay <= 9 && myMonth <= 9){
				dateTime = "0" + myMonth + "/" + "0" +myDay + "/" + myDateF.getFullYear() + " " + hours + ":" + minutes + " " + ampm;
			}
		return dateTime;
	}else{
		return "";
	}
}
//Date         		
function dateFormatted(myDate){
	//Inverse to converter
	//alert("myDate: " + myDate);
	var tempDate = "" + myDate;
	
	if(tempDate != "null"){
		var vec = tempDate.split('-');
		return vec[1] + '/' + vec[2] + '/' + vec[0];
	}else{
		return "";
	}
	
}

//Ellipsis
/*
function ellipsis(){
	//$(document).on('click','span', function(e){
	$('span').click(function(){
		var value = $(this);
		var item = value.parent();
		var label = item.find('.labelv1');
		
		var childWidth = label.width() + value.width() + 10;
		var parentWidth = item.width(); 
		
		if(childWidth >= parentWidth){
			if(item.css('overflow') == 'hidden'){
				item.css('display','block');
				item.css('text-overflow','clip');
				item.css('white-space','normal');
				item.css('overflow','visible');
				
				value.css('display','');
				value.css('text-overflow','');
				value.css('white-space','');
				value.css('overflow','');
			}else{
				item.css('display','block'); 
				item.css('text-overflow','ellipsis');
				item.css('white-space','nowrap');
				item.css('overflow','hidden');
				
				value.css('display','');
				value.css('text-overflow','');
				value.css('white-space','');
				value.css('overflow','');
			}
		}
	});
}

function ellipsisDinamic(){
	$(document).on('click','span', function(e){
	//$('span').click(function(){
		var value = $(this);
		var item = value.parent();
		var label = item.find('.labelv1');
		
		var childWidth = label.width() + value.width() + 10;
		var parentWidth = item.width(); 
		
		if(childWidth >= parentWidth){
			if(item.css('overflow') == 'hidden'){
				item.css('display','block');
				item.css('text-overflow','clip');
				item.css('white-space','normal');
				item.css('overflow','visible');
				
				value.css('display','');
				value.css('text-overflow','');
				value.css('white-space','');
				value.css('overflow','');
			}else{
				item.css('display','block'); 
				item.css('text-overflow','ellipsis');
				item.css('white-space','nowrap');
				item.css('overflow','hidden');
				
				value.css('display','');
				value.css('text-overflow','');
				value.css('white-space','');
				value.css('overflow','');
			}
		}
	});
}
*/
function ellipsis(){
	$('.oneColumn .value, .twoColumn .value, .threeColumn .value, .summaryBody .value').mouseover(function(){
		var value = $(this);
		if (value.find('input').length > 0 || value.find('select').length > 0)
			return false;		
		var item = value.parent();
		var label = item.find('.labelv1');
		
		item.hide(); //IE hack
		item.css('overflow','visible'); //IE hack
		item.show(); //IE hack				
		
		var childWidth = label.width() + value.width() + 10;
		var parentWidth = item.width(); 
		
		item.css('overflow','hidden'); //IE hack
		
		if(childWidth >= parentWidth){
			value.css('cursor','pointer');
			value.off('click');
			value.on('click', function(e) {
				if (item.css('overflow') == 'hidden')
				{
					item.css('text-overflow','clip');
					item.css('white-space','normal');
					item.css('overflow','visible');
				}
				else
				{
					item.css('text-overflow','ellipsis');
					item.css('white-space','nowrap');
					item.css('overflow','hidden');   						
				}
			});    		
		}
	});
}

function ellipsisDinamic(){
	$(document).on('mouseover','.oneColumn .value, .twoColumn .value, .threeColumn .value, .summaryBody .value', function(e){ 
		var value = $(this);
		if (value.find('input').length > 0 || value.find('select').length > 0)
			return false;		
		var item = value.parent();
		var label = item.find('.labelv1');
		
		item.hide(); //IE hack
		item.css('overflow','visible'); //IE hack
		item.show(); //IE hack				
		
		var childWidth = label.width() + value.width() + 10;
		var parentWidth = item.width(); 
		
		item.css('overflow','hidden'); //IE hack
		
		if(childWidth >= parentWidth){
			value.css('cursor','pointer');
			value.off('click');
			value.on('click', function(e) {
				if (item.css('overflow') == 'hidden')
				{
					item.css('text-overflow','clip');
					item.css('white-space','normal');
					item.css('overflow','visible');
				}
				else
				{
					item.css('text-overflow','ellipsis');
					item.css('white-space','nowrap');
					item.css('overflow','hidden');   						
				}
			});    		
		}
	});
}

function commons_getPropertySubTypes()
{
	var json = {"Agricultural":["Agribusiness-Dairy","Agribusiness-Feedlot","Agribusiness-Grain Elevator","Agribusiness-Greenhouse/Nursery","Agribusiness-Livestock Farms","Agribusiness-Poultry","Agribusiness-Swine","Other","Pasture/Ranch","Permanent Crops - Orchard/Grove/Vineyard","Row Crops","Timberland"],"Assembly/Meeting Place":["Armory/Club/Lodge Facility","Community/Recreation Center","Convention Center","Other","Reception Hall/Banquet Facility","Religious Facility"],"Equipment":["Agriculture","Asphalt","Automobiles/Pickups","Auto Repair","Aviation","Banking","Computer","Construction","Dairies Creameries","Electronic","Furniture Fixtures Equipment","Hi-Line","Industrial","Inventories","Lumber Mill Equipment","Machine Tools","Marine","Medical Dental","Mining","Mobile Homes","Oil Field","Other","Plastics","Printing Binding","Rail Locomotive","Recreational Vehicles","Restaurant","Robotics","Salon","Security System","Sport Athletic","Steel Mills","Telecommunications","Textile","Trucks Trailers","Video Post Production Audio Film","Wire Drawing/Extruding","Woodworking"],"Industrial":["Commercial Laundry","Communications/Server Farm","Condominium Bldg(s)","Condominium Unit(s)","Flex Space","Industrial-Business Park","Intermodal Facility","Manufacturing-Heavy","Manufacturing-High Tech","Manufacturing-Light","Office Showroom","Other","Processing/Production/Refinery Facility-Chemical","Processing/Production/Refinery Facility-Energy Production","Processing/Production/Refinery Facility-Food Processing","Processing/Production/Refinery Facility-Mineral Processing","Processing/Production/Refinery Facility-Waste Treatment","Processing/Production/Refinery Facility-Water Treatment","Processing/Refinery","Research and Development (R&amp;D)"," Salvage Yard","Saw Mill/Lumberyard","Self Storage/Mini-Storage Facility","Storage Yard","Tank Farm/Petroleum Storage","Truck Terminal/Hub/Transit Facility","Underground/Cave Storage","Warehouse-Air Cargo","Warehouse-Distribution Warehouse","Warehouse-Loft/Multi-Story","Warehouse-Refrigerated/Cold Storage","Warehouse-Storage Warehouse","Processing/Production/Refinery Facility-Chemical","Processing/Refinery"],"Health Care":["Acute Care Hospital","Ambulatory Surgery Center","Behavioral Care Facility","Clinical Laboratory","Comprehensive Ambulatory Care Center","Medical Center","Other","Rehabilitation Center/Hospital"],"Land":["Commercial","Easement"," Easement-Conservation/Preservation","Easement-Flowage","Easement-Right-of-Way","Industrial","Land Residential (Single Family 5+ Lots)"," Multi-Family-Apartment","Multi-Family-Apartment","Multi-Family-Duplex &amp; 3-4 Plex","Multi-Family-Other","Office","Other","Park/Open Space","Planned Development (PUD)","Retail","Subdivision-Industrial","Subdivision - Land"," Lots and Houses","Subdivision - Land and Lots","Subdivision-Office","Subdivision-Residential (5+ Lots)","Undeveloped Agricultural","Water Related-Coastal/Island","Water Related-Flood Zone","Water Related-Wetland/Marshland","Wilderness"],"Lodging/Hospitality":["All-Suites","Bed Breakfast","Campground/RV-Trailer Camp","Casino Hotel","Convention Hotel","Economy/Limited Service","Extended Stay","Full Service","Luxury","Mixed Use-Hotel-Office","Mixed Use-Hotel-Office Retail","Mixed Use-Hotel-Residential","Mixed Use-Hotel-Residential","Mixed Use-Hotel-Retail","Other"],"Multi-Family":["Age Restricted","Condominium/PUD Bldg(s)","Condominium Bldg(s)","Condominium Unit(s)","Garden/Low-Rise","Government Subsidized","Homeless Shelter","Homeless Shelter","LIHTC Tax Credits","Mid/High-Rise","Mixed Use-Office-Multi-Family","Mobile/Manufactured Home Park","Other","Student-Oriented Housing-Dormitory","Student-Oriented Housing-Fraternity/Sorority","Student-Oriented Housing-Student Oriented Apartment"],"Office":["Condominium Bldg(s)","Condominium Unit(s)","Creative/Loft","Institutional/Governmental","Medical Office","Mixed Use-Office-Industrial","Mixed Use-Office-Retail","Mixed Use-Office-Retail-Industrial","Mixed Use-Office-Retail-Multi-Family","Office/Business Park","Office/RD","Office/Warehouse","Office Building-High-Rise","Office Building-Low-Rise","-Office Building-Mid-Rise","Other"],"Residential":["2-4 units","Attached","Condominium Unit(s)","Detached","Other","Residential Land (1 to 4 Lots)","SFR"],"Retail-Commercial":["Car Wash-Full Service","Car Wash-Hybrid","Car Wash-Self Service","Condominium Bldg(s)","Condominium Unit(s)","Convenience Store","Convenience Store/Gas Station","Day Care Facility/Nursery","Free Standing Building-Bank Branch","Free Standing Building-Big Box","Free Standing Building-Department Store","Free Standing Building-Free Standing","Free Standing Building-Grocery Store","Garden Center","Laundromat-Self Serve","Mixed Use-Retail-Office","Mixed Use-Retail-Office Residential","Mixed Use-Retail-Residential","Other","Parking Facility-Garage","Parking Facility-Surface","Parking Facility","Post Office","Restaurant-Fast Food","Restaurant-Full Service","Restaurant-Limited Service","Restaurant-Sit Down","Service Station/Gas Station","Street Retail","Tavern"," Bar"," Nightclub"," Micro-Brewery","Vehicle Related-Auction Facility","Vehicle Related-Dealership","Vehicle Related-Lube Shop","Vehicle Related-Service Repair Facility","Vehicle Related-Tire Store","Vehicle Related-Truck Stop/Travel Center"],"Senior Housing":["Assisted Living Residences","Congregate Seniors Housing","Continuing Care Retirement Communities","Other","Skilled Nursing Facility"],"Shopping Center":["Community Center","Convenience/Strip Center","Fashion/Specialty Cente","Neighborhood Center","Other","Outlet Center","Power Center","Regional Center","Super Regional Center/Mall","Theme/Festival Center"],"Special Purpose":["Airport/Airplane Hangar","Cement/Rock/Gravel Plant","Cemetery/Mausoleum","Courthouse","Embassy Compound","Fire House","Funeral Home/Mortuary","Golf Related","Hospital-Veterinarian","Jail/Correctional Facility","Jail/Correctional Facility","Kennel","Landfill","Library","Marina","Marine - Repair/Service","Military Facility","Mine/Quarry","Movie Studio","Museum/Gallery","Other","Outdoor Sign","Radio/TV/Transmission","School/University","School/University-Athletic Facility","School/University-Classroom Building","Shipyard/Port Facility","Train Station/Bus Terminal","Zoo/Nature Facility"],"Sport/Entertainment":["Amusement Facility-Amusement/Theme Park","Amusement Facility-Arcade","Amusement Facility-Go-Cart Track","Amusement Facility-Miniature Golf","Amusement Facility-Waterslide Park","Aquatic Facility/Swimming Pool","Bowling Alley","Casino/Gaming Facility","Equestrian Center/Stable","Fitness"," Court and Spa Facility-Court Facility","Fitness"," Court and Spa Facility-Health Fitness Center","Fitness"," Court and Spa Facility-Spa Resort","Golf Related-Driving Range","Golf Related-Golf Course/Club","Golf Related-Golf Resort","Other","Racetrack-Auto","Racetrack-Auto","Racetrack-Dog","Racetrack-Horse","Skating Rink","Ski Resort","Sports Arena/Stadium-Indoor","Sports Arena/Stadium-Outdoor","Sports Club/Gym","Theatre/Performing Art Facility-Auditorium","Theatre/Performing Art Facility-Concert Hall/Arena","Theatre/Performing Art Facility-Drive-ln Theatre","Theatre/Performing Art Facility-Multi-Screen/Megaplex Theatre","Theatre/Performing Art Facility-Outdoor Amphitheatre","Theatre/Performing Art Facility-Single-Screen Theatre","Fitness"," Court and Spa Facility-Health Fitness Center","Sports Club/Gym"]};
	return json;
}

function commons_getPropertySpecializations()
{
	var json = ["Agricultural","Assembly/Meeting Place","Equipment","Health Care","Industrial","Land","Lodging/Hospitality","Multi-Family","Office","Residential","Retail-Commercial","Senior Housing","Shopping Center","Special Purpose","Sport/Entertainment"];
	return json;
}

var commons_srStates;
function commons_getSRStates()
{	
	if (commons_srStates === undefined)
	{
		$.ajax({
			url: '../getSRStates',
			type: 'post',
	     	dataType: 'json',
	     	async: false,
	     	success: function(data){
	     		commons_srStates = data;
	     	}
		});
	}
	return commons_srStates;
}

var commons_rfpStates;
function commons_getRFPStates()
{	
	if (commons_rfpStates === undefined)
	{
		$.ajax({
			url: '../getRFPStates',
			type: 'post',
	     	dataType: 'json',
	     	async: false,
	     	success: function(data){
	     		commons_rfpStates = data;
	     	}
		});
	}
	return commons_rfpStates;
}

var commons_SRReportTypes;
function commons_getSRReportTypes()
{	
	if (commons_SRReportTypes === undefined)
	{
		$.ajax({
			url: '../getSRReportTypes',
			type: 'post',
	     	dataType: 'json',
	     	async: false,
	     	success: function(data){
	     		commons_SRReportTypes = data;
	     	}
		});
	}
	return commons_SRReportTypes;
}

var commons_SRServiceTypes;
function commons_getSRServiceTypes()
{	
	if (commons_SRServiceTypes === undefined)
	{
		$.ajax({
			url: '../getSRServiceTypes',
			type: 'post',
	     	dataType: 'json',
	     	async: false,
	     	success: function(data){
	     		commons_SRServiceTypes = data;
	     	}
		});
	}
	return commons_SRServiceTypes;
}