require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

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
    it "responds successfully" do
      @items = create(:item)
      get :show, params: { id: @items.id}
      expect(response).to be_success
    end
    it "returns a 200 response" do
      get :show, params: { id: @items.id }
      expect(response).to have_http_status "200"
    end
  end

end
