module Crypto
  
  class Crypto < ActiveRecord::Base
    KEY = "change this to something long and hard to guess"
        
    def self.encrypt(plain_text)
      crypto = start(:encrypt)
  
      cipher_text = crypto.update(plain_text)
      cipher_text << crypto.final
  
      cipher_hex = cipher_text.unpack("H*").join
  
      return cipher_hex
    end
    
    def self.decrypt(cipher_hex)
      crypto = start(:decrypt)
      
      cipher_text = [cipher_hex].pack("H*")
      
      plain_text = crypto.update(cipher_text)
      plain_text << crypto.final
  
      return plain_text
    end
  
    private
  
    def self.start(mode)
      crypto = OpenSSL::Cipher::Cipher.new('aes-256-ecb').send(mode)
      crypto.key = Digest::SHA256.hexdigest(KEY)
      return crypto
    end
  end
end