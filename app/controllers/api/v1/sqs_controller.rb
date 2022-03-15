class Api::V1::SqsController < Api::V1::GraphitiController
  def index
    sqs = SqResource.all(params)
    respond_with(sqs)
  end

  def show
    sq = SqResource.find(params)
    respond_with(sq)
  end

  def create
    sq = SqResource.build(params)

    if sq.save
      render jsonapi: sq, status: 201
    else
      render jsonapi_errors: sq
    end
  end

  def update
    sq = SqResource.find(params)

    if sq.update_attributes
      render jsonapi: sq
    else
      render jsonapi_errors: sq
    end
  end

  def destroy
    sq = SqResource.find(params)

    if sq.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sq
    end
  end
end
