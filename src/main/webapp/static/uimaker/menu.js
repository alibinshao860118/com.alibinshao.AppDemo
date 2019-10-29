var SystemMenu = [];
$.ajax({
	url : ctx + "/sys/sysMenu/getMenus",
	type : 'GET',
	async : false,
	dataType : "json",
	success : function(data) {
		SystemMenu = data;
	}
});