module CatalogsHelper
  def can_publish?(catalog)
    catalog.datasets.map(&:distributions).flatten.map(&:state).grep(/documented|refined/).present?
  end

  def published_catalog_id(catalog)
    upcase_slug = @catalog.organization.slug.upcase
    epoch_time = @catalog.publish_date.to_i
    "#{upcase_slug}-#{epoch_time}"
  end
end
