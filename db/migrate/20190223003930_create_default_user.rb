class CreateDefaultUser < ActiveRecord::Migration[5.2]
  def change
	@user = User.new(email: 'test@peerteach.edu', password: 'Abcd1234', password_confirmation: 'Abcd1234')
	@user.save
  end
end
