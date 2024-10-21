# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  birthday        :date
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
    has_secure_password
    
    validates :name,
        presence: true,
        uniqueness: true,
        length: { maximum: 16 },
        format: {
            with: /\A[a-z0-9]+\z/,
            message: 'は小文字英数字で入力してください'
        }
    validates :password,
        length: { minimum: 8 }
    
    def age
        # 現在の日本時間を指す
        now = Time.zone.now
        # 現在の日付と誕生日の日付をint型に直し、現在の日付 - 誕生日の日付を表す
        # 結果を10000で割ることで年数を取得している
        #（日付を引き算した年数の部分のみを取得して月以下の部分を切り捨てるために10000としている）→5桁目から上の部分を取得している
        (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    end
end
