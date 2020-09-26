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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jcanvas
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require bootstrap-sprockets
//= require bxslider
//= require_tree .
$(function() {
  $(document).on('turbolinks:load', function() {
	  $(function(){
	    // inputのidから情報の取得
	    $('#image').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $(".img-prev").attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
		});
	  });

	  $(function(){
  		$('.text').on('click', function(){
  			$('.event-text').slideToggle();
  		});
  	  });

  	  $(function(){
  	  	$('.post').on('click', function(){
  	  		$('.post-form').slideToggle();
  	  	});
  	  });

  	  $(function() {
	  	return $('#user_postcode').jpostal({
	    	postcode: ['#user_postcode'],
	    	address: {
	      		'#user_prefecture_code': '%3',
	      		'#user_address_city': '%4%5%6%7',
	    	},
  		});
	  });

	  $(function(){
	  	$('.profile-edit').on('click', function(){
	  		$('.profile-active').slideToggle();
	  	});
	  });

	  $(function(){
	  	$('#comment').on('click', function(){
	  		$('.comment-form').slideToggle();
	  	});
	  });

	  $(function(){
	    // inputのidから情報の取得
	    $('#back').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $(".back-image").attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
		});
	  });

	 $(function(){
	 	$('#calendar').fullCalendar({
                events: '/user/events.json',

                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                   left: 'prev,next today',
			       center: 'title',
			       right: 'month,agendaWeek,agendaDay'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#87cefa',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                }
            });
	 	});

	 $(function(){
		 $('.bxslider').bxSlider({
		    auto: false,            // 自動スライド
		    speed: 1000,            // スライドするスピード
		    infiniteLoop: false,    // スライドをループさせるかどうか
		    moveSlides: 2,          // 移動するスライド数
		    pause: 3000,            // 自動スライドの待ち時間
		    maxSlides: 2,           // 一度に表示させる最大数
		    slideWidth: 280,        // 各スライドの幅
			randomStart: false,     // 最初に表示するスライドをランダムに設定
		    autoHover: true,        // ホバー時に自動スライドを停止
		    responsive: true,       // レスポンシブ対応
		    hideControlOnEnd: true, //「前へ」と「次へ」のコントロール表示
		    pager: true,			//ページャーの表示・非表示
		    controls: true,        //コントロールの表示・非表示
		    touchEnabled: true,      //タッチデバイスに対応
		  });
	 });

   });
})

