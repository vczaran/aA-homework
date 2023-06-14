require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }


  describe 'finds users by credentials' do
    context 'with a valid email and password' do
      it 'returns the proper user' do
        viktoria = User.create(email: 'viktoria@email.com', password: 'not_password')
        user = User.find_by_credentials('viktoria@email.com', 'not_password')

        expect(viktoria.email).to eq(user.email)
        expect(viktoria.password_digest).to eq(viktoria.password_digest)
      end
    end

    context 'with an invalid email and password' do
      it 'returns nil' do
        dummy = User.create(email: 'dumdum', password: '123')
        user = User.find_by_credentials('dumdum', '123')
        expect(user).to be_nil
      end
    end

    describe '#reset_session_token'
    it 'resets a session token on a user' do
    old_session_token = user.session_token
    new_session_token = user.reset_session_token!
    expect(old_session_token).not_to eq(new_session_token)
  end
end

end
