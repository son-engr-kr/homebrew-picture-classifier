class PictureClassifier < Formula
  desc "Score photos for blur/exposure/face-clustering and cull via local web viewer"
  homepage "https://github.com/son-engr-kr/picture-classifier"
  url "https://github.com/son-engr-kr/picture-classifier/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "6da3ef81eb3037d416a589115df00df4156869d36863ace643fc40ebb57c170e"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv_dir = libexec/"venv"
    system Formula["python@3.12"].opt_libexec/"bin/python", "-m", "venv", venv_dir
    system venv_dir/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv_dir/"bin/pip", "install", buildpath
    bin.install_symlink venv_dir/"bin/pcls"
  end

  test do
    assert_match "Picture classifier", shell_output("#{bin}/pcls --help")
  end
end
