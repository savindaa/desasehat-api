class AdminDesaController < ApplicationController

  before_action :admin_desa?

  def list_users
   users = User.where(village_id: @current_user.village_id)
   render json: users, only: [:id, :name, :phone], status: :ok
  end

  def detail_user
   user = User.find(params[:id])
   render json: user, methods: :user_privileges, status: :ok
  end

  def privileges_list
    privileges = Privilege.all
    render json: privileges, only: [ :id, :name ], status: :ok
  end

  def update_privileges
    user = User.find(params[:id])
    if user.village_id == @current_user.village_id
      current = []
      privileges_params.map do |data|
        current << data[:id]
        user.privileges << Privilege.find(data[:id]) if user.privileges.find_by(id: data[:id]).blank?
      end
      user.privileges.where.not(id: current).map { |d| user.privileges.delete(d.id) } unless user.privileges.where.not(id: current).blank?
    else
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized)
    end
  end


  private

  def privileges_params
    params.require(:user_privileges).map do |r|
      r.permit(:id)
    end
  end

  def admin_desa?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 1).blank?
  end

end
