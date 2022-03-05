class ApplicationController < ActionController::Base
    
    skip_before_action :verify_authenticity_token

    include Knock::Authenticable


    # before_action :authenticate_user
    
    def current
        render json: current_user
    end
    
#     before_action :fetch_user
#     # end

#     def fetch_user

#         if session[:user_id].present?
#             @current_user = User.find_by id: session[:user_id]

#         end #session check

#         session[:user_id] = nil unless @current_user.present?

#     end # fetch_user()

#     def check_if_logged_in_and_admin

#         unless @current_user.present? && @current_user.is_admin!
#             flash[:error] = 'You must be logged in to perform that action'
#             redirect_to login_path
#         end

#     end

end
