module AuthUtilities

	RSA_PRIVATE = OpenSSL::PKey::RSA.generate 2048
	RSA_PUBLIC = RSA_PRIVATE.public_key


	#Grabs the user matching the email/password combo
	#Abstracted away for easier testing
	def authUserCreds email, password
		user = User.find_by(email: email)

		if user && user.authenticate(password) 
		  return user
		else
		  raise Exceptions::AuthenticationError
		end

	end


	#Generates a JWT for the given user
	def generateJWT user
		#Set expiration to be 6 hours
	    exp = Time.now.to_i + (3600 * 6)
	    payload = {email: user.email, exp: exp}
	    token = JWT.encode payload, RSA_PRIVATE, 'RS256'
	    return token
	end


	#Cracks open the JWT so we can consume it's flesh
	#Make sure you catch any errors from JWT.decode
	def decodeJWT token	
		decoded_token = JWT.decode token, RSA_PUBLIC, true, { algorithm: 'RS256' }
		return decoded_token[0]
	end


	#Checks the jwt from session
	#We need to put this on any controller that need authorization, any action calls this function first
	def authorize
		begin
			#We'll probably need to expand this out once we have roles defined
			token = decodeJWT session[:jwt]
		rescue JWT::ExpiredSignature
			flash[:alert] = 'Session expired'
			redirect_to login_path
		rescue
			flash[:alert] = 'Please login'
			redirect_to login_path
		end
	end

end