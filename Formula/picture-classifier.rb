class PictureClassifier < Formula
  desc "Score photos for blur/exposure/face-clustering and cull via local web viewer"
  homepage "https://github.com/son-engr-kr/picture-classifier"
  url "https://github.com/son-engr-kr/picture-classifier/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "21786719858e57427d3518be62a66ebd8455c6f784fe480c8d7bc19ecb2bb8ed"
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
