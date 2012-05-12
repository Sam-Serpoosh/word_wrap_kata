require './word_wrap'

describe "Word Wrap" do 

  it "does nothing for empty string" do 
    wrap("", 1).should == ""
  end

  it "does nothing for one char word" do 
    wrap("a", 1).should == "a"
  end

  it "doesn't wrap when word fit in column" do
    wrap("hello", 5).should == "hello"
  end

  it "wraps when word doesn't fit in column" do
    "hello".closest_char_to(' ', 3).should == -1
    wrap("hello", 3).should == "hel\nlo"
  end

  it "wraps multiple times when necessary" do
    wrap("hello", 2).should == "he\nll\no"
  end

  it "wraps at the space when space is at col" do 
    wrap("hello world", 6).should == "hello\nworld"
  end

  it "wraps when spece is exactly before col" do
    wrap("hello world", 7).should == "hello\nworld"
  end

  it "wraps when space is exactly after col" do
    wrap("hello world", 5).should == "hello\nworld"
  end

  it "wraps when space exist and string is longer than col" do
    wrap("sami serpoosh", 3).should == "sam\ni\nser\npoo\nsh"
  end

  it "wraps appropriately when a space can be included in a col" do
    wrap("hello world man", 11).should == "hello world\n man" 
  end 

  it "wraps when multiple spaces exist in the string" do
    wrap("I am sami I live in Tehran", 3).should == "I\nam\nsam\ni I\nliv\ne\nin\nTeh\nran"
  end

  def wrap(str, col)
    WordWrap.new(col).wrap(str)
  end

end


describe "Index Of char in String" do

  it "get index of character in string" do
    "hello world".index_of(' ').should == 5
  end

  it "returns -1 when next char of the specified index is that char" do
    "hello world man".closest_char_to(' ', 11).should == -1
  end

  it "returns -1 when specified index is equal to the string length" do
    "hello world".closest_char_to(' ', 11).should == -1
  end

  it "returns -1 when string doesn't contain specified char" do
    "hello".closest_char_to(' ', 3).should == -1
  end

  it "gets index of closest char to the specified index" do
    "hello world man, how you doing?".closest_char_to(' ', 13).should == 11
  end

  it "detect whether contains a char or not" do
    "hello".contains?(' ').should be_false
    "hello world".contains?(' ').should be_true
  end

end
