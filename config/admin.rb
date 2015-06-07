# Strategies for obtaining Admin user

case Padrino.env
  when :development then AdminManager.set_admin_name 'AlvarezAriel'
  when :production  then DataMapper.setup            ENV['ADMIN_USERNAME']
  when :test        then DataMapper.setup            'admin'
end
