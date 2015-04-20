module OpenStack
  module Sahara
    class Node_Group_Template

      attr_reader :id
      attr_reader :name
      attr_reader :description
      attr_reader :plugin_name
      attr_reader :flavor_id
      attr_reader :node_processes
      attr_reader :floating_ip_pool
      attr_reader :auto_security_group

      def initialize(ngt_info)
        @id = ngt_info['id']
        @name = ngt_info['name']
        @description = ngt_info['description']
        @plugin_name = ngt_info['plugin_name']
        @flavor_id = ngt_info['flavor_id']
        @node_processes  = ngt_info['node_processes']
        @floating_ip_pool = ngt_info['floating_ip_pool']
        @auto_security_group = ngt_info['auto_security_group']
      end

    end
  end
end
