require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  it_behaves_like "api_controller"

  describe "secure password" do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password) }

    it { expect(Customer.new({ email: "user@email.com", password: nil }).save).to be_falsey }
    it { expect(Customer.new({ email: "user@email.com", password: "foo" }).save).to be_falsey }
    it { expect(Customer.new({ email: "user@email.com", password: "af3714ff0ffae" }).save).to be_truthy }
  end

  let(:valid_attributes) {
    { firstname: "John", lastname: "Doe", email: "john.doe@example.com", password: "123456789" }
  }
  let(:invalid_attributes) {
    { firstname: nil, lastname: "Doe", email: "john.doe@example.com", password: "123456789" }
  }
  let(:invalid_attributes) {
    { firstname: "John", lastname: nil, email: "john.doe@example.com", password: "123456789" }
  }
  let(:invalid_attributes) {
    { firstname: "John", lastname: "Doe", email: nil, password: "123456789" }
  }
  let(:invalid_attributes) {
    { firstname: "John", lastname: "Doe", email: "john.doe@example.com", password: nil }
  }

  let!(:customer) { Customer.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all customers as @customers" do
      get :index, { format: :json }
      expect(assigns(:customers)).to eq([customer])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, { customer: valid_attributes, format: :json  }
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, { customer: valid_attributes, format: :json  }
        expect(assigns(:customer)).to be_a(Customer)
        expect(assigns(:customer)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved customer as @customer" do
        post :create, { customer: invalid_attributes, format: :json  }
        expect(assigns(:customer)).to be_a_new(Customer)
      end

      it "returns unprocessable_entity status" do
        put :create, { customer: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
   context "with valid params" do
     let(:new_attributes) {
       { firstname: "James", password: "234567890" }
     }

     it "updates the requested customer" do
       put :update, { id: customer.id, customer: new_attributes, format: :json  }
       customer.reload
       expect(customer.firstname).to eq("James")
       expect(customer.password).to eq("234567890")
     end

     it "assigns the requested customer as @customer" do
       put :update, { id: customer.id, customer: valid_attributes, format: :json  }
       expect(assigns(:customer)).to eq(customer)
     end
   end

   context "with invalid params" do
     it "assigns the customer as @customer" do
       put :update, { id: customer.id, customer: invalid_attributes, format: :json  }
       expect(assigns(:customer)).to eq(customer)
     end

     it "returns unprocessable_entity status" do
       put :update, { id: customer.id, customer: invalid_attributes, format: :json }
       expect(response.status).to eq(422)
     end
   end
 end

  describe "DELETE #destroy" do
   it "destroys the requested customer" do
     expect {
       delete :destroy, { id: customer.id, format: :json  }
     }.to change(Customer, :count).by(-1)
   end

   it "redirects to the customers list" do
     delete :destroy, { id: customer.id, format: :json  }
     expect(response.status).to eq(204)
   end
  end

  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "create new customer" do
  #       post :create, customer: attributes_for(:customer)
  #       expect(Customer.count).to eq(1)
  #     end
  #   end
  # end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
