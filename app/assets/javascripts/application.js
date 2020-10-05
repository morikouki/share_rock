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

		$('#profile-image').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $(".profile-img-prev").attr('src', e.target.result);
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
	        $('.edit-image-btn1').show();

	        $('#delete-image-btn1').on('click', function(){
	        	$('.img-prev1').remove();
	        	$('#image1').val("");
				$('#delete-image-btn1').hide();
				$('.edit-image-btn1').hide();
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
	        $('.edit-image-btn2').show();

	        $('#delete-image-btn2').on('click', function(){
				$('.img-prev2').remove();
				$('#image2').val("");
				$('#delete-image-btn2').hide();
				$('.edit-image-btn2').hide();
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
	        $('.edit-image-btn3').show();


	        $('#delete-image-btn3').on('click', function(){
				$('.img-prev3').remove();
				$('#image3').val("");
				$('#delete-image-btn3').hide();
				$('.edit-image-btn3').hide();
			});
		});

		$('#image0').on('change', function (e) {
		// ここから既存の画像のurlの取得
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $('.img-prev0').attr('src', e.target.result);
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
			randomStart: false,     // 最初に表示するスライドをランダムに設定
		    autoHover: true,        // ホバー時に自動スライドを停止
		    responsive: true,       // レスポンシブ対応
		    slideWidth: 280,		//スライドの幅
		    hideControlOnEnd: true, //「前へ」と「次へ」のコントロール表示
		    pager: true,			//ページャーの表示・非表示
		    controls: true,        //コントロールの表示・非表示
		    touchEnabled: true,      //タッチデバイスに対応
		  });

		 $('.show-post-bxslider').bxSlider({
		    auto: false,            // 自動スライド
		    speed: 1000,            // スライドするスピード
		    infiniteLoop: false,    // スライドをループさせるかどうか
		    moveSlides: 2,          // 移動するスライド数
		    pause: 3000,            // 自動スライドの待ち時間
		    maxSlides: 1,           // 一度に表示させる最大数
			randomStart: false,     // 最初に表示するスライドをランダムに設定
		    autoHover: true,        // ホバー時に自動スライドを停止
		    slideWidth: 500,		//スライドの幅
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

	 $(function(){
	 	$('#favorite-user-btn').on('click', function(){
	 		$('#favorite-user-box').slideToggle();
	 	});
	 	$('#favorite-user-close-btn').on('click', function(){
	 		$('#favorite-user-box').slideUp();
	 	});
	 });

	 $(function(){
	 	$('#comment-user-btn').on('click', function(){
	 		$('#comment-user-box').slideToggle();
	 	});
	 	$('#comment-user-close-btn').on('click', function(){
	 		$('#comment-user-box').slideUp();
	 	});
	 });

	 $(function(){
	 	$('#comment-favorite-user-btn').on('click', function(){
	 		$('#comment-favorite-user-box').slideToggle();
	 	});
	 	$('#comment-favorite-user-close-btn').on('click', function(){
	 		$('#comment-favorite-user-box').slideUp();
	 	});
	 });

	 $(function(){
	 	$('.follower-user-btn').on('click', function(){
	 		$('#follower-user-box').slideToggle();
	 	});
	 	$('#follower-user-close-btn').on('click', function(){
	 		$('#follower-user-box').slideUp();
	 	});
	 	$('.following-user-btn').on('click', function(){
	 		$('#following-user-box').slideToggle();
	 	});
	 	$('#following-user-close-btn').on('click', function(){
	 		$('#following-user-box').slideUp();
	 	});
	 });

	 $(function(){

	    var areaLinks = {
		 1:"/user/hokkaido",
		 2:"/user/tohoku",
		 3:"/user/kanto",
		 4:"/user/chubu",
		 5:"/user/kinki",
		 6:"/user/chugoku_shikoku",
		 7:"/user/kyusyu_okinawa",
	    };
        var areas = [
            {code : 1, name: "北海道", color: "#ab86c4", hoverColor: "#dfcceb", prefectures: [1]},
            {code : 2, name: "東北",   color: "#6d93d1", hoverColor: "#91b0e3", prefectures: [2,3,4,5,6,7]},
            {code : 3, name: "関東",   color: "#f5a164", hoverColor: "#f5c09a", prefectures: [8,9,10,11,12,13,14]},
            {code : 4, name: "中部",   color: "#77e077", hoverColor: "#adedad", prefectures: [15,16,17,18,19,20,21,22,23]},
            {code : 5, name: "近畿",   color: "#ffe966", hoverColor: "#fff2a3", prefectures: [24,25,26,27,28,29,30]},
            {code : 6, name: "中国・四国",   color: "#e68ccc", hoverColor: "#f0b9e0", prefectures: [31,32,33,34,35,36,37,38,39]},
            {code : 7, name: "九州・沖縄",   color: "#de6474", hoverColor: "#f29da9", prefectures: [40,41,42,43,44,45,46,47]},
        ];
        $("#map-container").japanMap({
    		width:600,
            areas  : areas,
            selection : "area",
            borderLineWidth: 0.25,
            drawsBoxLine : false,
            movesIslands : true,
            showsAreaName : true,
            font : "MS Mincho",
            fontSize : 13,
            fontColor :"#777",
            fontShadowColor : "white",
            onSelect : function(data){
	          location.href = areaLinks[data.area.code];
            }
        });
     });

   });
})



