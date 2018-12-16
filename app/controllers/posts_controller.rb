class PostsController < ApplicationController
  def new
    @h = params[:h]
    post = Post.all
    if post[-3].present?
      @hash = Post.last(3).pluck(:h)
    elsif post[-2].present?
      @hash = Post.last(2).pluck(:h)
    elsif post.present?
      @hash = Post.pluck(:h)
    end
    @count = post.count
  end

  def make
    generate(to_uploaded(params[:imgData]), params[:hash])
    Post.create!(h: params[:hash], title: params[:title])
    data = []
    render :json => data
  end

  def year
    @year = true
    @h = params[:h]
    post = PostYear.all
    if post[-3].present?
      @hash = PostYear.last(3).pluck(:h)
    elsif post[-2].present?
      @hash = PostYear.last(2).pluck(:h)
    elsif post.present?
      @hash = PostYear.pluck(:h)
    end
    @count = post.count
  end

  def make_year
    generate(to_uploaded(params[:imgData]), params[:hash])
    PostYear.create!(h: params[:hash], title: params[:title])
    data = []
    render :json => data
  end

  private

  def to_uploaded(base64_param)
    content_type, string_data = base64_param.match(/data:(.*?);(?:.*?),(.*)$/).captures
    tempfile = Tempfile.new
    tempfile.binmode
    tempfile << Base64.decode64(string_data)
    file_param = { type: content_type, tempfile: tempfile }
    ActionDispatch::Http::UploadedFile.new(file_param)
  end

  # S3 Bucket 内に画像を作成
  def generate(image_uri, hash)
    # BigTweet2の奴からopen無くしたらうまくいった
    # bucket.files.create(key: png_path_generate(hash), public: true, body: open(image_uri))
    bucket.files.create(key: png_path_generate(hash), public: true, body: image_uri)
  end

  # pngイメージのPATHを作成する
  def png_path_generate(hash)
    "images/#{hash}.png"
  end

  # bucket名を取得する
  def bucket
    # production / development / test
    environment = Rails.env
    storage.directories.get("myday-#{environment}")
  end

  # storageを生成する
  def storage
    Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    )
  end
end
