class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/31/74/ccc2c31a10b5a64534d4c61d1c66d83f2ca9a21f48c85bf5d82bd9d9ef2c/seaport-0.1.0.tar.gz"
  sha256 "90708e79efdaab238cbdfed350309147da74b3502eef84bbbdc780b1e1ea84ba"
  license "MIT"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.1.0"
    cellar :any_skip_relocation
    sha256 "45f15dffc59cdf7025c1506200b9b878c890b7b7b38a651c27789d90b4dec456" => :catalina
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
