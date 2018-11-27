class V1::VotesController < ApplicationController
    def index 
        # byebug
        # @ sign means global variable
        # variable trguments is each item in Topic table 
        @votes = Vote.all
        # last line is always returned
        render :index, status: :ok
    end

    def show
    end

    def create
        # new trgument set to equal new item in Trgument table taking in the params being created
        @vote = current_user.votes.new(vote_params)
        # save your new trgument once params go through
        @vote.save
        render :create, status: :created
    end

    def destroy 
        @vote = current_user.votes.where(id: params[:id]).first
        puts @vote
        puts current_user.id
        if @vote&.destroy
            head(:ok)
        else 
            head(:unprocessable_entity)
        end 
    end
    

# Anything after 'private' restricts the user from accessing the params -- keeps it secret
    private
    def vote_params
        params.require(:vote).permit(:user_id, :argument_id)
    end
end


