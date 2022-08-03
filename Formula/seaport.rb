class Seaport < Formula
  include Language::Python::Virtualenv

  desc "More mighty port bump for MacPorts"
  homepage "https://github.com/harens/seaport"
  url "https://files.pythonhosted.org/packages/37/b4/195e55af17d9e019262df8bab54e0b1506f7e1c56d899694a3b1727ec01c/seaport-0.6.1.tar.gz"
  sha256 "d18350f07ab9466767e9d76e2d21275a56689a151768266dfae00a1de688b5ed"
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
  depends_on "python@3.10"

  resource "beartype" do
    url "https://files.pythonhosted.org/packages/26/e1/8323460360d73ca09f24384483c9facbf9f586928bdd9f0e80fdcc72dace/beartype-0.10.4.tar.gz"
    sha256 "24ec69f6a7f4e6e97af403d08de270def3248518060327095d23b1c4df64bf2a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  def install
    # Based on name-that-hash
    # https://github.com/Homebrew/homebrew-core/blob/9652b75b2bbaf728f70c50b09cce39520c08321d/Formula/name-that-hash.rb
    virtualenv_install_with_resources

    xy = Language::Python.major_minor_version Formula["python@3.10"].opt_bin/"python3"
    site_packages = "lib/python#{xy}/site-packages"
    pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
    (prefix/site_packages/"homebrew-seaport.pth").write pth_contents
  end

  test do
    expected = "#{name}, version #{version}"
    assert_match expected, shell_output("#{bin}/#{name} --version")

    system Formula["python@3.10"].opt_bin/"python3", "-c", <<~EOS
      import #{name}
      assert #{name}.__version__ == "#{version}"
    EOS
  end
end
