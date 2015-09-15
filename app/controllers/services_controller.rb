class ServicesController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_service = ServicePresenter.new(object: @service, view_template: view_context)
    @presented_service_articles = BaseCollectionPresenter.new(collection: @presented_service.articles, view_template: view_context, presenter: ArticlePresenter)
  end

  private

    def check_slug
      @service = Service.displayable.find(params[:id])
      return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    end

end
