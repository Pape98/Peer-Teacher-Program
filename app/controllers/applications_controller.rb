class ApplicationsController < ApplicationController

	def index
		@applicants = Applicant.all
	end

	def applicant_params
		#require(:applicant)
		params.permit(
			:first_name,
			:last_name,
			:email,
			:uin,
			:phone_number,
			:graduation_date,
			:gpa,
			# :major,
			# :csce_class,
	    # :comment
		)

		# #School Information
		# t.string  :major
		# t.string  :csce_class
		# #Addtional Information
		# t.text    :comment
	end

	def new
		@applicants = ""
	end

	def show
		#@applicants = Applicant.all
	end

	def create
		@applicant = Applicant.new(applicant_params)
		@applicant.save
		#flash[:notice] = "#{@applicant.first_name}, your was successfully created."
		#redirect_to url_for(:controller => 'welcome', :action => 'index')

		redirect_to url_for(:controller => 'applications', :action => 'index')
	end

	def update
	end

	def destroy
		@applicant = Applicant.find(params[:id])
		@applicant.destroy
		flash[:notice] = "Applicant '#{@applicant.first_name}' '#{@applicant.last_name}' deleted."
		redirect_to applications_path
	end

end
