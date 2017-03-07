# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  loading = () ->
    $('#loading').append('<img src="/assets/ajax-loader.gif" width="20" height="20">')
    return false


  removeLoading = () ->
    $('#loading').empty()

  $('#create_code').click ->
    if $('#wx_code_code_type').val() == ''
      noty({text:'请选择二维码类型',layout:'topRight',type:'warning'})
      return false

    if $('input:radio[name=scence]').is(':checked') == false
      noty({text:'请选择参数类型',layout:'topRight',type:'warning'})
      return false


    if $('#arg').val() == ''
      noty({text:'请填写参数',layout:'topRight',type:'warning'})
      return false

    code_type = $('#wx_code_code_type').val()
    expire_time = $('#wx_code_expire_time').val()
    scence = $('input:radio[name=scence]:checked').val()
    arg = $('#arg').val()
    $.ajax
      url: '/wx_codes/create_qrcode'
      data:
        code_type:code_type
        expire_time:expire_time
        scence:scence
        arg:arg
      type: 'post'
      beforeSend:loading()
      success: (data) ->
        removeLoading()
        if data.status == 1
          $('#wx_code_ticket').val(data.result.ticket)
          $('#wx_code_code_name').val(data.result.qr_code_name)
          $('#wx_code_code_url').val(data.result.qr_code_url)
          $('#wx_code_url').val(data.result.url)
          $('input:submit[name=commit]').prop('disabled',false)
          $('#loading').append(data.result.image_tag)
        else
          noty({text:'此二维码已存在，请在列表中查找',layout:'topRight',type:'warning'})






  $('#wx_code_code_type').change ->
    if $('#wx_code_code_type').val() == 'permanent'
      $('#wx_code_expire_time').prop('disabled',true)
      $('input:radio').prop('disabled',false)
      $('#scence_num').prop('checked',false)
    else if $('#wx_code_code_type').val() == 'temporary'
      $('#wx_code_expire_time').prop('disabled',false)
      $('input:radio').prop('disabled',true)
      $('#scence_num').prop('checked',true)


