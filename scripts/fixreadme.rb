#!/usr/bin/env ruby
# frozen_string_literal: true

current_ver = `git ver`
src = 'src/README.md'
dest = 'README.md'

readme = IO.read(src).force_encoding('ASCII-8BIT').encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')

content = readme.match(/(?<=\<!--README-->)(.*?)(?=\<!--END README-->)/m)[0]

content.gsub!(/<!--VER-->(.*?)<!--END VER-->/, current_ver)
content.gsub!(/<!--GITHUB-->(.*?)<!--END GITHUB-->/m, '\1')
content.gsub!(/<!--JEKYLL(.*?)-->/m, '')

File.open(dest, 'w') { |f| f.puts(content) }

Process.exit 0
