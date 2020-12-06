class Posts
  def self.create(params)
    if params.keys.include?(:slug)
      Post.create(params)
    else
      slug = params[:title].parameterize
      Post.create(params.merge(slug: slug))
    end
  end
end
