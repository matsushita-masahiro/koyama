  
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
    make_recipes
    make_sentences
  end
end

def make_users
  _admin = User.create!(user_name: "Example User",
                      email:    "example@railstutorial.org",
                      password: "foobar",
                      comment: "hello!",
                      image: "face.png"
                      )
  50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(user_name:     name,
                email:    email,
                password: password,
                comment: "hi!",
                image: "face.png"
                )
  end
end

def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..20]
      followers      = users[3..20]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
end
    
def make_recipes
      Recipe.create!(ingredient:"豚ひき肉",amount: "約600g",prepare: "",breakdown: "(300ｇ+300ｇ)",menu_title: "2018年11月1週目")
      Recipe.create!(ingredient:"鶏むねひき肉",amount: "約300ｇ",prepare: "",breakdown: "",menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "鮭", amount: "３切",prepare: "︎骨を貫き食べやすい大きさにカット", breakdown: "",menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ブリ", amount: "４切", prepare: "大きな骨を取り除く", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "はんぺん", amount: "大判1枚", prepare: "袋の上から手でもんでつぶす", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ハム", amount: "4枚", prepare: "細切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ちくわ", amount: "2-3本", prepare: "薄く斜め切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "にんじん", amount: "3+2/3本", prepare: "1本-みじん切り, 1+1/3本-千切り,5/6-細切り", breakdown: "(1+1/3)(1/3+1/2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "たまねぎ", amount: "1個", prepare: "1個-みじん切り", breakdown: "(1/2+1/2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ピーマン", amount: "7-8個", prepare: "3個-みじん切り, 4-5個-細切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ズッキーニ", amount: "1本", prepare: "みじん切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "きゅうり", amount: "１本", prepare: "細切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "キャベツ", amount: "1/2玉", prepare: "千切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "コーン", amount: "約50ｇ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "トマト大", amount: "1個", prepare: "角切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "かぼちゃ", amount: "1/4個(約500ｇ)", prepare: "皮をところどころそぐようにむき、一口大にカット", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "小ねぎ", amount: "お好みで", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ほうれん草", amount: "1袋", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "チンゲン菜", amount: "2株", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "もやし", amount: "1袋(200ｇ)", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "枝豆", amount: "約310g", prepare: "さやから出す", breakdown: "(5さや+300g)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ミックスビーンズ", amount: "１袋", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "えのき", amount: "1パック", prepare: "三等分にカット", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "大葉", amount: "5枚", prepare: "みじん切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "梅干し", amount: "1-2粒", prepare: "種を取りペースト状にする", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "乾燥春雨", amount: "約40ｇ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "乾燥芽ひじき", amount: "約10g", prepare: "水に戻して水を切る", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "かつお節小分け", amount: "1/2袋", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "チーズ", amount: "適量", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "卵", amount: "2個", prepare: "", breakdown: "(1個+1個)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "牛乳", amount: "大1", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "にんにく", amount: "1かけ", prepare: "みじん切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "にんにくチューブ", amount: "２ｃｍ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "しょうが", amount: "1かけ", prepare: "みじん切り", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "しょうがチューブ", amount: "５ｃｍ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "マヨネーズ", amount: "大4", prepare: "", breakdown: "(大1+大1+大2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ケチャップ", amount: "大3", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "オイスターソース", amount: "小1", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "粒マスタード", amount: "大1.5", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "カレー粉", amount: "大1.5", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "顆粒コンソメ", amount: "小1", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "中華スープの素", amount: "小1/2", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "豆板醤", amount: "小1/3", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "レモン汁", amount: "小1/2", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "塩こんぶ", amount: "ひとつかみ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "砂糖", amount: "小2+大3.5", prepare: "", breakdown: "(小2+大0.5+大0.5+大0.5+大2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "塩", amount: "適量", prepare: "", breakdown: "(少々+少々+少々+少々+適量+小1)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "醤油", amount: "小5+大7", prepare: "", breakdown: "(小1+小1+小1+小2+大0.5+大1+大1+大1+大1+大1+大1.5)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "酒", amount: "大4.5", prepare: "", breakdown: "(大1+大1+大1+大1.5)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "みりん", amount: "小1+大4", prepare: "", breakdown: "(小1+大1+大1+大2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "穀物酢", amount: "大0.5", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "調味酢", amount: "大7", prepare: "", breakdown: "(大1+大2+大4)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "白だし", amount: "小3+大2", prepare: "", breakdown: "(小1+小2+大0.5+大1.5)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "液体塩こうじ", amount: "大4", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "コショウ", amount: "少々", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ブラックペッパー", amount: "少々", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "粉山椒", amount: "お好みで", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "いりごま", amount: "適量", prepare: "", breakdown: "(適量+適量+適量+大1/2)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "すりごま", amount: "大2", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "ごま油", amount: "大3.5", prepare: "", breakdown: "(大0.5+大1.5+大1.5)", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "コーンスターチ", amount: "適量", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "小麦粉", amount: "適量", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "パン粉", amount: "1/3カップ", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      Recipe.create!(ingredient: "片栗粉", amount: "小2", prepare: "", breakdown: "", menu_title: "2018年11月1週目")
      
end

def make_sentences
      sentences = [
        "●いまはＩＴの時代。ボタンを押せば知識はいくらでも入ってきます。だからこそ、逆に人間力が問われる時代だと感じています。　　◯安田弘",
        "●本のような100点の親は無理でも、我が子にとって100点の親であればいい。　　◯発言者不明",
        "●日本人のみならず、外国人に親しい友達ができるということは、それだけ視野も広がるだろうし、いろいろな知識も入ってくる。　　◯安田弘",
        "●子供は親の言うことはきかないが、親のする通りにはするものです。親の生き方こそ子供にとって最高の教材です　　◯牧師のジョセフ・マーフィー",
        "●両親がひたむきに生きる姿自体が、どんな幼い子にも素晴らしい影響を与えるんです　　◯ソニーの創業者・井深大",
        "●働くお母さんたちは、出かける前に8秒間抱きしめてあげなさい　　◯ソニーの創業者・井深大",
        "●子供を不幸にする一番確実な方法は、いつでも、なんでも手に入れられるようにしてやる事である　　◯哲学者のジャン＝ジャック・ルソー",
        "●子供達がケンカをしていたら、ケンカをしている理由だけ聞いて、あとは放っておけばいい。そうすれば子供達は、自分達がなぜケンカをしていたのか？ということを考えざるをえなくなる　　◯実業家の勝政行",
        "●母の前で平気にするいたずらは、信頼感のあらわれ　　◯子育てにとても大切な27のヒント—クレヨンしんちゃん親子学",
        "●ひまはまだ小さいからみんなが守ってあげなきゃダメなんだ。オマエもそうやって大きくなったんだよ　　◯アニメ『クレヨンしんちゃん』の野原ひろし",
        "●究極の育児は、夫婦が仲良くしていること　　◯つるの剛士ナレーションのドキュメンタリー映画『うまれる』",
        "●一緒に本を読むことは、親子の絆を深め、本の内容に対する子供の理解を深める　　◯子供発育専門家のマルタ・ホッペ",
        "●認めてあげれば、子どもは自分が好きになる　　◯アメリカの子育てカウンセラー・ドロシー・ロー・ノルト",
        "●子供たちに何ができるのか知りたければ、彼らにモノを与えるのをやめるべきだ。　　◯ノーマン・ダグラス",
        "●子供は親の言うことはきかないが、親のする通りにはするものです。親の生き方こそ子供にとって最高の教材です。　　◯ジョセフ・マーフィー",
        "●両親がひたむきに生きる姿自体が、どんな幼い子にも素晴らしい影響を与えるのです。　　◯ソニーの創業者・井深大",
        "●よりかかるべき人ではなく、よりかかることを不必要にさせるべき人。それが親である。　　◯Ｄ･Ｃフィシャー",
        "●人柄や能力は、子供のころの体験が大事。好奇心や冒険心を育てることが、豊かな人間を作るのだ。　　◯ソニーの創業者・井深大",
        "●子供たちを励まし、彼らの夢を明確にしてその目標に向かって導いてやるのが大人の役割です。　　◯アーノルド・シュワルツネッガー",
        "●大切なのは、問うのをやめないことです。好奇心は、それ自体存在理由を持っているのです。　　◯アインシュタイン",
        "●考える術を教えるべきで、考えたことを教えるべきではない。　　◯グルリット",
        "●子供には批評よりも手本が必要である。　　◯ジューベル",
        "●育児くらい崇高で素晴らしい仕事はない。　　◯ソニーの創業者・井深大"
        ]
        
        
      sentences.each do |sentence|
        Sentence.create!(proverb: sentence)
      end
end