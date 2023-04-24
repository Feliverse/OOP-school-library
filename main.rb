require_relative 'run'

class Main
  def runner
    run = Run.new
    run.main
  end
end

main = Main.new

main.runner
