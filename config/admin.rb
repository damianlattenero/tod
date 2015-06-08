# Strategies for obtaining Admin user

case Padrino.env
  when :development then AdminManager.set_admin_email 'alvarez.ariel.work@gmail.com'
  when :production  then AdminManager.set_admin_email ENV['ADMIN_USEREMAIL']
  when :test        then AdminManager.set_admin_email 'admin@mail.com'
end
