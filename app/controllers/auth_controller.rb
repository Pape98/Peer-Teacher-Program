require 'AuthUtilities'

class AuthController < ApplicationController

	include AuthUtilities


	#We need to put this on any controller that need authorization, any action calls this function first
	before_action :authorize

end
