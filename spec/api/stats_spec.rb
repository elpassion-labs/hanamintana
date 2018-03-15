require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/show'

RSpec.describe Web::Controllers::Users::Show do
  let(:action)     { Web::Controllers::Users::Show.new(repository: repository) }
  let(:user)       { User.new(id: 23, name: 'Luca') }
  let(:repository) { double('repository', find: user) }

  it "is successful" do
    response = action.call(id: user.id)

    expect(response[0]).to      eq 200
    expect(action.user).to      eq user
    expect(action.exposures).to eq({user: user})
  end
end
