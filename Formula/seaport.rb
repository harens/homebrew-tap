class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/b4/55/95e2c681db5d92619f938379a376f5a1d6e9422ab132ef1a1b51b6f70812/seaport-0.2.0.tar.gz"
  sha256 "0b3d4fb2f2ff0ed0d45223b152f9cf6d75516753135dfdead702a27943fb94c7"
  license "MIT"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.2.0"
    cellar :any_skip_relocation
    sha256 "a582a421469be8ee9573b2226201a65962468f4c3063314c3f90a2a10abb6149" => :big_sur
    sha256 "b50fbd818b7a96e367a31af9dfd9dc824c5a38fe70e4002681e822d760cdab1c" => :catalina
    sha256 "5022f5df292c0c4376500bde3c087cad38e264e23772672c966087f2851c8f82" => :x86_64_linux
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
