require 'json'

class Ascii_Output
  def initialize(input)
    art = JSON.parse(File.read("data/ascii_art.json")).select { |item| item["name"] == input }
    # I'm up to here!! ^^
    @color = art["color-code".to_s]
    @file_name = art["file"]
  end

  def display
    print "\e[01;#{@color}m"
    File.open("data/"+@file_name).each do |line|
      print "#{line}"
      sleep(0.1)
    end
    print "\e[0m"
  end

end