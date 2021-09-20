## coToLumn
coToLumnは教員が日々の教材研究や実践を投稿、共有し深めていくWebアプリケーションです。
</br>
 
<img width="1679" alt="スクリーンショット 2021-09-21 3 13 07" src="https://user-images.githubusercontent.com/84437188/134053094-9ac3070d-4500-487c-adea-2f4b9810fa95.png">

URL: https://cotolumn.com/

'''
【会員ユーザーアカウント】
  ゲストログイン機能があります。

【管理者アカウント】
   メールアドレス： example@example.com 
   パスワード： example
'''
## サイト概要

・テキストや、記事をもとにユーザーの意見を仰ぎ深めていける。</br>
・コメントを元に、専門的か否か、直感的か否かを判断し、分析していく。</br>
・より良い問いはどんどん共有され、ユーザーのみなさんの思考を深めるに至る。</br>
・問い自動生成や、記事紹介を行う(実装予定)</br>

実装機能の詳細は機能一覧をご覧ください。
### ○ サイトテーマ
　日々に学びを、明日に問いを。
「学び」につながる「問い」を考え続けるサイト。

### ○ テーマを選んだ理由
  「授業や児童生徒の指導のアイデアとその意図の提供を通じて、教員や児童、親や社会人の思考を深める第一歩を応援する。」</br>
  これがcoTolumnにこめた思いです。



  前職で教員として児童に教えていた際、問題を見るや否や児童の放った一言。</br>
  「何算ですか。」</br>
  学校という現場には途方もないほどの問題が積み重なっているのだと、実感しました。</br>
  教員はもっと児童と向き合うための時間とスキルを効率よく身につけるべきだと。</br>
  教員に限らず、人は考え、学び、問わなければならない。</br>
  そのためには、日頃から、良質な文に触れ、良問に出会い、学ぶ力を鍛え、より良い人生に出会うためのすべを手に入れなければならない。</br>

  教員のみなさまは各教科、単元、授業ごとに丁寧な準備をされ、一時間もみたない一コマで、その準備を使い切ります。
  そしてその準備したものが次に使われるのはほとんど来年です。
  担当する学年が違えば、今度は新たに授業準備、教材研究に努めなければいけません。</br>

  そんなみなさまの授業の手助けとなるアイデアや発問がコラムとして集まる場所として、このwebアプリを提案します。</br>
### ○ サイト名の由来
  「『深い学び』は、そもそも『学び』とはなんなのか。」</br>
  この問いが、このサイトの出発点でした。</br>

  定理(theory)というのは主に、数学で用いられる言葉で、「公理、定義だけから証明された真なる命題」を意味します。</br>
  簡単にいうと、あるルールを元にした時に成り立つとわかっているもの。
  <!-- 数学的に例をあげるのであれば、「正三角形は、三つの辺の長さが等しい三角形である」という定義、ルールから導かれる「正三角形は、(3つの変の長さが等しいルールから)三つ角が等しい」という、正しいとわかっている事実のことを定理と言いいます。
  では、その定理は、数学のものだけでしょうか。 -->
  例えば、しばしば空から降ってくる水のことを雨と呼びましょう。</br>
  雨に当たったら濡れますよね。水だから。したがって、「雨にあたったら濡れる」は正しい、つまり定理と言えます。</br>
  「雨が降ったら、洗濯物が濡れる。」「雨が降ったら水溜りができる。」「雨が降ったら傘が必要になる。」</br>
  「雨が降ったら、虹が観れるかもしれない。」</br>

  あげたらキリがありませんが、こう言った当たり前のこと、ことわざのようなこと、人生を取り巻くルールの中でいろいろな定理を発見していくことが、人生の定理と言えないでしょうか。</br>
  そして、学ぶとは、人生の定理を自ら発見していくことではないのでしょうか。</br>

  そんな人生の定理は直訳で"Theory of life"であり、「人生観」という意味で使われます。</br>
  学び得たものが合わさって人生観を作り上げていく、その一つ一つをコラム(column)という形で掲載していく。</br>
  column + Tol →　coToLunmn </br>
  これがサイト名「コトラム」にこめた意味です。</br>


### ○ ターゲットユーザー
- 授業準備や教材研究を行っている教員
- 各単元などに紐づいた問題やテキストが欲しい教員
- 専門的に正しいと判断された教材を普及していきたい教員、専門家
- 形骸化した指導の再協議の場が欲しい教員
- 生徒指導を含む指導法を模索されている教員
- 復習や予習、各内容についてもっと学びたい児童生徒
- 学び直したい親や社会人

### 主な利用シーン
- 授業準備や、教材研究の資料集めの時。
- プリント作成
- 児童の授業中や家にての復習や予習に
- あるケースにおける生徒指導の例題を議論する場

## 機能一覧
○ユーザー側の機能
・非ログイン時に記事参照可
・会員登録機能
・退会機能(論理削除)
・記事種類別投稿・編集機能(コラム、問題、パッチテキスト)
・検索機能
・いいね、コメント、ユーザーのフォロー
・掲示板機能
・通知機能
・お問い合わせ機能

○管理者側の機能
・ユーザーの退会ステータス管理
・記事の非公開ステータス管理
・テキスト投稿、編集機能
・通知機能

○その他導入技術
・レスポンシブ(Bootstrap)
・いいね機能の非同期通信(Ajax)
・フォロー機能の非同期通信(Ajax)
・コメント機能の非同期通信(Ajax)
・MathJax(Latex)
・自動デプロイ

○使用ライブラリ
・ユーザー認証(devise)
・画像アップロード機能(Active Storage)
・RuboCop(静的コード解析)
・kaminari(ページネーション)
・bullet(N+1問題)
・gretel(ぱんくずリスト)
・dotenv-rails(環境変数)
・Natural Language API
・EasyMDE
・redcarpet
・通知機能
・環境変数

○今後追加したい機能
・教科書別目次機能
・問題プリント作成機能
・検索機能の教科
・UIの改善
・1日１回問題機能
・問題回答機能
・トピックのアーカイブ機能
・記事の評価別ソート機能
・お問い合わせ機能
・新規登録時のメール認証
・メール通知機能


## 設計書
- er図</br>
(https://drive.google.com/file/d/1FsBHP7i3poaVLZf6A1um3TPKIKQn-zh9/view?usp=sharing)
- テーブル定義書</br>
(https://docs.google.com/spreadsheets/d/1zugO_B2jcdgGZHRl3txXEgEpuu1a0fzHTvuiWs_S1Co/edit?usp=sharing)
- ワイヤーフレーム</br>
(https://xd.adobe.com/view/00349dc6-d41a-4e5f-9514-410aed13b059-5567/)

## チャレンジ要素一覧
- <https://docs.google.com/spreadsheets/d/1bN6QswQ8-s14l1H8pz7uJeFGqH6R_KfCtHqi1L_Q2m8/edit?usp=sharing>
- AIを用いたコメント分析</br>
掲示板機能に投稿されたコメントを元にワードクラウドを作成。
議論を可視化に挑戦。

## 開発環境
- OS：Mac(Big Sur)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9


