# copyright: 2024, Progress Chef
title "Validate RabbitMQ SSL Listener Configuration"

control "rabbitmq_config" do
  impact 1.0
  title "Ensure RabbitMQ SSL & TCP listeners are set correctly using rabbitmq_config"
  desc "This control checks if RabbitMQ is configured to listen on the correct SSL port (5671) and TCP port (5672) using the rabbitmq_config resource."

  config_file_path = File.expand_path("../../fixtures/rabbitmq.config", __dir__)

  describe rabbitmq_config(config_file_path).params("rabbit", "ssl_listeners") do
    it { should eq [5671] }
  end

  describe rabbitmq_config(config_file_path).params("rabbit", "tcp_listeners") do
    it { should eq({ "127.0.0.1" => 5672, "::1" => 5672 }) }
  end
end

control "rabbitmq_conf" do
  impact 1.0
  title "Ensure RabbitMQ SSL & TCP listeners are set correctly using rabbitmq_config"
  desc "This control checks if RabbitMQ is configured to listen on the correct SSL port (5671) and TCP port (5672) using the rabbitmq_conf resource."

  config_file_path = File.expand_path("../../fixtures/rabbitmq.config", __dir__)

  describe rabbitmq_conf(config_file_path).params("rabbit", "ssl_listeners") do
    it { should eq [5671] }
  end

  describe rabbitmq_conf(config_file_path).params("rabbit", "tcp_listeners") do
    it { should eq({ "127.0.0.1" => 5672, "::1" => 5672 }) }
  end
end
