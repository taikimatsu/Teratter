class Contact < ApplicationRecord

belongs_to :user
# replyが空かどうかでバリデーションをかける、空ならユーザー、違えば管理者。
validates :contact, presence: true, if: :is_user?
validates :reply, presence: true, unless: :is_user?

private
# ユーザーか否かを判断するメソッド。replyが空の場合はユーザーと判断し、contactにのみバリデーションが働く。
def is_user?
	self.reply.nil?
end

default_scope -> { order(created_at: :desc) }
end
