resource "aws_msk_configuration" "msk_gg_demo_conf" {
  kafka_versions = ["2.6.1"]
  name           = "msk-ggdemo-conf"

  server_properties = <<PROPERTIES
    auto.create.topics.enable=true
    default.replication.factor=2
    min.insync.replicas=2
    num.io.threads=8
    num.network.threads=5
    num.partitions=1
    num.replica.fetchers=2
    replica.lag.time.max.ms=30000
    socket.receive.buffer.bytes=102400
    socket.request.max.bytes=104857600
    socket.send.buffer.bytes=102400
    unclean.leader.election.enable=true
    zookeeper.session.timeout.ms=18000
  PROPERTIES
}

resource "aws_msk_cluster" "msk_gg_demo" {
  cluster_name           = "mskggdemo"
  kafka_version          = "2.6.1"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    ebs_volume_size = 20
    client_subnets = var.vpc_public_subnets
    security_groups = [var.security_group_id]
  }

  configuration_info {
    arn = aws_msk_configuration.msk_gg_demo_conf.arn
    revision = aws_msk_configuration.msk_gg_demo_conf.latest_revision
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "PLAINTEXT"
    }
  }

  tags = {
    foo = "bar"
  }
}