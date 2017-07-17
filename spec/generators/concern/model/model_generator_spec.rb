require "rails_helper"

RSpec.describe Concern::ModelGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before do
    prepare_destination
  end

  after do
    prepare_destination
  end

  context "generate files" do
    before do
      run_generator %w(tete/titi)
    end

    it(:concern) { expect(file("app/models/concerns/tete/titi.rb")).to exist }
    it(:spec) { expect(file("spec/models/concerns/tete/titi_spec.rb")).to exist }
    it(:rspec_support) { expect(file("spec/support/mock_table_helper.rb")).to exist }
  end
end
