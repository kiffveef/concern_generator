shared_examples_for "included modules" do
  it do
    is_expected.to include *described_class.included_modules
  end
end
