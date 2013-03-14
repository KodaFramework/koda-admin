require 'sinatra/base'
require_relative './helpers/view_helper'

module Koda
  class Admin < Sinatra::Base
    include ::ViewHelper

    before '/*' do
      env['koda_user'] = {isadmin: true, isallowed: true, alias: 'anonymous', name: 'Anonymous'} if settings.allow_anonymous and not env.has_key?('koda_user')
      halt 405, "You must either use an authorisation provider, or set :anonymous, true" if not env.has_key?('koda_user')
    end

    def current_user
      env['koda_user']
    end

    configure do
      set :views, File.join(__dir__, '/../views')
      set :view_format, :erb
      set :view_options, { :escape_html => true }
      set :public_folder, File.dirname(__FILE__) + '/../public'
      set :allow_anonymous, ENV.has_key?('allow_anonymous') ? !!ENV['allow_anonymous'] : true
    end

    get '/console' do
      show_system :console
    end

    get '/explorer' do
      show_system :explorer
    end

    get "/sign-in" do
      show_system :login
    end

    get "/sign-out" do
      #log_out
      redirect '/'
    end
  end
end