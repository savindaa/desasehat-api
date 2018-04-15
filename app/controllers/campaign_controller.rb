class CampaignController < ApiController

	before_action :super_admin?
	before_action :find_campaign, only: [ :show, :delete ]

	def index
		campaign = Patient.all
		render json: campaign, status: :ok
	end

	def show
		render json: @campaign, status: :ok
	end

	def delete
		@campaign.destroy
		head :no_content
	end

	private

	def find_campaign
		@campaign = Patient.find(params[:id])
	end
end
