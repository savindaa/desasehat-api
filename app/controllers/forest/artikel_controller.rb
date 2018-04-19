class Forest::ArtikelController < ForestLiana::ApplicationController
  def accept_article
    article_id = params.dig('data', 'attributes', 'ids')
    article_id.map do |article| 
    Article.update(article, status: "accepted")
    end
    render json: {success: "Artikel telah divalidasi."}
  end

  def decline_article
	  article_id = params.dig('data', 'attributes', 'ids')
	  article_id.map do |article| 
	  Article.update(article, status: "declined")
	  end
	  render json: {success: "Artikel ditolak."}
  end
end
