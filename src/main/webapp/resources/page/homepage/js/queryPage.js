/**
 * 
 */


window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	$(".notebooklist").load("notebooklist.jsp", function() {
	});
	$(".textareaPage").load("textareaPage.jsp", function() {
		createtext();
	});
}