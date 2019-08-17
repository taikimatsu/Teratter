class User::ContactsController < ApplicationController
  def new
  	@contact = Contact.new
    @user = current_user
  end

  def create
    @user = current_user
  	@contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
      if @contact.save
  	    flash[:notice] = "お問い合わせを承りました。回答につきましては、メールにてご連絡致します。"
  	    redirect_to user_user_path(@user)
      else
        render :new
      end
  end

private

  def contact_params
  	params.require(:contact).permit(:user_id, :contact)
  end
end
