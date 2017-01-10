$.extend $.fn.select2.defaults,
  formatNoMatches: () -> "没有找到匹配的项"
  formatInputTooShort: (input, min) -> "请再输入#{min - input.length}个字符"
  formatInputTooLong: (input, max) -> "请删除#{input.length - max}个字符"
  formatSelectionTooBig: (limit) -> "最多选择#{limit}项"
  formatLoadMore: (pageNumber) -> "正在加载..."
  formatSearching: () -> "正在查找..."

# 初始化所有 select2 控件
# select 会被渲染为 select2 控件，如果需要搜索功能，可以加上 data-searchable="1" 属性
$.fn.extend
  lazy_select2: (options) ->
    options = $.extend { page_size: 15 }, options
    @select2
      allowClear: true
      placeholder: options.placeholder || '请选择'
      width: 222
      multiple: options.multiple || false
      initSelection: (element, callback) ->
        id = element.val()
        if id != '' and id != null
          $.ajax
            url: options.init(id)
            dataType: 'json'
            success: (data) ->
              callback(data)
      ajax:
        url: options.url
        dataType: 'json'
        quietMillis: 100
        data: (term, page) ->
          options.params(term, page)
        results: (data, page) ->
          more = (page * options.page_size) < data.total
          return {} =
            results: data.results
            more: more

  init_components: () ->
#    @find('select:not(.select2)').select2 placeholder:{id:'',placeholder: "---请选择---"},{width: 'resolve'}
    $('.select2').select2({
      placeholder: '请选择',
      allowClear: true,
      language: 'zh-CN'
    })


