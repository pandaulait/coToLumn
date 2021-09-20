# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(id: 1) do |admin|
 admin.email = "example@example.com"
 admin.password = "example"
 admin.name = "guest"
end

Admin.create(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"], name: ENV["ADMIN_NAME"])

['算数','理科','国語','社会','英語'].each do |subject|
  SubjectArea.create!(
    { name: subject}
  )
  if subject == '算数'
   subject_area = SubjectArea.find_by(name: '算数')
    ['デフォルト','東京書籍株式会社','大日本図書株式会社','学校図書株式会社','教育出版株式会社','教育出版株式会社','株式会社振興出版社啓林館','日本文教出版株式会社'].each do |name|
    subject_area.textbook_lists.create!(
       { title: name }
     )
    end
  end
end
for num in 1..12 do
  Grade.create!(
    { number: num}
  )
end


TextbookList.all.each do |textbook|
  case textbook.title
  when 'デフォルト'
   [
     [0,'サイト説明'],
     [1,'少数と整数'],
     [2,'少数のかけ算'],
     [3,'少数の割り算'],
     [4,'合同な図形'],
     [5,'比例'],
     [6,'平均'],
     [7,'単位量あたりの大きさ（１）'],
     [8,'単位量あたりの大きさ（２）'],
     [9,'倍数と約数'],
     [10,'分数のたし算とひき算'],
     [11,'分数と少数と整数'],
     [12,'図形の角'],
     [13,'正多角形と円'],
     [14,'図形の面積'],
     [15,'体積'],
     [16,'割合（１）'],
     [17,'割合（２）'],
     [18,'立体'],
     [19,'色々なグラフ'],
     [20,'データの活用'],
     [21,'5年のまとめ']
   ].each do |num, name|
    textbook.chapters.create!(
       { grade_id: 5, number: num, body: name}
     )
    end
    [
     [1,'ならべ方と組み合わせ方'],
     [2,'文字と式'],
     [3,'分数と整数の掛け算と割り算'],
     [4,'分数×分数'],
     [5,'分数÷分数'],
     [6,'少数と分数の計算'],
     [7,'対称'],
     [8,'円の面積'],
     [9,'立体の体積'],
     [10,'比とその利用'],
     [11,'拡大図と縮図'],
     [12,'比例と反比例'],
     [13,'資料の整理'],
     [14,'データの活用'],
     [15,'算数のまとめ']
    ].each do |num, name|
    textbook.chapters.create!(
       { grade_id: 6, number: num, body: name}
     )
    end
  when '学校図書株式会社'
    [
     [1,'少数と整数'],
     [2,'合同な図形'],
     [3,'比例'],
     [4,'平均'],
     [5,'単位量あたりの大きさ（１）'],
     [6,'少数のかけ算'],
     [7,'少数の割り算'],
     [8,'単位量あたりの大きさ（２）'],
     [9,'図形の角'],
     [10,'倍数と約数'],
     [11,'分数のたし算とひき算'],
     [12,'分数と少数と整数'],
     [13,'割合（１）'],
     [14,'図形の面積'],
     [15,'正多角形と円'],
     [16,'体積'],
     [17,'割合（２）'],
     [18,'色々なグラフ'],
     [19,'立体'],
     [20,'データの活用'],
     [21,'5年のまとめ']
    ].each do |num, name|
    textbook.chapters.create!(
       { grade_id: 5, number: num, body: name}
     )
    end
    [
     [1,'ならべ方と組み合わせ方'],
     [2,'文字と式'],
     [3,'分数と整数の掛け算と割り算'],
     [4,'分数×分数'],
     [5,'分数÷分数'],
     [6,'少数と分数の計算'],
     [7,'対称'],
     [8,'円の面積'],
     [9,'立体の体積'],
     [10,'比とその利用'],
     [11,'拡大図と縮図'],
     [12,'比例と反比例'],
     [13,'資料の整理'],
     [14,'データの活用'],
     [15,'算数のまとめ']
    ].each do |num, name|
    textbook.chapters.create!(
       { grade_id: 6, number: num, body: name}
     )
    end
  end
end