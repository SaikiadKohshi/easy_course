class Tchcourcelist < ApplicationRecord

    #これをTchcourcelistモデルファイルに追記することで、
    #Rails側でも**「TCHはbelongs_to(属する):user (ユーザーに)」**ということが認識される。
    belongs_to :user 
    
end
