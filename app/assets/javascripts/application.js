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
			//住所自動入力
			return $('#user_postcode').jpostal({
				postcode: ['#user_postcode'],
				address: {
	  				'#user_prefecture_code': '%3',
	  				'#user_address_city': '%4%5%6%7',
				},
			});
		});

		$(function(){
			//ハンバーガーメニュー（スマホ時）
			$('#humbureger-btn').on('click', function(){
	    		$('#humburger-menu-box').slideToggle();
	  		});
	  		$('#humbureger-close-btn').on('click', function(){
	  			$('#humburger-menu-box').slideUp();
	  		});
	  	});

		$(function(){
			//ランキング表示ボタン（スマホ時）
	  		$('#event-ranking-btn').on('click', function(){
	  			$('#active-event-ranking-text-box').slideToggle();
	  		});
	  		$('#event-ranking-close-btn').on('click', function(){
	  			$('#active-event-ranking-text-box').slideUp();
	  		});
	  	});

		//画像プレビュー機能
		$(function(){
	  		//イベント登録
	  		$('#event-image').on('change', function (e) {
				// ここから既存の画像のurlの取得
	    		var reader = new FileReader();
	    		reader.onload = function (e) {
	        		$(".event-img-prev").attr('src', e.target.result);
	    		};
			// ここまで
				//取得したurlにアップロード画像のurlを挿入
	        	reader.readAsDataURL(e.target.files[0]);
	        });
	    });

		$(function(){
	        //イベント編集
			$('#edit-event-image').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$(".edit-event-img-prev").attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
			});
		});

		$(function(){
			//マイページ編集・プロフィール画像
			$('#profile-image').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$(".profile-img-prev").attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
			});
		});

		$(function(){
			//マイページ編集・背景画像
		    $('#back').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$(".back-image").attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
		    });
		});

		$(function(){
			//投稿画像1枚目
		    $('#image1').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$('.img-prev1').attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
		        //1枚目プレビュー後2枚目フィールド表示 & 1枚目に削除と編集ボタン表示
		        $('.post-form-image-btn1').hide();
		        $('.post-form-image-btn2').show();
		        $('#image2').slideDown();
		        $('.img-prev2').slideDown();
		        $('#delete-image-btn1').show();
		        $('.edit-image-btn1').show();

		        //削除ボタンで画像削除 & フィールドの画像の情報を空に
		        $('#delete-image-btn1').on('click', function(){
		        	$('.img-prev1').remove();
		        	$('#image1').val("");
					$('#delete-image-btn1').hide();
					$('.edit-image-btn1').hide();
				});
			});
		});

		$(function(){
		    //投稿画像2枚目
			$('#image2').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$('.img-prev2').attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
		        //2枚目プレビュー後3枚目フィールド表示 & 2枚目に削除と編集ボタン表示
		        $('.post-form-image-btn2').hide();
		        $('.post-form-image-btn3').show();
		        $('#image3').slideDown();
		        $('.img-prev3').slideDown();
		        $('#delete-image-btn2').show();
		        $('.edit-image-btn2').show();

		        //削除ボタンで画像削除 & フィールドの画像の情報を空に
		        $('#delete-image-btn2').on('click', function(){
					$('.img-prev2').remove();
					$('#image2').val("");
					$('#delete-image-btn2').hide();
					$('.edit-image-btn2').hide();
				});
			});
		});

		$(function(){
			//投稿画像2枚目
			$('#image3').on('change', function (e) {
		    	var reader = new FileReader();
		    	reader.onload = function (e) {
		        	$('.img-prev3').attr('src', e.target.result);
		    	};
		        reader.readAsDataURL(e.target.files[0]);
		        //3枚目に削除と編集ボタン表示
		        $('.post-form-image-btn3').hide();
		        $('#delete-image-btn3').show();
		        $('.edit-image-btn3').show();

		        //削除ボタンで画像削除 & フィールドの画像の情報を空に
		        $('#delete-image-btn3').on('click', function(){
					$('.img-prev3').remove();
					$('#image3').val("");
					$('#delete-image-btn3').hide();
					$('.edit-image-btn3').hide();
				});
			});
		});

		$(function(){
			//投稿フォーム
			$('#post-btn').on('click', function(){
		  		$('#post-form-box').slideToggle();
		  	});
		  	$('#post-form-close-btn').on('click', function(){
		  		$('#post-form-box').slideUp();
		  	});
		});

		$(function(){
		  	//投稿に対するコメントフォーム
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
	 		//マイページアーティスト登録フォーム
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
	 		//イベント詳細ページマップ表示
	 		$('#map-btn').on('click', function(){
	 			$('#map-box').slideToggle();
	 		});
	 		$('#map-close-btn').on('click', function(){
	 			$('#map-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//イベント一覧カレンダー表示
	 		$('#calendar-btn').on('click', function(){
	 			$('.calendar-box').slideToggle();
	 		});
	 		$('#calendar-box-close-btn').on('click', function(){
	 			$('.calendar-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//投稿詳細ページいいねしたユーザー表示
	 		$('#favorite-user-btn').on('click', function(){
	 			$('#favorite-user-box').slideToggle();
	 		});
	 		$('#favorite-user-close-btn').on('click', function(){
	 			$('#favorite-user-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//投稿詳細ページコメントしたユーザー表示
	 		$('#comment-user-btn').on('click', function(){
	 			$('#comment-user-box').slideToggle();
	 		});
	 		$('#comment-user-close-btn').on('click', function(){
	 			$('#comment-user-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//投稿のコメントにコメントしたユーザー表示
	 		$('#comment-favorite-user-btn').on('click', function(){
	 			$('#comment-favorite-user-box').slideToggle();
	 		});
	 		$('#comment-favorite-user-close-btn').on('click', function(){
	 			$('#comment-favorite-user-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//profileテンプレートフォロワーユーザー表示
	 		$('.follower-user-btn').on('click', function(){
	 			$('#follower-user-box').slideToggle();
	 		});
	 		$('#follower-user-close-btn').on('click', function(){
	 			$('#follower-user-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//profileテンプレートフォロー中ユーザー表示
	 		$('.following-user-btn').on('click', function(){
	 			$('#following-user-box').slideToggle();
	 		});
	 		$('#following-user-close-btn').on('click', function(){
	 			$('#following-user-box').slideUp();
	 		});
	 	});

		$(function(){
	 		//投稿詳細ページタグ表示
	 		$('#tag-box-btn').on('click', function(){
		  		$('#tag-box').slideToggle();
		  	});
		  	$('#tag-box-close-btn').on('click', function(){
		  		$('#tag-box').slideUp();
		  	});
		});

		$(function(){
		  	//マイページお問い合わせフォーム表示
		  	$('.contact-btn').on('click', function(){
		  		$('#contact-form-box').slideToggle();
		  	});
		  	$('#contact-form-close-btn').on('click', function(){
		  		$('#contact-form-box').slideUp();
		  	});
		});

		$(function(){
		  	//カレンダー
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
	 		//投稿一覧の画像複数表示
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
		});

		$(function(){
		 	//投稿詳細画面の画像複数表示
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


		//検索ページ日本地図
		$(function(){
		 	//8地方でリンク作成
	    	var areaLinks = {
				1:"/user/index?sort=hokkaido",
				2:"/user/index?sort=tohoku",
				3:"/user/index?sort=kanto",
				4:"/user/index?sort=chubu",
				5:"/user/index?sort=kinki",
				6:"/user/index?sort=chugoku_shikoku",
				7:"/user/index?sort=kyusyu_okinawa",
		    };

		    //8地方エリア指定
	    	var areas = [
	            {code : 1, name: "北海道", color: "#ab86c4", hoverColor: "#dfcceb", prefectures: [1]},
	            {code : 2, name: "東北",   color: "#6d93d1", hoverColor: "#91b0e3", prefectures: [2,3,4,5,6,7]},
	            {code : 3, name: "関東",   color: "#f5a164", hoverColor: "#f5c09a", prefectures: [8,9,10,11,12,13,14]},
	            {code : 4, name: "中部",   color: "#77e077", hoverColor: "#adedad", prefectures: [15,16,17,18,19,20,21,22,23]},
	            {code : 5, name: "近畿",   color: "#ffe966", hoverColor: "#fff2a3", prefectures: [24,25,26,27,28,29,30]},
	            {code : 6, name: "中国・四国",   color: "#e68ccc", hoverColor: "#f0b9e0", prefectures: [31,32,33,34,35,36,37,38,39]},
	            {code : 7, name: "九州・沖縄",   color: "#de6474", hoverColor: "#f29da9", prefectures: [40,41,42,43,44,45,46,47]},
	    	];

	    	//地図表示設定
	        $("#map-container").japanMap({
	    		width: 600,
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

	        //スマホ時の地図表示
	    	$("#map-phone-container").japanMap({
	    		width: 370,
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



