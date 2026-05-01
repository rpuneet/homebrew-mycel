class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.3/mycel_0.2.3_darwin_arm64.tar.gz"
      sha256 "12c464904fb2dde35861ae146fe4e40000af7064c7996ba9ab759015897e2dae"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.3/mycel_0.2.3_darwin_amd64.tar.gz"
      sha256 "69fac88840db970a0fb557d04e448ba45ecc453d1e267c104d1f5c2844333e9f"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    assert_match "mycel", shell_output("#{bin}/mycel --version")
  end
end
