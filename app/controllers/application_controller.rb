class ApplicationController < ActionController::Base
      # deviseコントローラーにストロングパラメータを追加する          
       before_action :configure_permitted_parameters, if: :devise_controller?

      protected
      def configure_permitted_parameters
       # サインアップ時にnameとemailのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
       # アカウント編集の時にnameとprofileのストロングパラメータを追加
       #devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
      end
  
      # Deviseのリダイレクト先を指定
      def after_sign_in_path_for(resource)
         root_path  # ホーム画面にリダイレクト
      end
  
      def after_sign_out_path_for(resource_or_scope)
          root_path  # ログアウト後もホーム画面にリダイレクト
      end


end
