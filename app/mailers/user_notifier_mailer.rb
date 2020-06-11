# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid


class UserNotifierMailer < ApplicationMailer
    default :from => 'noreply@tamu.edu'

    # send a signup email to the applicant, pass in the applicant object that   contains the applicant's email address
    def send_deny_email(applicant)
        @applicant = applicant
        mail( :to => @applicant.email,
        :subject => 'Peer Teaching Application Status' )
    end

    def send_acceptance_email(applicant)
        @applicant = applicant
        mail( :to => @applicant.email,
        :subject => 'Peer Teaching Application Status' )
    end

    def send_incomplete_email(applicant)
        @applicant = applicant
        mail( :to => @applicant.email,
        :subject => 'Peer Teaching Application Status' )
    end

    def send_reset_email(email, newPassword)
        @newPassword = newPassword
        mail( :to => email,
        :subject => 'Peer Teaching Password Reset' )
    end

    # another way to use the SendGrid API
    # def send_acceptance_email(applicant)
    #     from = Email.new(email: 'npham150@gmail.com')
    #     to = Email.new(email: "p.pham124@gmail.com")
    #     subject = 'Accepted!'
    #     content = Content.new(type: 'text/plain', value: 'Hi!')
    #     mail = SendGrid::Mail.new(from, subject, to, content)

    #     sg = SendGrid::API.new(api_key: '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')
    #     response = sg.client.mail._('send').post(request_body: mail.to_json)
    #     puts response.status_code
    #     puts response.body
    #     puts response.headers
    # end

    # def send_deny_email(applicant)
    #     from = Email.new(email: 'npham150@gmail.com')
    #     to = Email.new(email: "p.pham124@gmail.com")
    #     subject = 'Denied'
    #     content = Content.new(type: 'text/plain', value: 'Hi')
    #     mail = SendGrid::Mail.new(from, subject, to, content)

    #     sg = SendGrid::API.new(api_key: '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')
    #     response = sg.client.mail._('send').post(request_body: mail.to_json)
    #     puts response.status_code
    #     puts response.body
    #     puts response.headers
    # end
end
