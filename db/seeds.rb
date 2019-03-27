# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

applications = [
                {
                    :first_name => 'Carrie', :last_name => 'Johnson', :email => 'CarrieJJohnson@armyspy.com', :uin => '844997087',:phone_number => '315-624-4412',
                    :graduation_date => '2020', :gpa => '2.50', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ', :major => 'Computer Engineering', :status => 0,
                        :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                        :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                        :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                        :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"
                },
                {
                    :first_name => 'James', :last_name => 'Quinn', :email => 'JamesSQuinn@armyspy.com', :uin => '964540968', :phone_number => '954-525-6935',
                    :graduation_date => '2021', :gpa => '3.45',  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ', :major => 'Computer Science', :status => 0,
                    :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                    :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"

                },
                {
                    :first_name => 'Jean', :last_name => 'Long', :email => 'JeanKLong@armyspy.com', :uin => '192904631',:phone_number => '228-889-9309',
                    :graduation_date => '2020', :gpa => '3.52', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ',  :major => 'Computer Science', :status => 2,
                    :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                    :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"

                },
                {
                    :first_name => 'Matthew', :last_name => 'Williams', :email => 'MatthewHWilliams@teleworm.us', :uin => '614854151',:phone_number => '',
                    :graduation_date => '2022', :gpa => '3.19', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ', :major => 'Computer Engineering', :status => 1,
                    :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                    :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"


                },
                {
                    :first_name => 'Mike', :last_name => 'Fuhrmann', :email => 'MikeFuhrmann@teleworm.us', :uin => '769902369',:phone_number => '915-630-1283',
                    :graduation_date => '2021', :gpa => '2.45', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ', :major => 'Computer Engineering', :status => 3,
                    :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                    :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                    :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"

                },
                {
                    :first_name => 'Demi', :last_name => 'Burrows', :email => 'DemiBurrows@teleworm.us', :uin => '359415912',:phone_number => '320-303-2113',
                    :graduation_date => '2020', :gpa => '4.0', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ',  :major => 'Computer Science', :status => 0,
                      :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                      :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                      :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                      :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"

                },
                {
                    :first_name => 'Evelyn', :last_name => 'Evelyn', :email => 'EvelynRodriguesOliveira@teleworm.us', :uin => '921041917',:phone_number => '802-408-4492',
                    :graduation_date => '2020', :gpa => '3.87', :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus elit, suscipit vitae dui non,
                      ornare finibus odio. Nulla vehicula magna quis auctor cursus. Aliquam vitae bibendum orci. Nam semper odio urna, id consectetur orci cursus congue.
                      Pellentesque pharetra magna vel sapien ullamcorper, rhoncus consequat felis maximus. Fusce elementum risus quis molestie egestas. Curabitur commodo augue nec
                      nulla efficitur, ac molestie lacus tempor. Phasellus lacinia ultrices pellentesque. Proin ultricies augue metus, a dignissim urna feugiat a. Nulla malesuada semper egestas.
                      Donec pellentesque, nibh eget auctor viverra, tellus velit gravida dolor, vel molestie quam magna ac ex. Nullam cursus ligula in rhoncus aliquet.
                      ', :major => 'Computer Science', :status => 2,
                      :resume => "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                      :transcript=> "https://drive.google.com/file/d/1eXybu6q4rQ0Si2Kd0kIbKibW5Vo7yBDg/preview",
                      :schedule => "https://drive.google.com/file/d/17dM1-G0PZfn9hvUzMFVpQ4S-1XWxlnBu/preview",
                      :picture => "https://drive.google.com/file/d/1pwrAKKsCcxKFKG_jgCEUMqUFGiyCcRuB/preview"

                },

              ]

applications.each do |application|
  Applicant.create!(application)
end