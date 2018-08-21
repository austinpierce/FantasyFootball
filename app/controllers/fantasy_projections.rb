class FantasyProjectionsController < ApplicationController
  
  def show
    @fantasy_projection = FantasyProjection.find(params[:id])
  end
  
end