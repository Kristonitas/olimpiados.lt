ActiveAdmin.register Sponsor do
  include ActiveAdmin::SortableTable # creates the controller action which handles the sorting
  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column

  permit_params :name, :image_id, :url, :visible, :position

  index do
    handle_column
    id_column
    column :name
    column :url
    column :image_id
    column  "Visible" do |sponsor|
      a href: toggle_visibility_admin_sponsor_path(sponsor), :"data-method" => :put do
        status_tag sponsor.visible
      end
    end
    actions
  end

  member_action :toggle_visibility, finder: :find_by_slug, method: :put do
    resource.update(visible: !resource.visible)
    redirect_to collection_url, notice: !resource.visible ? "Hidden" : "Shown"
  end
end