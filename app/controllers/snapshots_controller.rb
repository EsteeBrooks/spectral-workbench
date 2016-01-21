class SnapshotsController < ApplicationController
  respond_to :json

  def create

    @spectrum = Spectrum.find params[:id]
    @snapshot = @spectrum.add_snapshot(
      current_user,
      params[:data]
    )

  end

  def show

    @snapshot = Snapshot.find params[:id]

    respond_with(@snapshot) do |format|
      format.json  {
        render :json => @snapshot.data
      }
    end

  end

end