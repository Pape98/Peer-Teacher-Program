class ApplicationsController < ApplicationController

	def add_preview url
		modified_url = url.sub('view?usp=sharing', "preview")
		return modified_url
	end

	def applicant_params
		puts params
		#params.require(:applicant).
		params[:resume] = add_preview (params[:resume])
		params[:transcript] = add_preview (params[:transcript])
		params[:schedule] = add_preview (params[:schedule])
		params[:picture] = add_preview (params[:picture])
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
        :schedule,
				:picture
		)
	end

	def new
		@applicant = Applicant.new
	end

	def show
	end

	def create
		# put the applicant data in the Applicant table
		@applicant = Applicant.create!(applicant_params)
		puts applicant_params

		# put the applicant's preferred classes in the DesiredClass table
		for c in params[:csce_class]
			DesiredClass.create!(applicants_id: @applicant.id, csce_class: c)
		end

		session[:success] = "Thank you for your submission, #{@applicant.first_name}! Your application has successfully been created and submitted."
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
			UserNotifierMailer.send_acceptance_email(@applicant).deliver
		when 'deny'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : DENIED."
			@applicant.update_attribute(:status,2)
			UserNotifierMailer.send_deny_email(@applicant).deliver
		when 'missing'
			session[:status_change] = "#{@applicant.first_name}'s application status has successfully been set to : INCOMPLETE."
			@applicant.update_attribute(:status,3)
			UserNotifierMailer.send_incomplete_email(@applicant).deliver
		end
		redirect_to request.referrer
	end

	def comment
		applicant = Applicant.find(params[:id])
		comment = params[:comment]
		applicant.update_attribute(:admin_comment,comment)
		session[:redirected_by] = 'comment'
		redirect_to request.referrer
	end
end
