module Exceptions
  class ApiError < StandardError
    attr_accessor :status

    def initialize(status, message)
      super(message)
      @status = status
    end
  end
end
