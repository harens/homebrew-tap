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
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.3.1"
    cellar :any_skip_relocation
    sha256 "6e31ecb6428a71c0cc1b841d7480ecc8d2f76a9baf698daddead351c26770135" => :big_sur
    sha256 "93ab7dce9a6a5e79d9adccec1296e1448555e8a445dd364c8bb0182c478b24f3" => :catalina
    sha256 "4b1dbd2f5b5f3de9638da9592fac9f727c127cdecc9285946597bcca62f28bb4" => :x86_64_linux
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
