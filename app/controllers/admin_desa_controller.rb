class AdminDesaController < ApplicationController

  before_action :admin_desa?

  def list_users
   users = User.where(village_id: @current_user.village_id).
                paginate(page: params[:page], per_page: params[:limit] || 10).
                order(:name)
   render json: users, only: [:id, :name, :phone, :picture], status: :ok
  end

  def detail_user
    user = User.find(params[:id])
    render json: user, methods: :user_privileges, status: :ok
  end

  def privileges_list
    privileges = Privilege.all
    render json: privileges, only: [ :id, :name, :su_only ], status: :ok
  end

  def update_privileges
    user = User.find(params[:id])
    if user.village_id == @current_user.village_id
      current = []
      unless privileges_params[:user_privileges].blank?
        privileges_params[:user_privileges].map do |data|
          privilege = Privilege.find(data[:id])
          raise ExceptionHandler::StatementInvalid, Message.su_only if privilege[:su_only] == true
          current << data[:id]
          user.privileges << privilege if user.privileges.find_by(id: data[:id]).blank?
        end
      end
      current_privilege = user.privileges.where.not(id: current, su_only: true)
      current_privilege.map { |d| user.privileges.delete(d.id) } unless current_privilege.blank?
    else
      raise(ExceptionHandler::AuthenticationError, Message.beyond_privilege)
    end
  end


  private

  def privileges_params
      params.require(:admin_desa).permit(:user_privileges => [:id])
  end

  def admin_desa?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 1).blank?
  end

end
