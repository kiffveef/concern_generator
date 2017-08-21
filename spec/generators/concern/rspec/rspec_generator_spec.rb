require "rails_helper"

RSpec.describe Concern::RspecGenerator, type: :generator do
  destination File.expand_path("../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  after do
    prepare_destination
  end

  shared_examples_for "example file" do
    context "setting file" do
      subject do
        file("spec/support/include_module_example.rb")
      end

      it { is_expected.to exist }
    end
  end

  describe "include module" do
    before do
      run_generator %w(tete --model toto)
    end

    it_behaves_like "example file"

    context "with model" do
      subject do
        file("spec/models/toto_spec.rb")
      end

      it { is_expected.to contain /Included module/ }
    end
  end

  describe "include module" do
    before do
      run_generator %w(tete --controller v1/titi)
    end

    it_behaves_like "example file"

    context "with controller" do
      subject do
        file("spec/controllers/v1/titi_controller_spec.rb")
      end

      it { is_expected.to contain /Included module/ }
    end

  end
end
