class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, styles: { large: "400x400>", thumb: "80x80>" },  default_url: "/images/:style/missing.png",
          :storage => :s3,
           :url => ':s3_domain_url',
           :path => '/:class/:attachment/:id_partition/:style/:filename',
           :s3_host_name => 's3-us-west-2.amazonaws.com'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
