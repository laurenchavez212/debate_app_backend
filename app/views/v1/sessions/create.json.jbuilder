json.data do
    json.user do
        json.call(
            @user, 
            :email,
            :authentication_token,
            :image,
            :user_name,
            :id
        )
    end
end