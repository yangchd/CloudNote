/**
 * 工具类
 */

var url = "http://localhost:8080/cloudnote";
//var url = "http://192.168.1.110:8080/cloudnote";

var getUrl = function(){
	return url;
}

/**
 * 调用该函数添加鼠标滑过时的动画效果
 */
function addactive(){
	$("#homePage_ul").find('li').on('mouseenter',function(){
		if($(this).attr("class")){
			var vaclass = $(this).attr("class");
			$(this).attr("class",vaclass+" active");
		}else{
			$(this).attr("class"," active");
		}
	})
	$("#homePage_ul").find('li').on('mouseleave',function(){
		var vaclass = $(this).attr("class");
		if(vaclass == " active"){
			$(this).removeAttr("class");
		}else{
			if(vaclass.indexOf(" active")>=0){
				vaclass = vaclass.replace(" active","");
				$(this).attr("class",vaclass);
			}
		}
	})
}

window.onload = function(){
}






