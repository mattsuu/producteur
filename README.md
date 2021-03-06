# README

## アプリ名
　Producteur
 
## アプリケーション画面
　![producteur](producteur-top画像.png)

## DB設計
### receiversテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false, default: "", unique:true|
|encrypted_password|string|null: false, default: "", unique:true|
|gender|string|null: false, default: "", index: true|
|age|integer|null: false, default: "", index: true|
#### Association
- has_many :member_chats
- has_many :talkrooms

### advisorsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false, default: "", unique:true|
|encrypted_password|string|null: false, default: "", unique:true|
|gender|string|null: false, default: "", index: true|
|age|integer|null: false, default: "", index: true|
|job|string|null: false, index: true|
|shop|string|null: false, default: ""|
#### Association
- has_many :member_chats
- has_many :talkrooms

### member_chatsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|------|
|receiver_id|integer|foreign_key: true|
|advisor_id|integer|foreign_key: true|
#### Asociation
- belongs_to :receiver
- belongs_to :advisor

### talkroomsテーブル
|Column|Type|Options|
|------|----|-------|
|receiver_id|integer|foreign_key: true|
|advisor_id|integer|foreign_key: true|
#### Asociation
- belongs_to :receiver
- belongs_to :advisor

- has_many :messages

### messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|------|
|image|string|------|
|talkroom_id|integer|foreign_key: true|
|is_receiver|integer|------|
#### Asociation
- belongs_to :talkroom

## アプリ概要
　アプリ名はプロデューサーという意味。<br>
　美容師や美容部員の方々とそのお客さんとなる一般の方を繋ぐアプリケーション。<br>
　よくある一般の方から予約等をするものではなく、美容職の方々からアプローチをかけられるようにしてある。<br>
　むしろ、一般の方からのアプローチは出来ないようになっている。<br>
　お互いにメッセージのやりとりをして気に入れば、そのまま予約等に進むことも出来る。<br>
　基本的には、予約等をするアプリではなく、髪型やメイクに関する悩み解決がメイン。<br>
 
## アプリ機能
　新規登録・ログイン機能<br>
　掲示板チャット機能<br>
　ユーザー間でのメッセージ機能<br>
　
## アプリ使用の流れ
### 一般ユーザー
　一般ユーザーとして、ユーザー登録・ログイン。<br>
　一般の方のつぶやきが集まっている掲示板にアクセス。<br>
　そこで、髪型やメイクに関する悩みや知りたいことをチャットする。<br>
　そのチャットに反応のあった美容職ユーザーと直接メッセージのやりとり。<br>
　オンライン上で疑問が解決すれば良し。気に入れば直接その美容職ユーザーのお店に行くのも良し。<br>
 
### 美容職ユーザー
　美容職ユーザーとして、ユーザー登録・ログイン。<br>
　一般の方のつぶやきが集まっている掲示板にアクセス。<br>
　そこで、解決出来そうなもの・お客さんになりそうなものを見つけたら直接メッセージをしてみる。<br>
　直接やりとりをしてお店に来ていただけるようにするも良し。オンライン上で解決するも良し。<br>
 
## 製作背景
　「髪を切りたいから予約する/化粧道具が欲しいから百貨店に行く」ではなく、<br>
　「〇〇な髪型にしたいけど得意な人いるかな？/●●なメイクしたいけど誰か教えてくれないかな」など、<br>
　需要の細分化から考えたもの。<br>
　また、お店や道具だけでなく、人で選ぶ時代だからこそ悩みを拾って直接個人同士で<br>
　やりとり出来るものを作りたいと考えたから。<br>
　他のサロン予約サイトは、基本的に店のリストを見てお客さん側が選ぶものですが、Producteurでは逆で発想した。<br>
　お客さんの悩みを原点に、そこに対して店側がアプローチをするという図を想定して作った。<br>
 
## 工夫ポイント
　ただチャットをしてやりとりをするのではなく、一般ユーザーのつぶやきをみてそれに反応する形でのみ<br>
　直接メッセージ出来るようにした。<br>
　（他の予約サイトとの差別化、あくまでも一般ユーザーの悩みを起点にしたかったから）<br>
　先入観を持たないようにあえて互いの情報を最低限しか見れないようにしている。<br>
　（先入観なしで一個人同士でのやりとりをイメージしたため）<br>
　
## 課題や今後実装したい機能
　・viewをもっと見栄え良く、使いやすいデザインにする<br>
　・ユーザー検索機能<br>
　・他の予約サイトとの連携<br>
　・APIによるユーザー認証<br>
　、、、etc


