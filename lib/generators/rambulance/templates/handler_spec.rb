require "rails_helper"

RSpec.describe ExceptionsApp do
  subject do
    described_class.new
  end

  context "Defined method that corresponding to HTTP Status" do
    %i[
      not_found
      conflict
      unprocessable_entity
      method_not_allowed
      not_implemented
      bad_request
      internal_server_error
      unauthorized
    ].each do |name|
      it(name) { is_expected.to respond_to name }
    end
  end

  context "Make message" do
    %i[
      not_found
      conflict
      unprocessable_entity
      method_not_allowed
      not_implemented
      bad_request
      internal_server_error
      unauthorized
    ].each do |name|
      it(name) do
        expect(subject.send(:message, name)).to include error: name.to_s.humanize
      end
    end
  end
end
