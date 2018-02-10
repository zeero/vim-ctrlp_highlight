PATTERN = /template/
CAPITAL_PATTERN = /Template/

task :rename do
  name = ENV['name']
  unless name
    puts 'Usage: rake name=your_plugin_name'
    next
  end

  Dir.glob('**/*template*') do |filename|
    File.open(filename, 'r') do |infile|
      File.open(filename.sub(PATTERN, name), 'w') do |outfile|
        outfile.puts infile.read.gsub(CAPITAL_PATTERN, name.capitalize).gsub(PATTERN, name)
      end
    end
    File.delete filename
  end

  buffer = File.open('README.md', 'r') { |f| f.read.gsub(CAPITAL_PATTERN, name.capitalize).gsub(PATTERN, name) }
  File.open('README.md', 'w') { |f| f.puts buffer }
end

task default: :rename

