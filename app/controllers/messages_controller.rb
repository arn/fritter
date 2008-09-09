class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  
  layout "messages"
  
  def index
    @message  = Message.new
    @messages = current_user.messages.paginate :page => params[:page], :order => 'updated_at DESC'
    @categories = current_user.categories.find(:all)
    
    # @messages = Message.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = current_user.messages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = current_user.messages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = current_user.messages.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = current_user.messages.new(params[:message])

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to(messages_path) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { redirect_to(messages_path) }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = current_user.messages.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
  
end
