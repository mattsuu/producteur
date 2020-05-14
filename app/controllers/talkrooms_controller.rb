class TalkroomsController < ApplicationController
  def show
    @talkroom = Talkroom.find(params[:id]) 
    @message = Message.new 
    @messages = @talkroom.messages 
    if receiver_signed_in?
      if @talkroom.receiver.id == current_receiver.id
        @advisor = @talkroom.advisor
      else
        redirect_to root_path
      end
    elsif advisor_signed_in?
      if @talkroom.advisor.id == current_advisor.id
        @receiver = @talkroom.receiver
      else
        redirect_to root_path
      end

    else
      redirect_to root_path
    end

  end

  def create
    if receiver_signed_in?
      @talkroom = Talkroom.new(talkroom_advisor_params)
      @talkroom.receiver_id = current_receiver.id
    elsif advisor_signed_in?
      @talkroom = Talkroom.new(talkroom_receiver_params)
      @talkroom.advisor_id = current_advisor.id
    else
      redirect_to root_path
    end

    if @talkroom.save
      redirect_to :action => "show", :id => @talkroom.id
    else
      redirect_to root_path
    end
  end

  private
  def talkroom_advisor_params
    params.require(:talkroom).permit(:advisor_id)
  end

  def talkroom_receiver_params
    params.require(:talkroom).permit(:receiver_id)
  end

end
