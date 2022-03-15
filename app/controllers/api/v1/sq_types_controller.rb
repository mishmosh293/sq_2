class Api::V1::SqTypesController < Api::V1::GraphitiController
  def index
    sq_types = SqTypeResource.all(params)
    respond_with(sq_types)
  end

  def show
    sq_type = SqTypeResource.find(params)
    respond_with(sq_type)
  end

  def create
    sq_type = SqTypeResource.build(params)

    if sq_type.save
      render jsonapi: sq_type, status: 201
    else
      render jsonapi_errors: sq_type
    end
  end

  def update
    sq_type = SqTypeResource.find(params)

    if sq_type.update_attributes
      render jsonapi: sq_type
    else
      render jsonapi_errors: sq_type
    end
  end

  def destroy
    sq_type = SqTypeResource.find(params)

    if sq_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sq_type
    end
  end
end
