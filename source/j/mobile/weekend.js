$(function(){
    var cityId = document.URL.match(/\w{9,}/);
    $('.yb_l dl').click(function(){
        var index = parseInt($(this).attr('data-role'))+1;
        window.open('http://wap.weather.com.cn/fine/'+cityId+'.shtml?day='+index,'_self')
    })
})