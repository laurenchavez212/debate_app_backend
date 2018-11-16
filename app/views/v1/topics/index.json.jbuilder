json.data do
    json.array! @topics do |topic|
             json.partial! 'v1/topics/topic', topic: topic
        end
end
