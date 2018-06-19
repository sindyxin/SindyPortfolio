module PagesHelper
  def twitter_parser tweet
    @tweet_url = PointOutUrl::Renderer.text_parser tweet
  end
end
