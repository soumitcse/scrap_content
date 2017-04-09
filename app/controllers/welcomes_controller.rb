class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @welcomes = Welcome.all
  end

  # GET /welcomes/1
  # GET /welcomes/1.json
  def show
  end

  # GET /welcomes/new
  def new
    @welcome = Welcome.new
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes
  # POST /welcomes.json
  def create
    @welcome = Welcome.new(welcome_params)

   respond_to do |format|
     if @welcome.save

       url = welcome_params[:index]
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



       format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
       format.json { render :show, status: :created, location: @welcome }
     else
       format.html { render :new }
       format.json { render json: @welcome.errors, status: :unprocessable_entity }
     end
   end



  end

  # PATCH/PUT /welcomes/1
  # PATCH/PUT /welcomes/1.json
  def update
    respond_to do |format|
      if @welcome.update(welcome_params)
        format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @welcome }
      else
        format.html { render :edit }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome.destroy
    respond_to do |format|
      format.html { redirect_to welcomes_url, notice: 'Welcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.require(:welcome).permit(:index)
    end
end
