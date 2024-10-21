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
require 'rails_helper'

RSpec.describe User, type: :model do
  # 何をテストするのかのテストの対象を記載(一般的には#メソッド名)
  describe '#age' do
    # berforeブロック内でtimezoneなどの挙動を変更することができる
    before do
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2024/04/01'))
    end
    # どういう条件下で行うテストであるかを書く
    context '20年前の生年月日の場合' do
      # 上記contextが表すユーザーを定義
      let(:user) {User.new(birthday: Time.zone.now - 20.years) }
      # 最終的にどういう状況であるのが正しいのかをテストする
      it '年齢が20歳であること' do
        # expectの中にはテスト対象とするメソッドの呼び出しなどを記載する
        expect(user.age).to eq 20
      # 'eq'等の記載はマッチャーと呼ぶ（検索するときはexpect　マッチャーと記載する）
      end
    end
    context '10年前に生まれた場合でちょうど誕生日の場合' do
      # 上記contextが表すユーザーを定義
      let(:user) {User.new(birthday: Time.zone.parse('2014/04/01')) }
      # 最終的にどういう状況であるのが正しいのかをテストする
      it '年齢が10歳であること' do
        # expectの中にはテスト対象とするメソッドの呼び出しなどを記載する
        expect(user.age).to eq 10
        # 'eq'等の記載はマッチャーと呼ぶ（検索するときはexpect　マッチャーと記載する）
      end
    end
    context '10年前に生まれた場合誕生日が来ていない場合' do
      # 上記contextが表すユーザーを定義
      let(:user) {User.new(birthday: Time.zone.parse('2014/04/02')) }
      # 最終的にどういう状況であるのが正しいのかをテストする
      it '年齢が9歳であること' do
        # expectの中にはテスト対象とするメソッドの呼び出しなどを記載する
        expect(user.age).to eq 9
        # 'eq'等の記載はマッチャーと呼ぶ（検索するときはexpect　マッチャーと記載する）
      end
    end
  end
end
