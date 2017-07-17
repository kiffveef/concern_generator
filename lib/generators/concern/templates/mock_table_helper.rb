def create_mock_table(name, &block)
  raise "no block given." unless block_given?

  before(:all) do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.create_table(name, &block)
  end

  after(:all) do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.drop_table(name)
  end
end
