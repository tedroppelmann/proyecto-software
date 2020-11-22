# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    def show
      @parties = Party.all
      @services = Service.all
    end

    def show_monedero; end

    def cargar_monedero; end

    def patch_monedero
      current_user.monedero = current_user.monedero + params[:amount].to_i
      redirect_to user_show_session_path if current_user.save
    end

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
