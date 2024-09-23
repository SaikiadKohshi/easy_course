class ApplicationController < ActionController::Base
    # Deviseのリダイレクト先を指定
    def after_sign_in_path_for(resource)
        root_path  # ホーム画面にリダイレクト
      end
  
      def after_sign_out_path_for(resource_or_scope)
        root_path  # ログアウト後もホーム画面にリダイレクト
      end
end
