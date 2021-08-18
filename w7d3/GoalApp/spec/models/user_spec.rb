require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "Validates username" do
    it {should validate_presence_of(:username)}
  end

  describe "Validates password_digest" do
    it {should validate_presence_of(:password_digest)}
  end

  describe "Validates presence and length of password" do
    it {should validate_presence_of(:password).is_at_least(6)}
  end

  describe "Validates uniqueness of username" do
    subject(:Kent) {FactoryBot.create(:user)}
    it {should validate_uniqueness_of(:username)}
  end

  describe "#password=" do
    it 'does not save passwords to the DB' do
      FactoryBot.create(:user, username: 'Capy2')

      user = User.find_by(username: 'Capy2')
      expect(user.password).not_to eq('password', 'password123')
      expect(user.password_digest).not_to eq('password')
    end

    it 'encrypts our password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      FactoryBot.build(:user, password: 'abcdef')
    end
  end

  describe "#is_password?" do

    it 'decrypts our password with BCrypt' do
      FactoryBot.create(:user, username: 'Snigdha', password: 'password100')
      user = User.find_by(username: 'Snigdha')
      expect(BCrypt::Password).to receive(:new).with(user.password_digest)
    end
  
    it 'should return true if password is correct' do
      FactoryBot.create(:user, username: 'Snigdha', password: 'password100')
      expect(user.is_password?('password100')).to be(true)
    end

    it 'should return false if password is incorrect' do
      FactoryBot.create(:user, username: 'Snigdha', password: 'password100')
      expect(user.is_password?('password99')).to be(false)
    end
  end

  describe "Validates presence of session token" do
    it { should validate_presence_of(:session_token) }
  end

  describe "#reset_session_token!" do
    it 'should not return old session token' do
      FactoryBot.create(:user, username: 'KentSnig', password: 'password999')
      user = User.find_by(username: 'KentSnig')
      new_session_token = SecureRandom::urlsafe_base64
      expect(new_session_token).to not_eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it 'should return user if user is found and password is correct' do
      FactoryBot.create(:user, username: 'Kenty', password: 'password0000')
      user = User.find_by(username: 'Kenty')
      expect(User.find_by_credentials(user.username, user.password)).to eq(user)
    end

    it 'should return nil if user not found or password is incorrect' do
      user = User.find_by(username: 'Snigdy', password: 'pw9999999')
      expect(User.find_by_credentials(user.username, user.password)).to not_eq(user)
    end
  end

end
