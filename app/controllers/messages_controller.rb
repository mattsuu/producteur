class MessagesController < ApplicationController
  def create
    @talkroom = Talkroom.find(params[:talkroom_id])
    @message = Message.new(message_params)
    if receiver_signed_in?
      @message.is_receiver = true
    elsif advisor_signed_in?
      @message.is_receiver = false
    end
    @message.talkroom_id = @talkroom.id
    if @message.save
      redirect_to talkroom_url(@talkroom)
    else
      redirect_to talkroom_url(@talkroom)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image)
  end

end
