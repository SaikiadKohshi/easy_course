class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :aecsites, dependent: :destroy #追記 ユーザーが削除されたら、ECsite内も削除されるようになります。
  validates :name, presence: true #nameのパラメータを許可するために使うコード
  validates :email, presence: true #emailのパラメータを許可するために使うコード
end
