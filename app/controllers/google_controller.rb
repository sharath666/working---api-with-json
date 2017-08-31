class GoogleController < ApplicationController
  def distance
  	if params[:origin] && params[:destination]
  		response = HTTParty.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:origin]}&destinations=#{params[:destination]}")
  		@result = JSON.parse(response.body)
  end
end

def address
	if params[:add_name]
		response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:add_name]}")
		@res= JSON.parse(response.body)
	end
end
end