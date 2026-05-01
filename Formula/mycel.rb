class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.2/bc_0.2.2_darwin_arm64.tar.gz"
      sha256 "f04075595088161dc820643a975332b96a97f68f2ea33c4a3da7e5a8dc67a8ba"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.2/bc_0.2.2_darwin_amd64.tar.gz"
      sha256 "60979e913442731434274e95601f076a08052eeccc2fe60867a5ff8aa6dfd556"
    end

    def install
      bin.install "bc" => "mycel"
    end
  end

  test do
    assert_match "mycel", shell_output("#{bin}/mycel --version")
  end
end
