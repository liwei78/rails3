class ContentsController < ApplicationController


  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        @msg = "save !!"
        format.js
      else
        format.js
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
    respond_to do |format|
      format.js
    end
  end

end
