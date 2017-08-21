require "rails_helper"
require "active_model_serializers"
require "generators/rails/serializer_generator"

RSpec.describe Rails::ResponseGenerator, type: :generator do
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

    # [xxx] - 入れ子のgeneratorがテストできない
    # it(:serializer) { expect(file("app/serializers/tete/titi_serializer.rb")).to exist }
    it(:spec) { expect(file("spec/serializers/tete/titi_serializer_spec.rb")).to exist }
    it(:rspec_support) { expect(file("spec/support/active_model_serializers_helper.rb")).to exist }
  end
end
