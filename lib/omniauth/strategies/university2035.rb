require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class University2035 < OmniAuth::Strategies::OAuth2
      option :name, 'university2035'
      option :sandbox, false
      option :client_options, {}

      option :production_client_options,
             site: 'https://api.2035.university/',
             token_url: 'https://api.2035.university/oauth2/access_token',
             authorize_url: 'https://api.2035.university/oauth2/authorize'
      option :sandbox_client_options,
             site: 'https://sso.u2035test.ru/',
             authorize_url: 'https://sso.u2035test.ru/oauth2/authorize',
             token_url: 'https://sso.u2035test.ru/oauth2/access_token'

      uid { raw_info['unti_id'] }

      info do
        {
          email: raw_info['email'],
          first_name: raw_info['firstname'],
          last_name: raw_info['lastname'],
          leader_id: raw_info['leader_id']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def setup_phase
        options.client_options.merge!(environment_urls)
        super
      end

      def environment_urls
        if options.sandbox
          options.sandbox_client_options
        else
          options.production_client_options
        end
      end

      def raw_info
        @raw_info ||= access_token.get('/users/me').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'university2035', 'University2035'