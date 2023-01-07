class MainApiController < ApplicationController
    require 'jwt'
    
    def token_en(payload)
        JWT.encode(payload, 'secret')
    end

    def token_creator
        auth_h=request.headers['Authorization']
        if auth_h
            token=auth_h.split(' ')[1]
            begin
                JWT.decode(token,'secret',true,algorithm:'HS256')
            rescue JWT::DecodeError  
                nil
            end
        end
    end
    
    def autho_customer
        decoded_token=token_creator()
        if decoded_token
            customer_id = decoded_token[0]['customer_id']
            @customer = Customer.find_by(id: customer_id)
        end
    end
    def auth_custom
        render json: { message: 'Before You must Sign In Or Sign Up!'}, status: :unauthorized unless
        autho_customer        
    end
end
