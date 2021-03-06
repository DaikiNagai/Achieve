class ContactsController < ApplicationController

  def new
    if params[:back] # あー、confirmからは params[:back]が存在するのかな。なら、cが邪魔だね
      @contacts = Contact.new(contacts_params)
    else
      @contacts = Contact.new
    end
  end

  def create
    @contacts = Contact.new(contacts_params)
    #Contact.create(contacts_params)
    if @contacts.save
      redirect_to root_path, success:"お問い合わせが完了しました！"
      NoticeMailer.sendmail_contact(@contacts).deliver
    else
      render'new'
    end
  end

  def confirm
    @contacts = Contact.new(contacts_params)
    render :new if @contacts.invalid?
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
