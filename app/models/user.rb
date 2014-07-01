class User < ActiveRecord::Base
  # Added a child relationship for managed_albums
  # This user can have one or more managed albums
  # If it was name albums_users it would not need a class name
  has_many :managed_albums, class_name: 'ManagedAlbums', dependent: :destroy

  # has many through
  has_many :albums, through: :managed_albums

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
