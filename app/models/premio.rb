class Premio < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"


  def self.search(term)
    where("lower(nome_premio)like ?", "%#{term.downcase}%")
  end

end
