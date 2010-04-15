Gem::Specification.new do |s|
  s.name              = "subtle-graph"
  s.summary           = "Dynamic icons which represent different kinds of graphs."
  s.version           = "0.0.2"
  s.author            = "Dominik Honnef"
  s.email             = "dominikho@gmx.net"
  s.date              = Date.today.to_s
  s.homepage          = ""

  s.has_rdoc = 'yard'

  s.required_ruby_version = '>= 1.9.1'

  s.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE*']
  # s.executables = [""]
end
