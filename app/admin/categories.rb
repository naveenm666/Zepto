# app/admin/category.rb
ActiveAdmin.register Category do
    permit_params :name, :description
    
end
  