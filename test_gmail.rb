require 'gmail'
require 'dotenv'
Dotenv.load

=begin
gmail = Gmail.connect!("thprennes@gmail.com", "thprennes2018")
gmail.deliver do
  to "christophe.leray1@gmail.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
end
gmail.logout

=end 

gmail = Gmail.connect!("thprennes@gmail.com", ENV["PASSWORD"])

gmail.deliver do
  to "christophe.leray1@gmail.com"
  subject "test Xouath2"
  text_part do
    body "Text of plaintext message."
  end
end
gmail.logout

