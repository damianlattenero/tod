# Strategies for obtaining Admin user

case Padrino.env
  when :development then AdminManager.set_admin_name 'AlvarezAriel'
  when :production  then AdminManager.set_admin_name  ENV['ADMIN_USERNAME']
  when :test        then AdminManager.set_admin_name  'admin'
end
