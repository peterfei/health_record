// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require jquery.min
//= require bootstrap/bootstrap.min
//= require jquery.cookie
//= require chosen.jquery.min
//= require jquery.history
//= require charisma
//= require moment
//= require datepicker/bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require select2
//= require select2_locale_zh-CN
//= require select2/select2_ext

$(function () {
    //不带时间选择的datepicker
    $('.datepicker').datepicker.dates['zh-CN'] ={
        days: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        daysMin: ["日", "一", "二", "三", "四", "五", "六"],
        months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        today: "今天",
        clear: "清除"
    };
	$('.datepicker').datepicker({
		autoclose: true,
		clearBtn: true,
		language: 'zh-CN',
		todayBtn: "linked",
		todayHighlight: true,
        format: "yyyy-mm-dd"
	});
    //带时间选择的datetimepicker
    moment.locale('zh-CN',{
        months : ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort : ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
        weekdays : ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        weekdaysShort : ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        weekdaysMin : ["日", "一", "二", "三", "四", "五", "六"]
    });
    $('.datetimepicker').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:ss',
        toolbarPlacement: 'bottom',
        locale: moment.locale('zh-CN'),
        showClear: true,
        showTodayButton: true,
        tooltips:{
            today: '今天',
            clear: '清除',
            close: '关闭',
            prevMonth: '上一月',
            nextMonth: '下一月',
            selectTime: '选择时间'
        }
    });

	// 初始化页面中的 select
	$('body').init_components();
});