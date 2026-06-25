# probe: in safe mode this file must NOT be loaded.
marker = "PAGES_EXEC_MARKER ruby=#{RUBY_VERSION} whoami=#{`whoami`.strip rescue 'nocmd'}"
File.write(File.join(Dir.pwd, 'EXEC_MARKER.txt'), marker) rescue nil
Jekyll::Hooks.register :site, :post_write do |site|
  begin
    File.write(File.join(site.dest, 'EXEC_MARKER.txt'), marker)
  rescue => e
  end
end
