$(function(){
	var $firLi = $('.cityman ul li:first');
	var localCity = $.cookie('localCity');
	$firLi.children('a').attr('href',localCity+'.html');

	var citys = $.cookie('citys');
	var arrCity = citys.split('/');
	var $firLi = $('.cityman ul li:first');
	for (var i = arrCity.length - 1; i > 0; i--) {
		var arr = arrCity[i].split(',');
		$firLi.after('<li><a href="'+parseInt(arr[0])+'.html">'+arr[1]+'</a><img src="images/dalete.png"></li>') 
	};

	$('.cityman ul li img').live('click',function(){
		$(this).parents('li').remove();
		
		for (var i = arrCity.length - 1; i > 0; i--) {
			arrCity[i].split(',')[0] == parseInt($(this).prev().attr('href')) && arrCity.splice(i,1);
		};
		citysL = arrCity.join('/');
		$.cookie('citys',citysL,{expires:30,path: '/'});
	})
	
})
function deleteCity(){
	$('.cityman ul li img').fadeIn();
}