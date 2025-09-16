+++
title = "About the Chef InSpec RabbitMQ resource pack"
draft = false
linkTitle = "RabbitMQ resource pack"
summary = "Chef InSpec resources for auditing RabbitMQ."

[cascade]
  [cascade.params]
    platform = "rabbitmq"

[menu.rabbitmq]
title = "About RabbitMQ resources"
identifier = "inspec/resources/rabbitmq/about"
parent = "inspec/resources/rabbitmq"
weight = 10
+++

The Chef InSpec RabbitMQ resources allow you to audit a RabbitMQ cluster.

## Support

The InSpec RabbitMQ resources were part of InSpec core through InSpec 6.
Starting in InSpec 7, they're released separately as a Ruby gem.

## Usage

To add this resource pack to an InSpec profile, add the `inspec-rabbitmq-resources` gem as a dependency in your `inspec.yml` file:

```yaml
depends:
  - name: inspec-rabbitmq-resources
    gem: inspec-rabbitmq-resources
```

## RabbitMQ resources

{{< inspec_resources_filter >}}

The following Chef InSpec RabbitMQ resources are available in this resource pack.

{{< inspec_resources section="rabbitmq" platform="rabbitmq" >}}
