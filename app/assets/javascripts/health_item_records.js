$(document).ready(function(){
	$("#q_health_item_user_id_eq").change(function(){
		var user_id=$("#q_health_item_user_id_eq").val();
		var str = "";
		if(user_id){
			$.post("/health_item_records/get_health_items", { user_id: user_id},
				function(result) {
					if(result && result.length>0){
						$("#q_health_item_id_eq").html('');
						for(var i=0;i<result.length;i++){
							str += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
						}
						$("#q_health_item_id_eq").html(str);
					}else{
						$("#q_health_item_id_eq").html('');
						$("#q_health_item_id_eq").html(str);
					}
				},'json');
		}else{
			$("#q_health_item_id_eq").html('');
			$("#q_health_item_id_eq").html(str);
		}
	});
});