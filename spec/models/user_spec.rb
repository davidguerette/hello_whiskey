require 'spec_helper'

# RSpec.describe User, :type => :model do

# describe User do

#   user = FactoryGirl.create(:user)

#   it { should have_valid(:first_name).when('Bob', 'Jane') }
#   it { should_not have_valid(:first_name).when('nil', '') }

#   it { should have_valid(:last_name).when('Smith', 'Doe') }
#   it { should_not have_valid(:last_name).when('nil', '') }

#   it { should have_valid(:email).when('user@example.com') }
#   it { should_not have_valid(:email).when(nil, '', 'userr@com', '12asd') }

#   it 'has a matching password confirmation' do
#     # user = FactoryGirl.create(:user, password_confirmation: 'anotherpassword')

#     user = User.new
#     expect(user).to_not be_valid
#     expect(user.errors[:password_confirmation]).to_not be_blank
#   end
# end
