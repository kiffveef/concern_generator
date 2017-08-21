require "rails_helper"
require "rambulance"

RSpec.describe Rambulance::SetupGenerator, type: :generator do
  destination File.expand_path("../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  after do
    prepare_destination
  end

  context "generate files" do
    before do
      run_generator
    end

    it(:initializer) { expect(file("config/initializers/rambulance.rb")).to exist }
    it(:handler) { expect(file("app/handlers/exceptions_app.rb")).to exist }
    it(:handler_spec) { expect(file("spec/handlers/exceptions_app_spec.rb")).to exist }
  end
end
