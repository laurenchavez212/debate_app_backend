json.data do
    json.user do
        json.partial! 'v1/votes/vote', vote: @vote
    end
end
