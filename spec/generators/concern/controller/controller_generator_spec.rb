require "rails_helper"

RSpec.describe Concern::ControllerGenerator, type: :generator do
  destination File.expand_path("../../../../tmp", __FILE__)

  before { prepare_destination }

  after { prepare_destination }

  context "generate files" do
    before do
      run_generator %w(titi/tete)
    end

    it(:concern) { expect(file("app/controllers/concerns/titi/tete.rb")).to exist }
    it(:spec) { expect(file("spec/controllers/concerns/titi/tete_spec.rb")).to exist }
  end
end
