class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  CLIENT_ID = '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe'
  CLIENT_SECRET = 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
  HEADERS = {'Content-Type' => 'application/json'}
  URL = {
      :authentication => {
          :create => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/oauth/token',
              :method => 'post'
          },
          :revoke => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/oauth/revoke',
              :method => 'post'
          },
          :refresh => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/oauth/token',
              :method => 'post'
          }},
      :users => {
          :widgets => {
              :index_me => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets',
                  :method => 'get'
              },
              :index_me_term => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets',
                  :method => 'get'
              },
              :index_id => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/',
                  :method => 'get'
              },
              :index_id_term => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/',
                  :method => 'get'
              }
          },
          :create => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users',
              :method => 'post'
          },
          :update => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me',
              :method => 'put'
          },
          :show_me => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me',
              :method => 'get'
          },
          :show_id => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/',
              :method => 'get'
          },
          :change_pwd => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/password',
              :method => 'post'
          },
          :check_email => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/email',
              :method => 'get'
          },
          :reset_pwd => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/reset_password',
              :method => 'post'
          }
      },
      :widgets => {
          :visible => {
              :index => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible',
                  :method => 'get'
              },
              :index_term => {
                  :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible',
                  :method => 'get'
              },
          },
          :create => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets',
              :method => 'post'
          },
          :update => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/',
              :method => 'put'
          },
          :delete => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/',
              :method => 'delete'
          },
          :index => {
              :url => 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets',
              :method => 'get'
          }
      }
  }

  def self.rest_client (method, url, payload = nil, headers, &block)
    begin
      r = RestClient::Request.execute(:method => method, :url => url, :payload => payload, :headers => headers, &block)
    rescue RestClient::ExceptionWithResponse => e
      r = e.response
    end
    JSON.parse(r)
  end

  def self.auth_headers(authorization)
    HEADERS.merge({'Authorization' => authorization})
  end
end
