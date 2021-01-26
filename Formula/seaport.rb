class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/40/93/fc2e59ec4346b78876b625211f38ed1dcf444728aac69fc79def6091e0c3/seaport-0.4.1.tar.gz"
  sha256 "05ffeed3e4159bf11fddc450d2d755e0016b8ae5f85307a500e3cb25635018ef"
  license "BSD-3-Clause"
  head "https://github.com/harens/seaport.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/harens/homebrew-tap/releases/download/seaport-0.4.1"
    cellar :any_skip_relocation
    sha256 "17700afdd3ce62b7c033defaeb741e56762980d221327e918d55b06c872fa98c" => :big_sur
    sha256 "269a5793934ef3007f37ef4b3a01e47a6a89b29fb353fb3a3565bc92ac89c594" => :catalina
    sha256 "d9fad9cd85f7b46e868f24614cc0f1aeccd73e3624669296894914e6840a7c92" => :x86_64_linux
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
