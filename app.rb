$: << File.join(File.dirname(__FILE__), "/lib/views")
load 'index.rb'
load 'done.rb'

def perform
  Index.new
end

perform
