json.data do
    json.array! @vote do |vote|
             json.partial! 'v1/votes/vote', vote: vote
        end
end