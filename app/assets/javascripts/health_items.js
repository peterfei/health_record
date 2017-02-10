//正常值和取值范围验证
function validate(){
  var value_range = $("#health_item_value_range").val();
  var normal_min = $("#health_item_normal_min").val();
  var normal_max = $("#health_item_normal_max").val();
  if(value_range){
    var value_arr = value_range.split(",");
    if(value_arr.length != 2){
      alert("取值范围格式错误!");
      return false;
    }else{
      if(normal_min){
        if(normal_min<value_arr[0]){
          alert("正常最小值不能小于取值范围最小值!");
          return false;
        }
      }
      if(normal_max){
        if(normal_max>value_arr[1]){
          alert("正常最大值不能大于取值范围最大值!");
          return false;
        }
      }
    }
  }else{
    alert("取值范围不能为空!");
    return false;
  }

  return true;
}