class MessagesController < BodaController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    # byebug
    if @message.save
      redirect_to messages_path, notice: "Mensaje enviado con éxito"
    else
      render :index
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
      redirect_to messages_path, notice: 'Mensaje borrado.'
  end

private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
