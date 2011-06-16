require 'date'
Gem::Specification.new do |s|
  s.name = %q{auxiliary_addons}
  s.version = "0.5.2"
  s.date = Date.today.to_s
  s.summary = %q{AuxiliaryAddons is a gem that contains basic helpers.}
  s.description = %q{AuxiliaryAddons is a gem that contains basic helpers.}
  s.author = %q{Artem Rufanov}
  s.email = %q{developers@majoron.com}
  s.homepage = %q{http://www.majoron.com/}
  s.files = Dir.glob('**/*') - Dir.glob('distrib/**/*') - Dir.glob('lib/api/**/*') - Dir.glob('doc/*.xpr')
  s.bindir = 'bin'
  s.executables = Dir.glob('bin/*').collect {|f| File.basename(f)}
  s.require_paths << 'doc' << 'examples' << 'lib' << 'test'
  s.has_rdoc = true
  s.required_ruby_version = '>= 1.8.7'
end
