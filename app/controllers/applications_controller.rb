class ApplicationsController < ApplicationController

	def index
		@applicants = Applicant.all
	end

	def add_preview url
		modified_url = url.sub('view?usp=sharing', "preview")
		return modified_url
	end

	def applicant_params
		#params.require(:applicant).
		params[:resume] = add_preview (params[:resume])
		params[:transcript] = add_preview (params[:transcript])
		params[:schedule] = add_preview (params[:schedule])

        params.permit(
        :first_name,
        :last_name,
        :email,
        :phone_number,
        :uin,
        :graduation_date,
        :gpa,
				:major,
				:csce_classes,
	    	:comment,
        :resume,
        :transcript,
        :schedule
		)
	end

	def new
		@applicant = Applicant.new
	end

	def show
	end

	def create
		custom_params = applicant_params
		@applicant = Applicant.create!(custom_params)
		session[:success] = "Thank your four submission, #{@applicant.first_name}! Your application has successfully been created and submitted."
		redirect_to url_for(:controller => 'welcome', :action => 'view_app_status')
	end

	def update
	end

	def destroy
		@applicant = Applicant.find(params[:id])
		@applicant.destroy
		flash[:notice] = "Applicant '#{@applicant.first_name}' '#{@applicant.last_name}' deleted."

		redirect_to url_for(:controller => 'admins', :action => 'show_applications')
	end

	def change_status
		@applicant = Applicant.find params[:id]
		code = params[:code]
		case code
		when 'pending'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : PENDING."
			@applicant.update_attribute(:status,0)
		when 'approve'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : APPROVED."
			@applicant.update_attribute(:status,1)
		when 'deny'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : DENIED."
			@applicant.update_attribute(:status,2)
		when 'missing'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : INCOMPLETE."
			@applicant.update_attribute(:status,3)
		end
		redirect_to request.referrer
	end
end
