module UsersHelper

  #return the Gravatar for the given user
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest('pbs52@hanmail.net')
    size = options[:size]
    gravatar_url = "https://gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt:user.name, class: "gravatar")

  end	
end
