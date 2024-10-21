require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #new' do
        # beforeブロックではこのコントローラーアクションにGETのHTTPメソッドで擬似的にアクセスしている
        # これによってGETのリクエスト結果がresponseという変数に格納される
        before { get :new }

        it 'レスポンスコードが200であること' do
            expect(response).to have_http_status(:ok)
        end

        it 'newテンプレートをレンダリングすること' do
            expect(response).to render_template :new
        end

        it '新しいuserオブジェクトがビューに渡されること' do
            expect(assigns(:user)).to be_a_new(User)
        end
    end
end
