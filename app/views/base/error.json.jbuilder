json.errors(@errors) do |error|
  @errors[error].map do |message|
    json.message message
    json.field error
    # json.source do
    #   json.pointer "data/attributes/#{error}"
    # end
  end
end