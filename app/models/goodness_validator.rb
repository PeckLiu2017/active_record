class GoodnessValidator < ActiveModel::Validator
  # def validate(record)
  #   if record.name == "Evil"
  #     record.errors[:base] << "This person is evil"
  #   end
  # end

  # def validate(record)
  #   if options[:fields].any?{|field| record.send(field) == "Evil" }
  #     record.errors[:base] << "This person is evil..."
  #   end
  # end

  def initialize(person)
    @person = person
  end

  def validate
    # if some_complex_condition_involving_ivars_and_private_methods?
    #   @person.errors[:base] << "This person is evil"
    # end
    if @person.first_name == "Evil"
       @person.errors[:base] << "This person is evil.."
    end
  end
end
