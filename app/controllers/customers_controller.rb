class CustomersController < MainApiController
    def create
        @customer = Customer.create(customer_params)
        if @customer.save && @customer.valid?
            token = token_en({customer_id: @customer.id})
            puts(token)
            puts(@customer)
            @customer.update!(
                :confirmed_at => token  
            )
            render json: { customer: @customer, token: token,status: 'Registred Succesfully!'}, status: :ok
            
            
        else
            render json: { error: @customer.errors.full_messages }, status: :bad_request
        end
    end
    def login
        @customer = Customer.find_by(username: customer_params[:username])
        if @customer && @customer.authenticate(customer_params[:password])
            token = token_en( {customer_id: @customer_id})
            render json: {customer: @customer, token:token, status: 'Logged in successfully'},status: :ok
        else
            render json: { error: 'Invalid username / password' }, status: :bad_request
        end
    end
      
    private
      
    def customer_params
        params.require(:customer).permit(:username, :email, :password, :password_confirmation, :phone_number)
    end
end
