class Sq < ApplicationRecord
  mount_base64_uploader :pic, PicUploader

  # Direct associations

  belongs_to :sqtype,
             :class_name => "SqType"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sqtype.to_s
  end

end
