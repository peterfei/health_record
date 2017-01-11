//获取病历记录
function checkmedicalrecords(){
  var user_id = $("#user_id").val();
  var start_at = $("#start_at").val();
  var end_at = $("#end_at").val();
  var category = $("#category").val();
  $.post("/users/check_medical_records", { user_id: user_id, start_at: start_at, end_at: end_at, category: category },
    function(result) {
      if(result && result.length>0){
        $("#medical_records_info").html('');
        var str = '<div class="box col-md-12"><div class="box-inner"><div class="box-content">';
        for(var i=0;i<result.length;i++){
          str += '<h3>'+result[i].record_date+'</h3>';
          str += '<ul class="thumbnails">';
          for(var j=0;j<result[i].record_content.length;j++){
            str += '<li class="thumbnail">'+
              '<a href="'+result[i].record_content[j].image_path+'" target="_blank">'+
                '<img src="'+result[i].record_content[j].image_path+'" />'+
              '</a>'+
              '<hr style="margin-top:0px;margin-bottom:0px;border-color:#000;"/>'+
              '<dt class="text-center">'+result[i].record_content[j].name+'</dt>'+
            '</li>';
          }
          str += '</ul>';
        }
        str += '</div></div></div>';
        $("#medical_records_info").html(str);
      }else{
        $("#medical_records_info").html('');
        var str = '<div class="box col-md-12"><div class="box-inner"><div class="box-content">';
        str += '<h3 class="text-center">暂无数据</h3>';
        str += '</div></div></div>';
        $("#medical_records_info").html(str);
      }
    },'json');
}
//获取数据统计
function checkreitemrecords(){
  var start_at = $("#start_at_record").val();
  var end_at = $("#end_at_record").val();
  var health_item_id = $("#health_item_id").val();
  $.post("/users/check_item_records", { start_at: start_at, end_at: end_at, health_item_id: health_item_id },
    function(result) {
      if(result){
        $("#item_records_info").html('');
        var str = '<div class="box col-md-12"><div class="box-inner"><div class="box-content"><table class="table table-bordered">';
        if(result.health_item.subitem){
          str += '<tr><th>采集时间</th>';
          var subitems = result.health_item.subitem.split(",");
          for(var i=0;i<subitems.length;i++){
            str += '<th>'+subitems[i]+'</th>';
          }
          str += '</tr>';
          if(result.health_item_records){
            for(var j=0;j<result.health_item_records.length;j++){
              str += '<tr>';
              str += '<td>'+new Date(result.health_item_records[j].created_at).toLocaleString()+'</td>';
              var contents = result.health_item_records[j].content.split(",");
              for(var k=0;k<contents.length;k++){
                str += '<td>'+contents[k]+result.health_item.unit;
                if(contents[k]>result.health_item.normal_max){
                  str += '<i class="pull-right glyphicon glyphicon-arrow-up red">';
                }else if(contents[k]<result.health_item.normal_min){
                  str += '<i class="pull-right glyphicon glyphicon-arrow-down red">';
                }else{
                  str += '<i class="pull-right glyphicon glyphicon-thumbs-up green">';
                }
                str += '</td>';
              }
              str += '</tr>';
            }
          }
        }else{
          str += '<tr><th>采集时间</th>';
          str += '<th>'+result.health_item.name+'</th></tr>';
          if(result.health_item_records){
            for(var j=0;j<result.health_item_records.length;j++){
              str += '<tr>';
              str += '<td>'+new Date(result.health_item_records[j].created_at).toLocaleString()+'</td>';
              str += '<td>'+result.health_item_records[j].content+result.health_item.unit;
              if(result.health_item_records[j].content>result.health_item.normal_max){
                str += '<i class="pull-right glyphicon glyphicon-arrow-up red">';
              }else if(result.health_item_records[j].content<result.health_item.normal_min){
                str += '<i class="pull-right glyphicon glyphicon-arrow-down red">';
              }else{
                str += '<i class="pull-right glyphicon glyphicon-thumbs-up green">';
              }
              str += '</td></tr>';
            }
          }
        }
        str += '</table></div></div></div>';
        $("#item_records_info").html(str);
      }else{
        $("#item_records_info").html('');
        var str = '<div class="box col-md-12"><div class="box-inner"><div class="box-content">';
        str += '<h3 class="text-center">暂无数据</h3>';
        str += '</div></div></div>';
        $("#item_records_info").html(str);
      }
    },'json');
}