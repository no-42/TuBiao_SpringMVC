window.onload = function() { //获取浏览器窗口高度  
	var winHeight = 0;
	var winWidth = 0;
	if(window.innerHeight & window.innerWidth) {
		winHeight = window.innerHeight;
		winWidth = window.innerWidth;
	} else if((document.body) && (document.body.clientHeight) && (document.body.clientWidth)) {
		winHeight = document.body.clientHeight;
		winWidth = document.body.clientWidth;
		//通过深入Document内部对body进行检测，获取浏览器窗口高度  
	}
	if(document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
		winHeight = document.documentElement.clientHeight;
		winWidth = document.documentElement.clientWidth;
		//DIV高度为浏览器窗口的高度  
	}
	document.getElementById("mainbox").style.height = winHeight * 0.999 + "px";
	document.getElementById("mainbox").style.width = winWidth * 0.999 + "px";
	document.getElementById("toptext").style.width = winWidth * 0.999 + "px";
	document.getElementById("toptext").style.height = winHeight * 0.999 * 0.08 + "px";
	document.getElementById("secondtoptext").style.width = winWidth * 0.999 + "px";
	document.getElementById("secondtoptext").style.height = winHeight * 0.999 * 0.04 + "px";
	document.getElementById("lefttopbox").style.height = winHeight * 0.999 * 0.35 + "px";
	document.getElementById("lefttopbox").style.width = winWidth * 0.999 * 0.23 + "px";
	document.getElementById("leftbottombox").style.height = winHeight * 0.999 * 0.35 + "px";
	document.getElementById("leftbottombox").style.width = winWidth * 0.999 * 0.23 + "px";
	document.getElementById("box").style.height = winHeight * 0.999 * 0.48 + "px";
	document.getElementById("box").style.width = winWidth * 0.999 * 0.48 + "px";
	document.getElementById("secondbox").style.height = winHeight * 0.999 * 0.24 + "px";
	document.getElementById("secondbox").style.width = winWidth * 0.999 * 0.48 + "px";
	document.getElementById("righttopbox").style.height = winHeight * 0.999 * 0.35 + "px";
	document.getElementById("righttopbox").style.width = winWidth * 0.999 * 0.23 + "px";
	document.getElementById("rightbottombox").style.height = winHeight * 0.999 * 0.35 + "px";
	document.getElementById("rightbottombox").style.width = winWidth * 0.999 * 0.23 + "px";
}
