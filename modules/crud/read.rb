require 'json'

class Read
  def read_file(file)
    path = File.join(__dir__, '../../data', "#{file}.json")
    return [] unless File.exist?(path)

    data = JSON.parse(File.read(path))
    data.is_a?(Array) ? data : []
  end
end
