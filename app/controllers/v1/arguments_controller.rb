class V1::ArgumentsController < ApplicationController
    def index 
        # byebug
        # @ sign means global variable
        # variable trguments is each item in Topic table 
        @argument = Argument.all
        # last line is always returned
        render :index, status: :ok
    end

    def show
        
    end 

    def create
        # new trgument set to equal new item in Trgument table taking in the params being created
        @argument = Argument.new(argument_params)
        # save your new trgument once params go through
        @argument.save
        render :create, status: :created
    end

    def destroy 
        @argument = current_user.arguments.where(id: params[:id]).first
        if @argument.destroy
            head(:ok)
        else 
            head(:unprocessable_entry)
        end 
    end
    

# Anything after 'private' restricts the user from accessing the params -- keeps it secret
    private
    def argument_params
        params.require(:argument).permit(:user_id, :topic_id, :content, :link, :stance)
    end
end
