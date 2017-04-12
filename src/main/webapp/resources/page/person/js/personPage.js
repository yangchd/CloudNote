/**
 * 
 */

window.onload = function(){
	$("#homeTitle").load("../homepage/homeTitle.jsp", function() {
		homeTitle();
    });
}