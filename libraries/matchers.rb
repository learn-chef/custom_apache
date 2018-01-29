if defined?(ChefSpec)
  def create_custom_web_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:custom_web_site, :create, resource_name)
  end

  def delete_custom_web_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:custom_web_site, :delete, resource_name)
  end
end
