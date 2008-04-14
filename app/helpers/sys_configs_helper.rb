module SysConfigsHelper
  def toggle_form(action)
    update_page do |page|
      page.select('#component').each do |item|
        page.send action, item
      end
    end
  end
end
