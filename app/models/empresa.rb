class Empresa < ActiveRecord::Base
  belongs_to :endereco, dependent: :destroy

  accepts_nested_attributes_for :endereco, allow_destroy: true

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/empresa1.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
