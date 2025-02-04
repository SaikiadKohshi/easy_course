class Tlcource < ApplicationRecord

    #これをTlcourceモデルファイルに追記することで、
    #Rails側でも**「TLはbelongs_to(属する):user (ユーザーに)」**ということが認識される。
    belongs_to :user 
    
    
end
