jQuery ->
#上传图片显示
  $('#wx_message_pic_url').change ->
    file = $('#wx_message_pic_url')[0].files[0]
    if (file)
      imageUrl = window.URL.createObjectURL(file)
      $('img').attr('src',imageUrl)
      $('img').parent().css('display','block')
    return

#  $('.ImagePick').imagepicker {show_label:true},{limit:10}, limit_reached: ->
#    alert '最多只能有10条消息'
#    return


