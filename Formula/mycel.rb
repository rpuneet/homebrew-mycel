class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.2/mycel_0.3.2_darwin_arm64.tar.gz"
      sha256 "8d7d3a2820f01f47dabbed4097f5853d6ff7923520e30dbaeb83ff0690509752"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.2/mycel_0.3.2_darwin_amd64.tar.gz"
      sha256 "26eb3662a9f17e81897deada1c8eac03bf0bd42ee8f11916ffd86c567856227d"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.2/mycel_0.3.2_linux_arm64.tar.gz"
      sha256 "06bf211cee5e11fb0a709519ac89dcc0685f20cff2a4fa9939a705e18a98ca49"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.2/mycel_0.3.2_linux_amd64.tar.gz"
      sha256 "7e0dc1a527ee74cb574c6420edc62bddc80e1d22a2092dea48337d51f0c9dce7"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
