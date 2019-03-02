class ApplicationsController < ApplicationController

	def index
		@applicants = Applicant.all
	end

	def applicant_params
		#params.require(:applicant).
        params.permit(
            :first_name,
        :last_name,
        :email,
        :phone_number,
        :uin,
        :graduation_date,
        :gpa,
			# :major,
			# :csce_class,
	    # :comment
      # :resume,
      # :transcript,
      # :schedule
		)

		# #School Information
		# t.string  :major
		# t.string  :csce_class
		# #Addtional Information
		# t.text    :comment
	end

	def new
		@applicant = Applicant.new
	end

	def show

	end

	def create
		@applicant = Applicant.create!(applicant_params)

		session[:success] = "#{@applicant.first_name}, your application was successfully created and submitted."
		redirect_to url_for(:controller => 'welcome', :action => 'view_status')
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
