class LibnetcfRuby < FPM::Cookery::RubyGemRecipe
  description ''

  name     'libnetcf-ruby'
  version  '0.0.2'
  revision '1'

  homepage 'https://github.com/raphink/netcf-ruby'
  license  'Apache'

  depends 'rubygem-nokogiri'
  build_depends 'rubygem-bundler', 'ruby-devel', 'netcf-devel', 'rpm-build'

  source 'http://github.com/norcams/netcf-ruby',
    :with => 'git',
    :tag => "#{version}-norcams"

  def build
    safesystem 'gem build ruby-netcf.gemspec'
  end

  def install
    safesystem "gem install --ingore-dependencies --no-rdoc --no-ri --bindir #{destdir}/usr/local/bin --installdir=#{destdir}/usr/local/share/gems equivalent-xml --version 0.5.1"
    safesystem "gem install --ignore-dependencies --no-rdoc --no-ri --bindir #{destdir}/usr/local/bin --installdir=#{destdir}/usr/local/share/gems ruby-netcf-#{version}.gem"
  end
end

