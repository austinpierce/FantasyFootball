class PlayersController < ApplicationController
  
  def index
    
 @filterrific = initialize_filterrific(
      Player,
      params[:filterrific],
      select_options: {
        #sorted_by: Player.options_for_sorted_by,
        filter_player_position: Player.options_for_select
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :filter_player_position],
      sanitize_params: true
    ) or return

    #@players = @filterrific.find.page(params[:page])
    @fantasy_players = @filterrific.find.page(params[:page])

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