class Product < ActiveRecord::Base
belongs_to :category
validates :name, :price, :category_id, presence:true

validates :price, :category_id, numericality:true 
end
