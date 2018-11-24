json.data do
    json.user do
        json.partial! 'v1/arguments/argument', argument: @argument
    end
end
