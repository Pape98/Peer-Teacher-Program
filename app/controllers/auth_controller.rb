require 'jwt'
require 'bcrypt'

class AuthController < ApplicationController
	before_action :authorize

	include BCrypt

	# https://gist.github.com/iscott/4618dc0c85acb3daa5c26641d8be8d0d
	def index
		# @user = User.new(email: 'test@peerteach.edu', password: 'Abcd1234', password_confirmation: 'Abcd1234')
		# @user.save

		users = User.select('email, password_digest')
		puts users[0].email
		puts users[0].password_digest



		payload = { name: 'Kaleb'}

		rsa_private = OpenSSL::PKey::RSA.generate 2048
		rsa_public = rsa_private.public_key

		token = JWT.encode payload, rsa_private, 'RS256'

		puts token

		decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

		puts decoded_token

	end

	def authorize
		# puts Password.create('password_hash')
		if session[:key].nil?
			session[:key] = 'ok'
			render html: "<script>alert('pls login for me')</script>".html_safe
		end
		# redirect_to 'https://google.com'
	end

end
