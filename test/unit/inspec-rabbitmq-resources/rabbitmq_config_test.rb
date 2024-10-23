require "helper"
require "inspec-rabbitmq-resources/resources/rabbitmq_config"

describe "RabbitmqConfig" do
  let(:conf_path) { File.join(Dir.pwd, "test/fixtures/rabbitmq.config") }
  let(:inspec_mock) { mock("inspec") }
  let(:mock_file) { mock("file") }

  before do
    # Mock file behavior
    mock_file.stubs(:file?).returns(true) # Stub the file? method to return true
    mock_file.stubs(:content).returns(File.read(conf_path)) # Stub the content method to return the content of the file
    inspec_mock.stubs(:file).with(conf_path).returns(mock_file) # Stub the inspec.file method to return the mock file object
    RabbitmqConfig.any_instance.stubs(:inspec).returns(inspec_mock) # Stub the inspec methods to return the inspec_mock
  end

  it "check rabbitmq config parsing" do
    resource = RabbitmqConfig.new(conf_path)
    _(resource.params("rabbit", "ssl_listeners")).must_equal [5671]
    _(resource.params("rabbit", "tcp_listeners")).must_equal({ "127.0.0.1" => 5672, "::1" => 5672 })
    _(resource.resource_id).must_equal conf_path
  end
end
