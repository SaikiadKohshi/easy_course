class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :aecsites, dependent: :destroy #追記 ユーザーが削除されたら、ECsite内も削除されるようになります。
  validates :name, presence: true #nameのパラメータを許可するために使うコード
  validates :email, presence: true #emailのパラメータを許可するために使うコード

  has_many :tchcourcelists, dependent: :destroy #これをモデルのファイルに追記することで、Rails側でも**「ユーザーはhas_many (いっぱい持っている) :tchcourcelists (tchcourcelistsを)」**ということが認識されます。
  has_many :tlcources, dependent: :destroy #これをモデルのファイルに追記することで、Rails側でも**「ユーザーはhas_many (いっぱい持っている) :tlcources (tlcourcesを)」**ということが認識されます。

  has_many :universitylives, dependent: :destroy  # ユーザー削除時に関連投稿も削除

  
end
