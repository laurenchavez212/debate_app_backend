json.data do
    json.array! @argument do |argument|
             json.partial! 'v1/arguments/argument', argument: argument
        end
end