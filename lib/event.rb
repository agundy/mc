class Event
  attr_reader :responsiblities

  def initialize(event_name)
    # load event config
    # register endpoint
  end

  def run
    # start logging
    # run command
  end

  private

  def setup_responsibilities
    @responsibilites = []
  end
end
