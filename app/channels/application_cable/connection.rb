module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #This is what is going to provide a lot of the information to our channel and its required especially for being able to supply a current user.
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id # make a speical and unique id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end
    def connect 
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id 
    end
    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
