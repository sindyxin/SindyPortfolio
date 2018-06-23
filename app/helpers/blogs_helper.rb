module BlogsHelper
  def gravatar_helper user
    # image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
    # include MD5 gem, should be part of standard ruby install
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_tag "https://www.gravatar.com/avatar/#{hash}", width: 60
  end
end
