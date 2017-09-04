class PeopleController < ApplicationController

  def new
    @person = Person.new
    @person.contact_details.build
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
    @person.contact_details.build
  end

  private
  def person_params
    params.require(:person).permit(:name, :email, :email_confirmation, :contact_details_attributes => [:id, :telephone, :eamil, :wechat, :_destroy])
  end
end
