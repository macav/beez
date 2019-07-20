require "zeebe/client"
require "beez/worker"
require "beez/version"

module Beez
  class Error < StandardError; end

  def self.register_worker(worker)
    self.workers << worker
  end

  def self.workers
    @workers ||= []
  end

  def self.client
    @client ||= ::Zeebe::Client::GatewayProtocol::Gateway::Stub.new('localhost:26500', :this_channel_is_insecure)
  end
end

require "examples/request_composition_worker"
require "examples/transition_to_incomplete_worker"
