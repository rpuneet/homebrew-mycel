class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.0/mycel_0.4.0_darwin_arm64.tar.gz"
      sha256 "ce42d8120304315d2656de55320df69e816c4b4f11251b6e331ec764522b74b8"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.0/mycel_0.4.0_darwin_amd64.tar.gz"
      sha256 "8eb1e89fa04736d1dd6004dbd54c0e9045fde33183377a3014d1d56a43ec8978"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.0/mycel_0.4.0_linux_arm64.tar.gz"
      sha256 "44d95c3a93c5b3a3f8a8f43195a6794e3d4bbe4274acd190b5b2efee753c7052"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.0/mycel_0.4.0_linux_amd64.tar.gz"
      sha256 "65a49ad4898210fd6d5628b114700fb62ff89cff6537620c1c2f0926d5ae3d9d"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
