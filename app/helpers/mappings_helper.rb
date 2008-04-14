module MappingsHelper
  def toggle_form(action)
    update_page do |page|
      page.select('#mapping').each do |item|
        page.send action, item
      end
    end
  end
end
