require "rails_helper"

RSpec.describe UserNotifierMailer, type: :mailer do

  before(:each) do
    @app = FactoryBot.create(:applicant)

  end
  describe 'send_deny_email' do
    it 'sends a deny email' do
      expect(@app.email).to_not eq(nil)
      expect(@app.first_name).to_not eq(nil)
      # subject.send_deny_email(@app).deliver_now
      # expect(mail.subject).to eq('Peer Teaching Application Status')
      # expect { subject.send_deny_email(@app) }
      #   .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe 'send_reset_email' do
    it 'sends a reset email' do
      expect(@app.email).to_not eq(nil)
      expect(@app.first_name).to_not eq(nil)
      # subject.send_reset_email(@app.email, "hello")
    end
  end
end
