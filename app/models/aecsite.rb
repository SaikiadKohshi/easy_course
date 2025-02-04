class Aecsite < ApplicationRecord

    #これをAecsiteモデルファイルに追記することで、
    #Rails側でも**「Aecsiteはbelongs_to(属する):user (ユーザーに)」**ということが認識される。
    belongs_to :user 
    
end
