/**
 * 
 */

function homeTitle(){
	$('#gotohomepage').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/homePage.jsp";
	})
	$('#gotonotepage').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp";
	})
	$('#gototeampage').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/teamPage.jsp";
	})
	$('#logoutbtn').on('click',function(){
		window.location.href=getUrl()+"/page/login/login.jsp";
	})
}
