require "opentok"

class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]

  def index
  	@rooms = Room.where(:public => true).order("created_at DESC")
    @new_room = Room.new
    @users = User.all
  end

  def create
  	# config_opentok
    session = @opentok.create_session :media_mode => :routed
  	params[:room][:sessionId] = session.session_id

  	@new_room = Room.new(strong_param)

  	respond_to do |format|
  		if @new_room.save
  			format.html { redirect_to("/party/"+@new_room.id.to_s) }
  		else
  			format.html { render :controller => 'rooms', :action => 'index' }
  		end
  	end
  end

  def party
  	@room = Room.find(params[:id])

  	# config_opentok

  	@tok_token = @opentok.generate_token @room.sessionId
  end

  private
  def config_opentok
  	if @opentok.nil?
  		@opentok = OpenTok::OpenTok.new 45547342, "ffaa0bc203747e274798b18e24f17eb76f8b833f"
  	end
  end

  def strong_param
    params.require(:room).permit(:name, :sessionId)
  end
end
