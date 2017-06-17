/**
 * ajax module
 * write by netsong7
 */

var httpRequest = null;

function sendRequest(method, url, param, callback){
	httpRequest = new XMLHttpRequest();
	
	var httpMethod = method ? method : "GET";
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	var httpParam = (param==null || param=="") ? null : param;
	
	if(httpMethod == "GET" && httpParam != null){
		url = url + "?" + httpParam;
	}
	
	httpRequest.open(httpMethod, url, true);
	httpRequest.onreadystatechange=callback;
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
	httpRequest.send(httpMethod=="POST"?httpParam:null);
}