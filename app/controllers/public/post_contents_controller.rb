class Public::PostContentsController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def show
    @post_content = PostContent.find(params[:id])
    @comments = @post_content.comments
    @comment = @post_content.comments.build
  end

  def new
    @latitude = params[:post_content][:latitude]
    @longitude = params[:post_content][:longitude]
    @address = params[:post_content][:address]
    @post_content = PostContent.new
    @prefecture = @address.scan(/.+[都道府県]/)
    # @select = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮城県", "鹿児島県", "沖縄県"]
  end

  def edit
    @post_content = PostContent.find(params[:id])
    if @post_content.customer == current_customer
      render "edit"
    else
      redirect_to maps_path
    end
  end

  def create
    @post_content = PostContent.new(post_content_params)
    @post_content.customer_id = current_customer.id
    if @post_content.save
      redirect_to post_content_path(@post_content.id)
    else
      @latitude = params[:post_content][:latitude]
      @longitude = params[:post_content][:longitude]
      @address = params[:post_content][:address]
      @prefecture = @address.scan(/.+[都道府県]/)
      # @select = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮城県", "鹿児島県", "沖縄県"]
      render :new
    end
  end

  def update
    post_content = PostContent.find(params[:id])
    post_content.update(post_content_params)
    redirect_to post_content_path(post_content.id)
  end

  def destroy
    @post_content = PostContent.find(params[:id])
    @post_content.destroy
    redirect_to maps_path
  end

  def ranking
    @prefecture = params[:prefecture]
    if @prefecture
      @post_contents = PostContent.includes(:favorites).where(prefectures: @prefecture).sort do |a, b|
        b.favorites.size <=> a.favorites.size
      end
    else
      @post_contents = PostContent.includes(:favorites).where(prefectures: '東京都').sort do |a, b|
        b.favorites.size <=> a.favorites.size
      end
      @prefecture = '東京都'
    end
  end

  private

  def post_content_params
    params.require(:post_content).permit(:description, :address, :name, :latitude, :longitude, :image, :prefectures,
                                         main_images: [])
  end
end
