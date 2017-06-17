/**
 * ajax module
 * write by 양혜민
 */

var httpRequest = null;

function sendRequest(method, url, param, callback){
	httpRequest = new XMLHttpRequest();
	
	var httpMethod = method ? method : "GET";
	//method가 null이면 method값으로 아니면 "Get"으로
	if(httpMethod != "Get" && httpMethod != "POST"){
		httpMethod="GET";
	}//오타방지
	
	var httpParam = (param == null || param == "")?null : param;
	//param이 없으면 null처리 있으면 그대로
	if(httpMethod == "GET" && httpParam != null){
		url = url + "?" + httpParam;
	}
	
	httpRequest.open(httpMethod, url, true);
	httpRequest.onreadystatechange = callback;
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
	httpRequest.send(httpMethod=="POST"?httpParam:null);
	
}