class Forest::CampaignController < ForestLiana::ApplicationController
  def tambah_donasi
      campaign_id = params.dig('data', 'attributes', 'ids')[0]
      amount = params.dig('data', 'attributes', 'values', 'Jumlah').to_i
  
      campaign = Patient.find(campaign_id)
      total = campaign.fund_current.to_i + amount    
      campaign.update(fund_current: total)

      render json: {success: "Berhasil menambahkan donasi sejumlah #{amount}"}
  end

end
