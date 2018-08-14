class PlayersController < ApplicationController
  
  def index
  #  @players = Player.paginate(page: params[:page], per_page: 50)
   # @fantasy_players = Player.joins(:fantasy_player).paginate(page: params[:page], per_page: 50)
    
 @filterrific = initialize_filterrific(
      Player,
      params[:filterrific],
      select_options: {
        #sorted_by: Player.options_for_sorted_by,
        filter_player_position: Player.options_for_select
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:filter_player_position],
      sanitize_params: true
    ) or return

    #@students = @filterrific.find.page(params[:page])
    @players = @filterrific.find.page(params[:page])
    @fantasy_players = Player.joins(:fantasy_player).paginate(page: params[:page], per_page: 50)

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end


  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  

  end
end