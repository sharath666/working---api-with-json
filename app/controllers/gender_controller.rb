class GenderController < ApplicationController
  def determine
  	if params[:name]
  		res = HTTParty.get("https://gender-api.com/get?name=#{params[:name]}&key=pRPLCejozFwCHFbVCR")
  		@determine = JSON.parse(res.body)
  end
end
end
