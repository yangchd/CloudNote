/**
 * 
 */

window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		$('#gotohomepage').on('click',function(){
			window.location.href=getUrl()+"/page/homepage/homePage.jsp";
		})
    });
}