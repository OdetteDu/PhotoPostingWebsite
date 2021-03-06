class AddPassword < ActiveRecord::Migration
  def change
  	add_column :users, :password_digest, :string
  	add_column :users, :salt, :float
  	User.reset_column_information
  	for user in User.all()
  		user.password = user.login
  		user.save(validate: false)
  	end
  end
end
