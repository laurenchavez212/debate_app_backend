
json.topic do
    json.title @topic.title
    json.description @topic.description
    json.id @topic.id
    json.user_id @topic.user_id
    json.image @topic.image
    
end

json.arguments do
    json.array! @arguments do |argument|
            json.partial! 'v1/topics/argument', argument: argument

                    json.votes do
                        json.array! argument.votes.each do |vote|
                    json.partial! 'v1/topics/vote', vote: vote
                end
            end
        end
end

