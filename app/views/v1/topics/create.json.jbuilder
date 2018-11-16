json.data do
    json.user do
        json.partial! 'v1/topics/topic', topic: @topic
    end
end
