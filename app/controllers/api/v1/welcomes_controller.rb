class Api::V1::WelcomesController < ApiController
  # before_action :set_links

  def show
    byebug
  end

  def new
    byebug
    #code
  end

  def create

    @welcome = Welcome.new(index: get_url)

   respond_to do |format|
     if @welcome.save

       url = get_url
       doc = Nokogiri::HTML(open(url))
       id = @welcome.id

       #For H1 tags
       all = doc.css('h1')
       len = all.length
       i = 0

       while i < len
        temp = Header1.new
        temp.data = all[i].text
        temp.welcome_id = id
        temp.save!
        i = i + 1
       end



       #For H2 tags
       all = doc.css('h2')
       len = all.length
       i = 0
       while i < len
         temp = Header2.new
         temp.data = all[i].text
         temp.welcome_id = id
         temp.save!
         i = i + 1
       end



       #For H3 tags
       all = doc.css('h3')
       len = all.length

       i = 0

       while i < len
         temp = Header3.new
         temp.data = all[i].text
         temp.welcome_id = id
         temp.save!
         i = i + 1
       end


       #For Link tags
       all = doc.css('link').map { |link| link['href']}
       len = all.length
       i = 0
       while i < len
         puts all[i]
         temp = LinkUrl.new
         temp.data = all[i]
         temp.welcome_id = id
         temp.save!
         i = i + 1
       end

      #  format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
      #  format.json { render :show, status: :created, location: @welcome }

      # render :json => payload, :status => "successfully"
      # render json: @welcome, status: "successfully"
      # render :status => "200", :json => {:message => "success"}.to_json
       format.json { render json: @welcome, status: 200 }

      # render json: @welcome , include: ['header1s' , 'header2s' , 'header3s' , 'link_urls']
     else
      #  format.html { render :new }
       format.json { render json: @welcome.errors, status: :unprocessable_entity }
     end

   end

  end

  def index
    @welcome = Welcome.all
    render json: @welcome , include: ['header1s' , 'header2s' , 'header3s' , 'link_urls']
    # render json: @welcome
  end

  private

  def set_links
    # @urls = Welcome.all

  end

  def get_url
    @new_url = params[:new_url]
  end

end
