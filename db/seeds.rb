# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 訪客
Visitor.delete_all
Visitor.create(account: "no_log_in", pw: "aw10401", name: "訪客", email: "daisycheng@hotmail.com")
Visitor.create(account: "000000", pw: "ahj10401", name: "廖靜廷", email: "jintin@hotmail.com")
Visitor.create(account: "aa10403", pw: "aahj10401", name: "吳啟全", email: "lee31620@hotmail.com")
Visitor.create(account: "aa10404", pw: "ahja10401", name: "李天照", email: "wt11330@hotmail.com")
Visitor.create(account: "aa10405", pw: "aahj10401", name: "張韻華", email: "cheng791112@hotmail.com")
Visitor.create(account: "aa10406", pw: "aafe401", name: "郭書欽", email: "guogogo@hotmail.com")


# 留言
Comment.delete_all
Visitor.find_by(account: "no_log_in").comments.create(content: "路過到此一遊")
Visitor.find_by(account: "aa10403").comments.create(content: "這網站也寫得太好了吧")
Visitor.find_by(account: "aa10404").comments.create(content: "網站的美術風格很簡潔又不失美感")
Visitor.find_by(account: "aa10405").comments.create(content: "你好,網站寫得不錯希望能繼續加油")
Visitor.find_by(account: "aa10406").comments.create(content: "網站功能還有些地方能補強一下")
Visitor.find_by(account: "no_log_in").comments.create(content: "試試看留言功能而已")
Visitor.find_by(account: "aa10403").comments.create(content: "網站寫得還行")


# 投票系統

VoteLog.delete_all
Candidate.delete_all
Candidate.create(name: "宋隆龍", age: 54, party: "民主黨", politics: "就業提升")
Candidate.create(name: "張家豪", age: 39, party: "共和黨", politics: "民間參與")
Candidate.create(name: "陳建志", age: 45, party: "工黨", politics: "綠能產業")
Candidate.create(name: "廖朝清", age: 37, party: "社民黨", politics: "工業轉型")
Candidate.create(name: "李羽涵", age: 48, party: "保守黨", politics: "智慧科技")
