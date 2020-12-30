class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/7d/2d/ab581275b79d3abc2d131a5599e0d12d7a9971660ffdf3fdb36a1b81962b/seaport-0.1.1.tar.gz"
  sha256 "53abdb317692e1b8b5932b020dca0012364cede147fbf85ebd43fb1d42092e6d"
  license "MIT"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.1.1"
    cellar :any_skip_relocation
    sha256 "053bed8e931ef62aac050ec13f6d48f93b06e56ffe5b305395c3fc70bdd2916d" => :big_sur
    sha256 "4b034edc61d294d924939590c79aacf8943a6b2cc3b0de7dac5527cf41cc09ab" => :catalina
    sha256 "f228fbf679c2d1465528c3fd8ec6cde8d6c0c44811101fc0b72d444defc1750b" => :x86_64_linux
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
