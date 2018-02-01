if defined?(ChefSpec)
  def create_custom_apache_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:custom_apache_site, :create, resource_name)
  end
end
