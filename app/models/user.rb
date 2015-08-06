class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proposals, :dependent => :delete_all
  has_many :schools, :dependent => :delete_all
  has_many :messages

  has_attached_file :photo, styles: { medium: "300x300#", thumbnail: "100x100#" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  
 validates_attachment_content_type :photo, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :photo 

  geocoded_by :location
  after_validation :geocode

end
