class MemberChatsController < ApplicationController
  # before_action :to_root1, except: [:index] 
  # before_action :to_root2, except: [:index] 

  # 第3の案
  def new
    @member_chat = MemberChat.new # 新規投稿用の空のインスタンス
  end

  def create
    if receiver_signed_in?
      @member_chat = MemberChat.new(member_chat_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
      @member_chat.receiver_id = current_receiver.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
      # @member_chat.advisor_id = current_advisor.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
      @member_chat.save
      redirect_to member_chats_path
    # elsif advisor_signed_in?
    #   @member_chat = MemberChat.new(member_chat_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    #   @member_chat.advisor_id = current_advisor.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    #   @member_chat.save
    #   redirect_to member_chats_path
    end
  end

  def index
    @member_chats = MemberChat.all
  end

  def show
    @member_chat = MemberChat.find(params[:id])
    @receiver = @member_chat.receiver
  end
    
  private
    def member_chat_params
      params.require(:member_chat).permit(:content, :image)
      # .merge(receiver_id: current_receiver.id, advisor_id: current_advisor.id)
    end

    # def tweet_params
    #   params.require(:tweet).permit(:body) # tweetモデルのカラムのみを許可
    # end






  # 第二の案
  # def index
  #   if receiver_signed_in?
  #     @advisors = Advisor.all
  #   elsif advisor_signed_in?
  #     @receivers = Receiver.all
  #   end
  # end


  # 第一の案
#   def index
#     render "member_chats/top_chat"
#     @member_chats = MemberChat.all
#   end

#   # def new
#   #   @member_chats = MemberChat.new
#   # end

#   def create
#     @member_chats = MemberChat.new(member_chat_params)
#     if @member_chats.save
#       redirect_to member_chats_path, notice: 'メッセージが送信されました'
#     else
#       flash.now[:alert] = 'メッセージを入力してください。'
#       render :index
#     end
#   end

#   private

#   def member_chat_params
#     params.require(:member_chat).permit(:content, :image).merge(receiver_id: current_receiver.id, advisor_id: current_advisor.id)
#   end

#   def to_root1
#     redirect_to root_path unless receiver_signed_in?
#   end

#   def to_root2
#     redirect_to root_path unless advisor_signed_in?
#   end

end

