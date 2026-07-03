class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.8/mycel_0.3.8_darwin_arm64.tar.gz"
      sha256 "f217f177f470318745ee2c50f2dfd1969e7cbdb0b30bc2fdc5ac20f6e1c3d047"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.8/mycel_0.3.8_darwin_amd64.tar.gz"
      sha256 "c15ff98211bfa02a97ecb84b08cd08c7485f51aac6071013333a76d496f93a8a"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.8/mycel_0.3.8_linux_arm64.tar.gz"
      sha256 "2befe857955c707c13496386a80fcaffb8121d46d772a078d03553b306b32587"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.8/mycel_0.3.8_linux_amd64.tar.gz"
      sha256 "0d554b780f448c640566431926ae9127a237ec9e123203afd60226e835b424af"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
