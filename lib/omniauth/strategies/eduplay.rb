require 'oauth2'
require 'omniauth/strategies/oauth2'
require 'uri'

module OmniAuth
  module Strategies

    class Eduplay < OmniAuth::Strategies::OAuth2
      option :name, :eduplay
      option :scope, 'ws:write'
      option :response_type, 'code'

      option :client_options, {
        :authorize_url => "/portal/oauth/authorize",
        :token_url     => "/portal/oauth/token",
        :info_url      => "/services/user/oauth/userinfo",
      }

      option :authorize_options, [:state, :scope, :response_type, :client_id, :redirect_uri]

      uid { raw_info['email'] }

      info do
        {
          'name' => raw_info['username'],
          'email' => raw_info['email'],
        }
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end

          params[:scope] = 'ws:write'
          session['omniauth.state'] = params[:state] if params[:state]
        end
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      private

      def raw_info
        @raw_info ||= access_token.get(options[:client_options][:info_url], headers: {clientkey: options[:client_secret]}).parsed
      end

    end
  end
end
