###############################################################################
# Title:  Wireworld Valentine Challenge Solution
# Author: 143crimson
# Date:   02/15/2024
###############################################################################
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

  # Implement this method.
  def tick
    new_grid = Array.new(@rows) { Array.new(@cols, EMPTY) }

    @rows.times do |i|
      @cols.times do |j|
        new_grid[i][j] =
          case @grid[i][j]
          when EMPTY         then EMPTY
          when ELECTRON_HEAD then ELECTRON_TAIL
          when ELECTRON_TAIL then CONDUCTOR
          when CONDUCTOR
            if count_live_neighbors(i, j).between?(1, 2)
              ELECTRON_HEAD
            else
              CONDUCTOR
            end
          end
      end
    end
      
    @grid = new_grid
  end

  def count_live_neighbors(row, col)
    count = 0

    (-1..1).each do |i|
      (-1..1).each do |j|
        neighbor_row = (row + i).clamp(0, @rows-1)
        neighbor_col = (col + j).clamp(0, @cols-1)
        
        count += 1 if @grid[neighbor_row][neighbor_col] == ELECTRON_HEAD
      end
    end

    # Exclude the center cell before returning 
    count -= 1 if @grid[row][col] == ELECTRON_HEAD

    count
  end

  def run(steps=nil)
    (0..steps).each do
      display
      tick
      sleep 1
    end
  end
end

WireworldValentine.load(DATA).run(30)
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
