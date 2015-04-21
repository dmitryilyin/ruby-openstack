module OpenStack
  module Sahara

    class Connection

      attr_accessor   :connection

      def initialize(connection)
        @connection = connection
        OpenStack::Authentication.init(@connection)
      end

      def authok?
        connection.authok
      end

      def node_group_template_url(node_group_template_id = nil)
        url = '/node-group-templates'
        url += "/#{node_group_template_id}" if node_group_template_id
        url
      end

      def list_node_group_templates
        response = connection.req('GET', node_group_template_url)
        volumes_hash = JSON.parse(response.body)['node_group_templates']
        volumes_hash.inject([]) { |res, current| res << OpenStack::Sahara::Node_Group_Template.new(current); res}
      end

      def get_node_group_template(node_group_template_id)
        response = connection.req('GET', node_group_template_url(node_group_template_id))
        volume_hash = JSON.parse(response.body)['node_group_template']
        return unless volume_hash
        OpenStack::Sahara::Node_Group_Template.new volume_hash
      end

      def create_node_group_template(options)
        # check input data
        data = JSON.generate(options)
        response = connection.csreq('POST',
                                     connection.service_host,
                                     "#{connection.service_path}#{node_group_template_url}",
                                     connection.service_port,
                                     connection.service_scheme,
                                     {
                                         'content-type' => 'application/json',
                                     },
                                     data
        )
        OpenStack::Exception.raise_exception(response) unless response.code.match(/^20.$/)
        node_group_template_info = JSON.parse(response.body)['node_group_template']
        OpenStack::Volume::Volume.new node_group_template_info
      end

      def delete_node_group_template(node_group_template_id)
        connection.req('DELETE', node_group_template_url(node_group_template_id))
        true
      end

    end

  end
end
