class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/9d/95/afefc09993c0e4fa4d79bac54617ebe1f7f4173c56463a27d57c7b37d6c4/seaport-0.5.0.tar.gz"
  sha256 "485b46626f0d8592683cf7892f9959181d50615ebc5f5587d4ed7b38a5cce97e"
  license "BSD-3-Clause"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "f9a8289fb4e336d6d19a4857c44e264a1e97643cb78e31b023988d701fb81485"
    sha256 cellar: :any_skip_relocation, catalina:     "c13be73240c3633b2427511fc2718f5c96d4c754bab51b7b15b22dd41de7aa4d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b944237db9fd5f1ca2cb3167ec4ccace8b461705c61e5e3cc3c336039ce9f5ae"
  end

  depends_on "gh"
  depends_on "python@3.9"

  resource "beartype" do
    url "https://files.pythonhosted.org/packages/c7/a8/7154f5dbf53553d244220a2c2736851dd22b60d85e59967a632795c17db6/beartype-0.6.0.tar.gz"
    sha256 "f6167aaa2691db46669f1c2e2aa1f2c38f456fe8a669fe9d3f2af6ed97d083ec"
  end

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
