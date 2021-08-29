// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require moment
//= require fullcalendar

// カレンダー表示
$(function () {
    $(document).on('turbolinks:load', function () {
        function eventCalendar() {
            return $('#calendar').fullCalendar({});
        };
        function clearCalendar() {
            $('#calendar').html('');
        };
        $(document).on('turbolinks:load', function () {
          eventCalendar();
        });
        $(document).on('turbolinks:before-cache', clearCalendar);
        //以下を追加
        $('#calendar').fullCalendar({
          events: '/trips.json'
        });
    });
});


// 地図表示
function previewFiles() {
    var preview_array = [];
    var file_array = [];
    var reader_array  = [];
    var file_length = document.querySelector('input[type=file]').files.length;
    for(var i=0; i<3; i++){
        document.querySelector('img[name="preview' + i + '"]').src = "";
    }
    for(var i=0; i<file_length; i++){
        preview_array.push(document.querySelector('img[name="preview' + i + '"]'));
        file_array.push(document.querySelector('input[type=file]').files[i]);
        reader_array.push(new FileReader());
    }
    if(file_length>0){
        console.log("0");
        reader_array[0].addEventListener("load", function () {
            preview_array[0].src = reader_array[0].result;
        }, false);
    }

    if(file_length>1){
        console.log("1");
        reader_array[1].addEventListener("load", function () {
            preview_array[1].src = reader_array[1].result;
        }, false);
    }

    if(file_length>2){
        console.log("2");
        reader_array[2].addEventListener("load", function () {
            preview_array[2].src = reader_array[2].result;
        }, false);
    }

    for(var i=0; i<file_length; i++){
        reader_array[i].readAsDataURL(file_array[i]);
    }
}

// モーダルウィンドウ
$(function(){
    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        return false;
    });
});