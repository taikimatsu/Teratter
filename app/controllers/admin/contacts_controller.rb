class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@contacts = Contact.all.order(id: 'DESC')
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def update
  	@contact = Contact.find(params[:id])
  	if @contact.update(reply_params)
  		user = @contact.user
  		flash[:notice] = "お問い合わせへの送信が完了しました。"
  		ContactMailer.send_when_admin_reply(user, @contact).deliver
  		redirect_to admin_contacts_path
  	else
  		render "show"
    end
  end


private

  def reply_params
  	params.require(:contact).permit(:reply)
  end
end
