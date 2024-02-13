ActiveAdmin.register Product do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :name, :weight, :price, :about_product, :subcategory_id, :product_weight
    
    form do |f|
      f.inputs "Product Details" do
        f.input :name
        f.input :weight
        f.input :price
        f.input :about_product
        f.input :subcategory
        f.input :product_weight, as: :select, collection: ['kg', 'grams', 'liters', 'ml']
      end
      f.actions
    end
    #
    # or
    #
    # permit_params do
    #   permitted = [:category, :name, :weight, :price, :about]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
  end


  