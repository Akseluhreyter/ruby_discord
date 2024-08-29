########################################################################
# Wireworld Valentine Challenge
# Objective: Implement Wireworld and create a Valentine circuit!
# Start Date: February 2, 2023
# End Date: February 14, 2023
########################################################################
class WireworldValentine
  EMPTY         = "🟪" # State 0
  ELECTRON_HEAD = "🟥" # State 1
  ELECTRON_TAIL = "⬜" # State 2
  CONDUCTOR     = "🟨" # State 3

  def initialize(rows:, cols:)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows) { Array.new(cols, EMPTY) }
  end

  def self.load(file)
    # parse the file data
    data =
      file
        .readlines(chomp: true)
        .map(&:chars)

    # create the game
    self
      .new(rows: data.length, cols: data[0].length)
      .tap { |game| game.instance_variable_set(:@grid, data) }
  end

  def display
    system("clear") || system("cls")

    puts @grid.collect(&:join)
  end

  ######################################################################
  # Implement the below method. Rules for Wireworld may be found on wiki
  # https://en.wikipedia.org/wiki/Wireworld
  ######################################################################
  def tick
    # Hint: mutate @grid
  end

  def run(steps=nil)
    (0..steps).each do
      display
      tick
      sleep 1
    end
  end
end

WireworldValentine.load(DATA).run
__END__
🟪🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬜🟥🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟪
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟨🟨🟨🟨🟪🟪🟪🟪🟪🟪🟪🟨🟨🟨🟨🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟥⬜🟪🟪🟪🟪🟪🟪🟥⬜🟪🟪🟪🟥⬜🟪🟪🟪🟪🟪🟪🟥⬜🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟨🟨🟨🟨🟨🟨🟪🟪🟪🟨🟪🟪🟪🟨🟨🟨🟨🟨🟨🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨
🟨🟪🟪🟨🟪🟪🟪🟪⬜🟥🟪🟪🟪🟪🟪🟪⬜🟥🟪🟪🟪⬜🟥🟪🟪🟪🟪🟪🟪⬜🟥🟪🟪🟪🟪🟨🟪🟪🟨
🟨🟪🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟪🟨
🟨🟪⬜🟪🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟪🟥🟪🟨
🟨🟪🟥🟪🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟪⬜🟪🟨
🟥🟪🟨🟪🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟪🟨🟪⬜
⬜🟪🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟪🟥
🟨🟪🟪🟨🟨🟪🟪🟪🟥⬜🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟥⬜🟪🟪🟪🟨🟨🟪🟪🟨
🟨🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪⬜🟥🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪⬜🟥🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟥⬜🟪🟪🟪🟪🟪🟪🟪🟥⬜🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟪🟪🟪🟪🟨🟪🟨🟪🟪🟪🟪🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪⬜🟥🟪🟪🟪🟨🟪🟪🟪⬜🟥🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟪🟪🟪🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨🟨🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟨🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟪🟨
🟪🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟥⬜🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟪
