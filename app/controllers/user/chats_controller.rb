class User::ChatsController < ApplicationController

	def show
	    @user = User.find(params[:id])

	     #ログインユーザーのuser_roomにあるroom_idの値
	    rooms = current_user.user_rooms.pluck(:room_id)

	    # user_idがチャット相手のidが一致するもの、room_idが上記roomsに一致するレコードを
	    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

	    #user_roomが空か確認
	    unless user_rooms.nil?
	      @room = user_rooms.room

	    #user_roomが空なら新しく作る
	    else
	      @room = Room.new
	      @room.save

	      #ログインユーザー分
	      UserRoom.create(user_id: current_user.id, room_id: @room.id)

	      #チャット相手分
	      UserRoom.create(user_id: @user.id, room_id: @room.id)
	    end
	    @chats = @room.chats
	    @chat = Chat.new(room_id: @room.id)
	end

	def create
	    @chat = current_user.chats.new(chat_params)
	    @chat.save
	    redirect_to request.referer
	end

	private
	def chat_params
	    params.require(:chat).permit(:message, :room_id)
	end
end
