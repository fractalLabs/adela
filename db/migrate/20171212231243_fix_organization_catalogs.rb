class FixOrganizationCatalogs < ActiveRecord::Migration
  def change
    organizations_without_catalog = Organization.all.includes(:catalog).where(
      catalogs: {
        id: nil
      }
    )

    organizations_without_catalog.each do |organization|
      organization.create_catalog!
    end
  end
end
