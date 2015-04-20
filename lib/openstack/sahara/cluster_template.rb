module OpenStack
  module Sahara
    class Cluster_Template

    attr_reader :id
    attr_reader :name
    attr_reader :hadoop_version
    attr_reader :neutron_management_network
    attr_reader :description
    attr_reader :node_groups

    def initialize(ct_info)
      @id  = ct_info['id']
      @name  = ct_info['name']
      @hadoop_version = ct_info['hadoop_version']
      @neutron_management_network = ct_info['neutron_management_network']
      @description = ct_info['description']
      @node_groups = ct_info['node_groups']
    end

    end
  end
end
