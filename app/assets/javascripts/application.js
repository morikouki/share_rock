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
	  	$('#image').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $(".img-prev").attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入

		});
	    // inputのidから情報の取得
	    $('#image1').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $('.img-prev1').attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
	        $('.post-form-image-btn1').hide();
	        $('.post-form-image-btn2').show();
	        $('#image2').slideDown();
	        $('.img-prev2').slideDown();
	        $('#delete-image-btn1').show();

	        $('#delete-image-btn1').on('click', function(e){
				$('.img-prev1').remove();
				$('#delete-image-btn1').hide();
			});
		});


		$('#image2').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $('.img-prev2').attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
	        $('.post-form-image-btn2').hide();
	        $('.post-form-image-btn3').show();
	        $('#image3').slideDown();
	        $('.img-prev3').slideDown();
	        $('#delete-image-btn2').show();

	        $('#delete-image-btn2').on('click', function(e){
				$('.img-prev2').remove();
				$('#delete-image-btn2').hide();
			});
		});

		$('#image3').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $('.img-prev3').attr('src', e.target.result);
	    };
		// ここまで
	        reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
	        $('.post-form-image-btn3').hide();
	        $('#delete-image-btn3').show();


	        $('#delete-image-btn3').on('click', function(e){
				$('.img-prev3').remove();
				$('#delete-image-btn3').hide();
			});
		});
	  });

	  $(function(){
  		$('.text').on('click', function(){
  			$('.event-text').slideToggle();
  		});
  	  });

  	  $(function(){
  	  	$('#post-btn').on('click', function(){
  	  		$('#post-form-box').slideToggle();
  	  	});
  	  	$('#post-form-close-btn').on('click', function(){
  	  		$('#post-form-box').slideUp();
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
	  		$('#comment-form-box').slideToggle();
	  	});
	  	$('.form-comment').submit(function(){
	  		$('#comment-form-box').fadeOut();
	  	});
	 	$('#comment-form-close-btn').on('click', function(){
	 		$('#comment-form-box').fadeOut();
	 	});
	  });

	  $(function(){
	  	$('#comment-edit-btn').on('click', function(){
	  		$('#edit-comment-form-box').slideToggle();
	  	});
	  	$('.edit-form-comment').submit(function(){
	  		$('#edit-comment-form-box').fadeOut();
	  	});
	 	$('#edit-comment-form-close-btn').on('click', function(){
	 		$('#edit-comment-form-box').fadeOut();
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
                    day: '日'
                },
                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#8db1c7',
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
		    maxSlides: 1,           // 一度に表示させる最大数
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

	 $(function(){
	 	$('#artist-btn').on('click', function(){
	 		$('#artist-box').slideToggle();
	 	});
	 	$('#artist-box-close-btn').on('click', function(){
	 		$('#artist-box').slideUp();
	 	});
	 	$('.form-artist').submit(function(){
	 		$('#artist-box').slideUp();
	 	});
	 });

	 $(function(){
	 	$('#map-btn').on('click', function(){
	 		$('#map-box').slideToggle();
	 	});
	 	$('#map-close-btn').on('click', function(){
	 		$('#map-box').slideUp();
	 	});
	 });

	 $(function(){
	 	$('#calendar-btn').on('click', function(){
	 		$('.calendar-box').slideToggle();
	 	});
	 	$('#calendar-box-close-btn').on('click', function(){
	 		$('.calendar-box').slideUp();
	 	});
	 });

	 

   });
})



