class WebsocketWebmks < WebsocketSSLSocket
  attr_accessor :url

  def initialize(socket, model)
    super(socket, model)
    @url = URI::Generic.build(:scheme => 'wss',
                              :host   => @model.host_name,
                              :port   => @model.port,
                              :path   => "/ticket/#{@model.secret}").to_s
    @driver = WebSocket::Driver.client(self, :protocols => %w(binary))
    @driver.on(:message) { |msg| @buffer = msg.data }
    @driver.on(:close) { socket.close unless socket.closed? }
    @driver.start
  end

  def fetch(length)
    data = @ssl.sysread(length)
    @driver.parse(data)
    @buffer
  end

  def issue(data)
    @driver.binary(data)
  end

  def write(data)
    @ssl.syswrite(data)
  end
end
