class WordWrap

  END_OF_LINE = "\n"

  def initialize(col)
    @col = col
  end

  def wrap str
    return str if str.length <= @col

    space_index = closest_space_to_col(str) 
    return wrap(str[1..str.length - 1]) if space_index == 0
    return wrap_text(str, space_index, 1) if space_index != -1 

    wrap_text(str, @col, 0)
  end

  def wrap_text(str, break_point, gap)
    str[0..break_point - 1] + END_OF_LINE + wrap(str[break_point + gap..str.length - 1])
  end 

  private

  def closest_space_to_col(str)
    str.closest_char_to(' ', @col)
  end

end

class String

  def closest_char_to(char, to_index)
    selected_part = self[0..to_index - 1]

    return -1 if !selected_part.contains?(char) ||
                 to_index == self.length ||
                 self[to_index].eql?(char)

    (to_index - 1) - selected_part.reverse.index_of(char)
  end

  def index_of(char)
    char_index = 0
    while char_index < self.length
      return char_index if self[char_index].eql?(char)
      char_index += 1
    end

    -1
  end

  def contains?(char)
    char_index = 0
    while char_index < self.length
      return true if self[char_index].eql?(char)
      char_index += 1
    end

    false
  end

end
