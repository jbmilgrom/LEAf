class SavedArticle < ActiveRecord::Base
	belongs_to :user
	belongs_to :article

  def header
    self.article.header
  end

  def subheader
    self.article.subheader
  end

  def body
    self.article.body
  end

  def serializable_hash(options = nil)
    {id: id, user_id: user_id, article_id: article_id, is_archived?: is_archived?, is_favorited?: is_favorited?, header: header, subheader: subheader, body: body}
  end 
end
