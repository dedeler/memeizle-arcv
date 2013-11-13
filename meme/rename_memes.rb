#!/usr/bin/env ruby

match = Dir.glob('memeizle_*').sort.last.match(/_(.+?)\.gif/)
start_id = index = (match[1].to_i) + 1

# rename only new ones
Dir.glob('*.gif').reject{|f| f['memeizle_']}.each{|filename| File.rename(filename, 'memeizle_' + index.to_s + '.gif') && index+=1}

# print urls
puts '==========================================='
(start_id..index-1).each{|id| puts 'http://dedeler.github.io/memeizle-arcv/meme/memeizle_'+id.to_s+'.gif'}
puts '==========================================='
puts 'NOW GOTO: http://memeizle.com/upload.html'
puts 'ONLY ADD URLS AFTER YOU SUCCESSFULLY ADD TO REPO'
puts '==========================================='
