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
        if(!result.health_item.normal_max){
          result.health_item.normal_max = '';
        }
        if(!result.health_item.normal_min){
          result.health_item.normal_min = '';
        }
        var str = '<div class="box col-md-12"><div class="box-inner"><div class="box-content"><table class="table table-bordered">';
        if(result.health_item_subs && result.health_item_subs.length>0){
          str += '<tr><th>采集时间</th>';
          for(var i=0;i<result.health_item_subs.length;i++){
            if(!result.health_item_subs[i].sub_max){
              result.health_item_subs[i].sub_max = '';
            }
            if(!result.health_item_subs[i].sub_min){
              result.health_item_subs[i].sub_min = '';
            }
            str += '<th>';
            str += result.health_item_subs[i].name;
            if(result.health_item_subs[i].sub_max && result.health_item_subs[i].sub_min){
              str += '(正常范围:'+result.health_item_subs[i].sub_min+'~'+result.health_item_subs[i].sub_max+')';
            }else{
              str += '(正常范围:'+result.health_item.normal_min+'~'+result.health_item.normal_max+')';
            }
            if(result.health_item_subs[i].sub_unit){
              str += '(单位:'+result.health_item_subs[i].sub_unit+')';
            }else{
              str += '(单位:'+result.health_item.unit+')';
            }
            str += '</th>';
          }
          str += '</tr>';
          if(result.health_item_records && result.health_item_records.length>0){
            for(var j=0;j<result.health_item_records.length;j++){
              str += '<tr>';
              str += '<td>'+new Date(result.health_item_records[j].created_at).toLocaleString()+'</td>';
              var contents = result.health_item_records[j].content.split(",");
              for(var k=0;k<contents.length;k++){
                str += '<td>'+contents[k];
                if(result.health_item_subs[k].sub_max && result.health_item_subs[k].sub_min){
                  if(contents[k]>result.health_item_subs[k].sub_max){
                    str += '<i class="pull-right glyphicon glyphicon-arrow-up red">';
                  }else if(contents[k]<result.health_item_subs[k].sub_min){
                    str += '<i class="pull-right glyphicon glyphicon-arrow-down red">';
                  }else{
                    str += '<i class="pull-right glyphicon glyphicon-thumbs-up green">';
                  }
                }
                str += '</td>';
              }
              str += '</tr>';
            }
          }else{
            var colspan = result.health_item_subs.length+2;
            str += '<tr>';
            str += '<td colspan="'+colspan+'" class="text-center"><h4>暂无数据</h4></td>';
            str += '</tr>';
          }
        }else{
          str += '<tr><th>采集时间</th>';
          str += '<th>';
          str += result.health_item.name;
          if(result.health_item.normal_min && result.health_item.normal_max){
            str += '(正常范围:'+result.health_item.normal_min+'~'+result.health_item.normal_max+')';
          }
          if(result.health_item.unit){
            str += '(单位:'+result.health_item.unit+')';
          }
          str += '</th></tr>';
          if(result.health_item_records && result.health_item_records.length>0){
            for(var j=0;j<result.health_item_records.length;j++){
              str += '<tr>';
              str += '<td>'+new Date(result.health_item_records[j].created_at).toLocaleString()+'</td>';
              str += '<td>'+result.health_item_records[j].content;
              if(result.health_item.normal_max && result.health_item.normal_min){
                if(result.health_item_records[j].content>result.health_item.normal_max){
                  str += '<i class="pull-right glyphicon glyphicon-arrow-up red">';
                }else if(result.health_item_records[j].content<result.health_item.normal_min){
                  str += '<i class="pull-right glyphicon glyphicon-arrow-down red">';
                }else{
                  str += '<i class="pull-right glyphicon glyphicon-thumbs-up green">';
                }
              }
              str += '</td></tr>';
            }
          }else{
            str += '<tr><td colspan="3" class="text-center"><h4>暂无数据</h4></td></tr>';
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