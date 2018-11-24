
json.topic do
    json.title @topic.title
    json.description @topic.description
end

json.arguments do
    json.array! @arguments do |argument|
            json.partial! 'v1/topics/argument', argument: argument
        end
end