class TweetsController < ApplicationController

# 追加箇所
  before_action :authenticate_user!, only: [:new, :create]
# ここまで

#追加箇所
    def index
        @tweets = Tweet.all
    end
  # ここまで
  
  #追加箇所
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end
 #ここまで
def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id  #追記

    if tweet.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end


end