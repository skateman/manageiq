class WebsocketRight
  def initialize(socket, model)
    @sock = socket
    @model = model
  end

  def fetch(_length)
    raise NotImplementedError, 'This should be defined in a subclass'
  end

  def issue(_data)
    raise NotImplementedError, 'This should be defined in a subclass'
  end
end
