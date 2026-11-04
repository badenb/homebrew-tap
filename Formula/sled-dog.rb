class SledDog < Formula
  desc "Inline GitHub pull request and build companion"
  homepage "https://github.com/badenb/sled-dog"
  version "1.0.3"

  depends_on :macos => :sequoia

  on_macos do
    on_arm do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.3/sled-dog-macos-arm64.tar.gz"
      sha256 "fcf3011e375d16326bd85afd835fb6ed6539cf1348fbb2f2202adce173f662f6"
    end
    on_intel do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.3/sled-dog-macos-x86_64.tar.gz"
      sha256 "b9a5cac33a535a71556bd5cb9c9e445ef3b73ff801576e9cd99728c74feb40aa"
    end
  end

  def install
    libexec.install "sled-dog", "_internal"
    bin.install_symlink libexec/"sled-dog"
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  def caveats
    <<~EOS
      Connect GitHub: sled-dog auth login --host github.com
      View your work: sled-dog pr list --mine
      Early-access build: Developer ID signing/notarization is not configured.
    EOS
  end

  test do
    assert_match "Sled Dog 1.0.3", shell_output("#{bin}/sled-dog --version")
    assert_match '"standalone": true', shell_output("#{bin}/sled-dog doctor --json")
  end
end
