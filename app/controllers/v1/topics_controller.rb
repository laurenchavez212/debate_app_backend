class V1::TopicsController < ApplicationController
    # These are methods(functions)
    # before_action :authenticate_user!
    def index 
        # byebug
        # @ sign means global variable
        # variable topics is each item in Topic table 
        @topics = Topic.all
        # last line is always returned
        render :index, status: :ok
    end

    def show

        @topic = Topic.find(params[:id])

        @arguments = Argument.where(topic_id: @topic.id)

        # render json: @topic, include: Argument.where(topic_id: @topic.id)
    end

    def create
        # new topic set to equal new item in Topic table taking in the params being created
        @topic = current_user.topics.build(topic_params)
        # save your new topic once params go through
        @topic.save
        render :create, status: :created
    end

    def destroy 
        @topic = current_user.topics.where(id: params[:id]).first
        if @topic.destroy
            head(:ok)
        else 
            head(:unprocessable_entry)
        end 
    end
    

# Anything after 'private' restricts the user from accessing the params -- keeps it secret
    private
    def topic_params
        params.require(:topic).permit(:title, :description, :user_id)
    end
end
