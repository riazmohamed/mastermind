# frozen_string_literal: true

# This class adds support for colorful strings.
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

# This class makes Mastermind game objects.
class Mastermind
  # TODO: Remove access at some point! Using the secret_code reader for testing.
  attr_reader :secret_code

  def initialize
    @secret_code = generate_random_code
    @current_guess = []
    # Previous guess arrays will be stored as elements of of an array so the
    # guess history can be displayed.
    @guess_history = []
    # Or should I just track the number of guesses?
    @guesses_remaining = 12
  end

  def generate_random_code
    [pick_a_color, pick_a_color, pick_a_color, pick_a_color]
  end

  def pick_a_color
    case rand(1..7)
    when 1
      '0'.red
    when 2
      '0'.green
    when 3
      '0'.yellow
    when 4
      '0'.blue
    when 5
      '0'.pink
    when 6
      '0'.light_blue
    when 7
      ' '
    end
  end

  def display(display_array = [' ', ' ', ' ', ' '], feedback_array = [' ', ' ', ' ', ' '])
    # TODO: Add code to call the not yet made method to display the guess
    #   history (if there is one) whenever this method is called.

    puts '-' * 14
    puts "|#{display_array[0]}|#{display_array[1]}|#{display_array[2]}|#{display_array[3]}|#{feedback_array[0]}#{feedback_array[1]}#{feedback_array[2]}#{feedback_array[3]}|"
    puts '-' * 14
  end
end

test_game = Mastermind.new
# To test the display we are displaying the secret pattern generated.
test_game.display(test_game.secret_code)
test_game.display