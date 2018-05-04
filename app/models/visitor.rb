class Visitor < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :account, :name, :email, :pw, presence: { message: "不可為空白" }

  validates :account, :email, uniqueness: { message: "重複了請修改" }

  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "請輸入正確的信箱格式" }, allow_blank: true

  validates :account, :pw, length: { in: 6..12 , message: "請輸入六到十二碼" }, allow_blank: true

  validates :name, length: { maximum: 5, message: "不可超過5個字"}

  validates :email, length: { maximum: 25, message: "不可超過25個字"}

  def self.find_visitor(hash)
    if hash.nil?
      "訪客 "
    else
      hash["name"]
    end
  end

  def self.find_visitor_account(hash)
    if hash.nil?
      "沒登入"
    else
      hash["account"]
    end
  end

  def serialize
    { "name" => name, "id"  => id, "account" => account }
  end

  def get_pw
    pw
  end
end
