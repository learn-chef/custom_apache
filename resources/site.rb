property :homepage, String

default_action :create

load_current_value do
  if ::File.exist?('/var/www/html/index.html')
    homepage IO.read('/var/www/html/index.html')
  end
end

action :create do
  # Install the package.
  package 'apache2'

  # Enable the service when the system boots and start the service.
  service 'apache2' do
    action [:enable, :start]
  end

  #################################################
  # This demonstrates CHEF-19: Use of property_name inside of actions
  # https://docs.chef.io/deprecations_namespace_collisions.html
  #################################################

  # Set the contents of the homepage.
  file '/var/www/html/index.html' do
    content homepage
  end
end
