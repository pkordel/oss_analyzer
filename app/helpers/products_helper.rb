module ProductsHelper
  def toggle_form(action)
    update_page do |page|
      page.select('#product').each do |item|
        page.send action, item
      end
    end
  end
end
