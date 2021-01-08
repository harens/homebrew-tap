class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/5e/e2/ca34db48fe59dc5ae23948f57978010757bc1b5ca8795ba477eec664e74a/seaport-0.3.1.tar.gz"
  sha256 "f2c892962a10b09144f91afecc4f7382a74e365b6ce0b500efc031a41dc26ee3"
  license "MIT"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.3.0"
    cellar :any_skip_relocation
    sha256 "c87318b61053385c2adbaba0a6ba25aab342a68f5255f4dec6e3c590ce981f9c" => :big_sur
    sha256 "2512c687bb10d5619424790e316c96d78599201b1c154a5ceb8662fba6761803" => :catalina
    sha256 "dca7794577da52fd83bc5509acf239d33dc999109d58e3c1c26e4697fad92457" => :x86_64_linux
  end

  depends_on "gh"
  depends_on "python@3.9"

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    expected = "#{name}, version #{version}"
    assert_match expected, shell_output("#{bin}/#{name} --version")
  end
end
