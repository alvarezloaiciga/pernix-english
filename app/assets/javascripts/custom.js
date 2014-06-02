$(document).ready(function(){
	"use strict"
	
	////////////////////////
	///////////////////////////////////////////////////////////////
    //Detect Operatiing System and Enable Smooth Scrolling != Mac//
	///////////////////////////////////////////////////////////////
	
	var OSName="Unknown OS";
	if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
	else if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
	else if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
	else if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";
	
	if (OSName!="MacOS"){
		$.srSmoothscroll();
	}
	
	//////////////////////
	///Deploy Navigation//   
    //////////////////////
   
	$('.deploy-navigation').click(function(){
		$('.navigation').toggleClass('navigation-active');
		return false;
	});
	
	$('.navigation a').click(function(){
		//$('.navigation').removeClass('navigation-active'); 
	});
	
	///////////////////////////////
	///Scolling navigation system//
	///////////////////////////////
	
	$.scrollIt({
		upKey: 38,             // key code to navigate to the next section
	  	downKey: 40,           // key code to navigate to the previous section
		easing: 'easeInOutExpo',      // the easing function for animation
		scrollTime: 600,       // how long (in ms) the animation takes
		activeClass: 'active-navigation-item', // class given to the active nav element
		onPageChange: null,    // function(pageIndex) that is called when page is changed
		topOffset: -70           // offste (in px) for fixed top navigation
	});
		  

});

















