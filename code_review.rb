require 'test/unit'

class Base
	
	def initialize (attributes = nil)
		if attributes == nil && block_given?
			yield self
		elsif attributes != nil
			return if attributes.empty?
			attributes.each do |key, value|
				public_send(:"#{key}=", value)
			end
		end
	end 
end

class User < Base
	attr_accessor :name, :last_name
end

class BaseTest < Test::Unit::TestCase
	def test_1 # Doesn't break
		assert @user = User.new
	end
	def test_2 # Allows assignment
		@user = User.new
		@user.name = 'Jose'
		assert  @user.name == 'Jose'
	end
	def test_3 # Allows assignment with hash
		@user = User.new({name: 'Juan', last_name: 'Perez'})
		assert  @user.name == 'Juan'
		assert  @user.last_name == 'Perez'
	end
	def test_4 # Allows assignment with hash and changes
		@user = User.new({name: 'Juan', last_name: 'Perez'})
		assert @user.name == 'Juan'
		assert @user.last_name == 'Perez'
		@user.name = 'Pedro'
		@user.last_name = 'Picapiedra'
		assert @user.name == 'Pedro'
		assert @user.last_name == 'Picapiedra'
	end
	def test_5 # Receives blocks
		assert @user = User.new { qq = 11}
		assert @user = User.new { puts 'optional block' }
	end
end

