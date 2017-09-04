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
    @person.contact_details.build if @person.contact_details.empty?
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to people_path
    else
      render 'edit'
    end
  end

  def index
    @people = Person.first(10)
  end
  private
  def person_params
    params.require(:person).permit(:name, :email, :email_confirmation, :time_zone, :contact_details_attributes => [:id, :telephone, :eamil, :wechat, :_destroy])
  end
end
