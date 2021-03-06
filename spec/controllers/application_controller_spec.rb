require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  # create test user
  let!(:user) { create(:user) }


  describe "#authorize_request" do
    context "when session has user_id" do

      before { session[:user_id] = user.id }
      before { session[:expiration_time] = Time.now + 100 }

      it "and not expired, sets the current user" do
        expect(subject.instance_eval { authorize_request }).to eq(user)
      end

      it "and expired" do
        session[:expiration_time] = Time.now - 10
        expect(subject.instance_eval { current_user }).to be_nil
      end
    end

    context "when session does not have user_id" do

      it "raises unauthorized error" do
        expect(subject.instance_eval { current_user }).to be_nil
      end
    end
  end
end
