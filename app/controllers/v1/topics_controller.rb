class V1::TopicsController < ApplicationController
    # These are methods(functions)
    before_action :authenticate_user!
    def index 
        # @ sign means global variable
        # variable topics is each item in Topic table 
        @topics = Topic.all
        # last line is always returned
        render json: @topics, status: :ok
    end

    def create
        # new topic set to equal new item in Topic table taking in the params being created
        @topic = Topic.new(topic_params)
        # save your new topic once params go through
        @topic.save
        render json: @topic, status: :created
    end

    def destroy 
        @topic = Topic.where(id: params[:id]).first
        if @topic.destroy
            head(:ok)
        else 
            head(:unprocessable_entry)
        end 
    end
    

# Anything after 'private' restricts the user from accessing the params -- keeps it secret
    private
    def topic_params
        params.require(:topic).permit(:title, :description)
    end
end
