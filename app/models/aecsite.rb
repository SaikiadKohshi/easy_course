class Aecsite < ApplicationRecord

    #これをAecsiteモデルファイルに追記することで、
    #Rails側でも**「Aecsiteはbelongs_to(属する):user (ユーザーに)」**ということが認識される。
    belongs_to :user 
    

    # このファイルである「aecsite.rb」や「use.rb」、「tlcouce.rb」のモデルファイルは「rollback」、「migrate」のコマンドを打つ必要はなく
    # そのまま手動でコードを追加・削除して良い!!

end
