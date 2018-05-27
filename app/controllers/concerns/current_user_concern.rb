module CurrentUserConcern
  extend ActiveSupport::Concern
  def current_user
    super || guest_user

  end
  def guest_user    
    OpenStruct.new(name: 'Guest',  first_name: 'Guest', last_name: 'Guest',email: 'guest@gmail.com')
    
  end
  #OpenStruct.new(name: 'Guest',  first_name: 'Guest', last_name: 'Guest',email: 'guest@gmail.com')
  #here is how to implement the null object pattern
end