class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end

  def update_pm
    @environment = Environment.find(params[:id])
    response = RestClient.get "http://web.juhe.cn:8080/environment/air/pm",
                             :params => { :city => @environment.name, :key => "cffd9f472a295d5da4ea4c3b30fd2d66" }
   data = JSON.parse(response.body)

   @environment.update( :pm => data["result"]["0".to_i]["PM2.5"] )

   redirect_to environments_path


  end
end
