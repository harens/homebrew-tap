class LmcRunner < Formula
  include Language::Python::Virtualenv

  desc "Run LMC assembly code from the command-line"
  homepage "https://github.com/dhruvnps/lmc-runner"
  url "https://files.pythonhosted.org/packages/6c/4d/af52ab2f1f41c45da022f896a53144ca679156e8203ccdfc5622507a8965/lmc-runner-0.0.3.tar.gz"
  sha256 "99ff75fffc7de492785f9956b3aa08d8f3571c9eb55bafee24474bc7be08d152"
  license "Apache-2.0"
  head "https://github.com/dhruvnps/lmc-runner.git"

  livecheck do
    url :stable
  end

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Generate a random integer between 1 and 100
    # Runs a file that outputs that integer
    number = rand(100)
    (testpath/"test.txt").write <<~EOS
      LDA ONE
      OUT
      HLT
      ONE     DAT #{number}
    EOS
    assert_match "#{number}\n", shell_output("#{bin}/lmc-runner test.txt")
  end
end
