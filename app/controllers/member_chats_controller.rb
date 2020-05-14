class MemberChatsController < ApplicationController
  def new
    @member_chat = MemberChat.new 
  end

  def create
    if receiver_signed_in?
      @member_chat = MemberChat.new(member_chat_params)  
      @member_chat.receiver_id = current_receiver.id 
      # @member_chat.advisor_id = current_advisor.id 
      @member_chat.save
      redirect_to member_chats_path
    # elsif advisor_signed_in?
    #   @member_chat = MemberChat.new(member_chat_params)  
    #   @member_chat.advisor_id = current_advisor.id 
    #   @member_chat.save
    #   redirect_to member_chats_path
    end
  end

  def index
    @member_chats = MemberChat.all
    # if receiver_signed_in?
    #   @advisors = Advisor.all
    #   talkrooms = current_receiver.talkrooms
    #   @advisor_ids = []
    #   talkrooms.each do |r|
    #     @advisor_ids << r.advisor_id
    #   end

    # elsif advisor_signed_in?
    #   @receivers = Receiver.all
    #   talkrooms = current_advisor.talkrooms
    #   @receiver_ids = []
    #   talkrooms.each do |r|
    #     @receiver_ids << r.receiver_id
    #   end
    # end
  end

  def show
    @member_chat = MemberChat.find(params[:id])
    @receiver = @member_chat.receiver
    if receiver_signed_in?
      @advisors = Advisor.all
      talkrooms = current_receiver.talkrooms
      @advisor_ids = []
      talkrooms.each do |r|
        @advisor_ids << r.advisor_id
      end

    elsif advisor_signed_in?
      @receivers = Receiver.all
      talkrooms = current_advisor.talkrooms
      @receiver_ids = []
      talkrooms.each do |r|
        @receiver_ids << r.receiver_id
      end
    end
  end
    
  private
    def member_chat_params
      params.require(:member_chat).permit(:content, :image)
      # .merge(receiver_id: current_receiver.id, advisor_id: current_advisor.id)
    end

end

