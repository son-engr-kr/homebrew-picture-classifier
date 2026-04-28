class PictureClassifier < Formula
  desc "Score photos for blur/exposure/face-clustering and cull via local web viewer"
  homepage "https://github.com/son-engr-kr/picture-classifier"
  url "https://github.com/son-engr-kr/picture-classifier/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "fc208eebf8d961081f0fc5ba30d8f7b09294a3d755bed1d7fb70167769d61d66"
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
