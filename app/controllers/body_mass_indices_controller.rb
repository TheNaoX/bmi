class BodyMassIndicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    render json: current_user.body_mass_indices
  end

  def create
    @body_mass_index = current_user.body_mass_indices.build(body_mass_index_params)

    if @body_mass_index.save
      render json: @body_mass_index, status: :created
    else
      render json: { message: "Could not create index" },
        status: :unprocessable_entity
    end
  end

  private

  def body_mass_index_params
    params.fetch(:body_mass_index, {}).permit(:height, :weight)
  end
end
