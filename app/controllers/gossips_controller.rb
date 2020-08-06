class GossipsController < ApplicationController

  def show
    @gossips = Gossip.find(params[:id])
  end

  # GET /users/new
  def new
  	@post = Gossip.new
  end

  # POST /users
  def create
    id = User.all.sample.id
    @post = Gossip.new(title: params[:title], content:params[:content], user_id: id)

    if @post.save
      @message = "The super potin was succesfully saved !"
      flash[:success] = "The super potin was succesfully saved !"
      redirect_to root_path
    else
      @alert = true
      @message = "Error: " + @post.errors.messages.to_a.flatten[1]
      render new_gossip_path
    end
  end

  def destroy
  @gossips = Gossip.find(params[:id])
  @gossips.destroy
    redirect_to root_path
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = 
    if @gossip.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:gossip).permit(:title, :content)
  end
  
end


