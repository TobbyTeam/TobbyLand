var timeOut = 1000 * 60 * 15; // 15 minutes
var lastActivity = new Date().getTime();
var checkTimeout;
checkTimeOut = function(){
    if(new Date().getTime() > lastActivity + timeOut){
        alert("세션이 만료되었습니다. 로그인페이지로 이동합니다.")
        location.href = "/login"; // redirect to timeout page
    }else{
        window.setTimeout(checkTimeOut, 1000); // check once per second
    }
}

window.onload = checkTimeOut;

$("*").mousemove(function() {
    lastActivity = new Date().getTime();
});

$("*").keydown(function() {
    lastActivity = new Date().getTime();
});