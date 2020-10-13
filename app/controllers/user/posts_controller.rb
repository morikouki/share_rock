class User::PostsController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	#アクションの前にログインユーザーか確認
	before_action :ensure_correct_user, only: [:edit, :update, :destroy]

	def index
		@events = Event.all

		#パラメーターでタグidが来たらタグに関連する投稿取得
		if params[:tag_id]
			@tag = Tag.find(params[:tag_id])
			@posts = @tag.posts.page(params[:page]).per(6)

		#コメント数の多い投稿を上位10取得
		elsif params[:ranking] == "0"
			  @posts = Post.find(PostComment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))

		#いいね数の多い投稿を上位10取得
		elsif params[:ranking] == "1"
			@posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))

		#投稿を新しい順に並び替え
		elsif params[:date] == "0"
			@posts = Post.all.order(created_at: :desc)

		#投稿を古い順に並び替え
		elsif params[:date] == "1"
			@posts = Post.all.order(created_at: :asc)

		#フォロー中のユーザーの投稿取得
		elsif params[:following_post] == "0"
			@posts = Post.all
			@user = current_user.following_user
			@posts = @posts.where(user_id: @user.ids).order(created_at: :desc).page(params[:page]).per(6)
		end
	end

	def create
		event = Event.find(params[:event_id])

		#タグ半角スペースで複数保存可
		tag_list = params[:post][:name].split(nil)
		post = current_user.posts.new(post_params)
		post.event_id = event.id

		#画像が投稿されている時の処理
		if params[:post_images] != nil
			if post.save
				post.save_tag(tag_list)

				#post_imageモデルのimageカラムへ画像を複数配列で保存
				params[:post_images][:image].each do |image|
	            	post.post_images.create(image: image, post_id: post.id)
	        	end
				redirect_to user_event_path(event)
			else
				#タイトルとコメントがない時の処理
				event = Event.find(params[:event_id])
				flash[:error] = "投稿に失敗しました。必須項目を入力してください。"
				redirect_to user_event_path(event)
			end
		else
			#画像が投稿されてない時の処理
			flash[:error] = "画像を一枚以上投稿してください。"
			redirect_to user_event_path(event)
		end
	end

	def show
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@comment = PostComment.new
		@replay_comment = ReplayComment.new
		@tags = @post.tags
	end

	def edit
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
	end

	def update
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		if @post.update(post_params)
		   redirect_to user_user_path(current_user)
		else
			flash[:error] = "投稿の編集に失敗しました。編集し直してください。"
			redirect_to user_user_path(current_user)
		end
	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@post.event_id = @event.id

		#@postに結びついたpost_imageテーブルを全部削除
		@post.post_images.destroy_all
		@post.destroy
		redirect_to user_user_path(current_user)
	end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_text, post_images_attributes: [:id, :image])
	end

	#ログインユーザーか確認、ログインユーザーでなかったらイベントページへ
	def ensure_correct_user
	    @post = Post.find(params[:id])
	    if @post.user != current_user
	      redirect_to user_events_path
	    end
	end
end
