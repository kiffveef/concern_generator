module ActiveModelSerializersHelper
  def serialize(obj, **options)
    serializer_class = options.delete(:serializer_class) || "#{obj.class.name}Serializer".constantize
    klass = serializer_class.new(obj)
    ActiveModelSerializers::Adapter.create(klass, options)
  end

  def attributes_as_json(factory)
    factory.attributes.map do |name, value|
      _value =
        case value
        when Time, Date, DateTime
          value.iso8601
        else
          value
        end
      [name, _value]
    end.to_h
  end
end

shared_examples_for "serialize attributes" do
  let(:not_coverd) do
    attrs = factory.attribute_names
    attrs.delete_if do |item|
      item =~ /^(#{include_attrs.join("|")})$/
    end
    attrs.map(&:to_sym)
  end

  subject { serialized.serializable_hash }

  it { is_expected.to include *include_attrs }
  it { is_expected.not_to include *not_coverd }
end

RSpec.configure do |config|
  config.include ActiveModelSerializersHelper, type: :serializer
end
