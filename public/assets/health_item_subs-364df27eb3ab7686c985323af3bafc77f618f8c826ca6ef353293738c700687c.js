//添加子项目验证
function validate(){
  var name = $("#health_item_sub_name").val();
  var sub_value_range = $("#health_item_sub_sub_value_range").val();
  if(!name){
    alert("子项目名称不能为空!");
    return false;
  }
  if(!sub_value_range){
    alert("取值范围不能为空!");
    return false;
  }

  return true;
}
;
