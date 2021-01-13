class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/eb/ba/ff03dabc68bd7577eeef257ef44ff678faf872d8e792a81b8d35e16c4390/seaport-0.4.0.tar.gz"
  sha256 "e09a9a1cd6d096ee821b7f25972158d59f14f4252da10eef1a8f8689c164c478"
  license "BSD-3-Clause"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.4.0"
    cellar :any_skip_relocation
    sha256 "593dc4f0d8d60a4fa93494ec570507dc116916302b45a6402469d9bbb2aa6837" => :big_sur
    sha256 "5d197a0195d10fd15325d9ef655d52063e01b64be2e535447c4909b0d3e19651" => :catalina
    sha256 "cf298f5c9862ad4de4b04e7f9428f01f08c78558a81a8a0abf99db36bb6c028c" => :x86_64_linux
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
