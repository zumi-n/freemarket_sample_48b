require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe ItemsController do
    let(:item) { create(:item) }
    let(:user) { create(:user) }

    describe 'GET #index' do
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end

      it "returns a 200 response" do
        get :index
        expect(response).to have_http_status "200"
      end
    end

    describe 'GET #show' do
      it "assigns the requested item to @item" do
        get :show, params: {id: item.id, user_id: user.id}
        expect(assigns(:item)).to eq @item
      end
        it "renders the :show template" do
        get :show, params: {id: item.id, user_id: user.id}
        expect(response).to render_template :show
      end
    end
  end
end
