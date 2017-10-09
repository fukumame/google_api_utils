require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module GoogleApiUtils
  class Main
    def initialize(credentials_path, client_secrets_path, scope, oob_uri)
      @credentials_path = credentials_path
      @client_secrets_path = client_secrets_path
      @scope = scope
      @oob_uri = oob_uri
    end

    def get_authorizer
      FileUtils.mkdir_p(File.dirname(@credentials_path))
      client_id = Google::Auth::ClientId.from_file(@client_secrets_path)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: @credentials_path)
      authorizer = Google::Auth::UserAuthorizer.new(
          client_id, @scope, token_store)
      authorizer
    end

    def retrieve_code
      authorizer = get_authorizer
      url = authorizer.get_authorization_url(base_url: @oob_uri)
      puts "Open the following URL in the browser and enter the resulting code after authorization"
      puts url
    end

    def store_credentials(code)
      authorizer = get_authorizer
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        authorizer.get_and_store_credentials_from_code(user_id: user_id, code: code, base_url: @oob_uri)
      end
    end

    def get_credentials
      authorizer = get_authorizer
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      credentials
    end
  end
end

