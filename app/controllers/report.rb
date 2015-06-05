require 'iconv'

Tod::App.controllers :report do
  get :page  do
    @cantidad = search_tag(" ").uniq
    @cantidad= @cantidad.size
    render 'report/report_page'
  end

  post :search do
    @query=params[:consulta]
    @proposals = search_tag("#{@query}").uniq
    render 'report/report_page'
  end
end