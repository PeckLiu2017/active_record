xml.instruct!

xml.users do
  @users.each do |user|
    xml.user do
      xml.username user.username
      xml.password user.password
    end
  end
end
