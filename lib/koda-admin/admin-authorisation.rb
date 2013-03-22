require 'sinatra/base'

module Koda
  module Authorisation
    class Admin < Sinatra::Base
      def logged_in?
        env['koda_user'] != nil
      end

      before '/console' do
        if (logged_in?)
          if not is_allowed_in_console?
            redirect "/access-denied-console"
          end
        else
          session['return_url'] = '/console'
          redirect '/sign-in'
        end
      end

      before '/explorer' do
        if (logged_in?)
          if not is_allowed_in_explorer?
            redirect "/access-denied-explorer"
          end
        else
          session['return_url'] = '/explorer'
          redirect '/sign-in'
        end
      end

      get "/access-denied-console" do
        @title = "Access denied"
        @message = 'You need to be an administrator to access the console.'
        show_system :not_allowed
      end

      get "/access-denied-explorer" do
        @title = "Access denied"
        @message = 'If you have just registered, you will be able to gain access as soon as an administrator approves you.'
        show_system :not_allowed
      end

      post "/signed-in" do
        if @uap.authenticate(params[:token])
          redirect session['return_url']
        else
          redirect "/sign-in"
        end
      end
    end
  end
end