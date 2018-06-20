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
Visitor.create(account: "000000", pw: "000000", name: "廖靜廷", email: "jintin@hotmail.com")
Visitor.create(account: "111111", pw: "111111", name: "吳啟全", email: "lee31620@hotmail.com")
Visitor.create(account: "222222", pw: "222222", name: "李天照", email: "wt11330@hotmail.com")
Visitor.create(account: "444444", pw: "444444", name: "張韻華", email: "cheng791112@hotmail.com")
Visitor.create(account: "555555", pw: "555555", name: "郭書欽", email: "guogogo@hotmail.com")


# 留言   留言的時間有些問題 先註解掉
=begin
Comment.delete_all
Visitor.find_by(account: "no_log_in").comments.create(content: "路過到此一遊")
Visitor.find_by(account: "000000").comments.create(content: "這網站也寫得太好了吧")
Visitor.find_by(account: "111111").comments.create(content: "網站的美術風格很簡潔又不失美感")
Visitor.find_by(account: "222222").comments.create(content: "你好,網站寫得不錯希望能繼續加油")
Visitor.find_by(account: "444444").comments.create(content: "網站功能還有些地方能補強一下")
Visitor.find_by(account: "555555").comments.create(content: "試試看留言功能而已")
Visitor.find_by(account: "no_log_in").comments.create(content: "網站寫得還行")
=end

# 投票系統
VoteLog.delete_all
Candidate.delete_all
Candidate.create(name: "宋隆龍", age: 54, party: "民主黨", politics: "就業提升")
Candidate.create(name: "張家豪", age: 39, party: "共和黨", politics: "民間參與")
Candidate.create(name: "陳建志", age: 45, party: "工黨", politics: "綠能產業")
Candidate.create(name: "廖朝清", age: 37, party: "社民黨", politics: "工業轉型")
Candidate.create(name: "李羽涵", age: 48, party: "保守黨", politics: "智慧科技")
