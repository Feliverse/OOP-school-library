require 'json'
require 'fileutils'

class Update
  def write_file(file, data)
    path = File.join(__dir__, '../../data', "#{file}.json")

    FileUtils.mkdir_p('./data')

    File.write(path, JSON.pretty_generate(data))
  end
end