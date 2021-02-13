var Page = {
	init: function (cbfunc) {
		AJAX.call("session.jsp", null, function(data) {
			var ustr = data.trim();
			if (ustr == "null") {
				alert("로그인이 필요한 서비스입니다.");
				window.location.href = "login.html";
			}
			else {
				var usrobj = JSON.parse(ustr);
				cbfunc(usrobj);
			}
		});
	},
	
	getUsrobj: function (cbfunc) {
		AJAX.call("session.jsp", null, function(data) {
			var ustr = data.trim();
			var usrobj = (ustr == "null") ? null : JSON.parse(ustr);
				cbfunc(usrobj);
		});
	}
};

var AJAX = {
	call: function (url, params, onSuccess) {
		jQuery.ajax({
			url: url,	
			type: "post",
			data: params,
			cache: false,
			dataType: "text",
			success: onSuccess,
			error: function (xhr, status, error) {
				if (xhr.status == 0) {
				    alert("네트워크 접속이 원활하지 않습니다.");
				}
				else {
					var str = "code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error;
					console.log(str);
					alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
				}
			},
		});
	},

	formCall: function (url, params, onSuccess) {
		var callobj = {};
		callobj["url"] = url;
		callobj["type"] = "POST";
		callobj["data"] = params;
		callobj["processData"] = false;
		callobj["contentType"] = false;
		callobj["cache"] = false;
		callobj["dataType"] = "text";
		callobj["success"] = onSuccess; 
		callobj["error"] = function (xhr, status, error) {
			if (xhr.status == 0) {
			    alert("네트워크 접속이 원활하지 않습니다.");
			}
			else {
				var str = "code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error;
				console.log(str);
			    alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
			}
		};
		jQuery.ajax(callobj);
	},
};