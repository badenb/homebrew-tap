class SledDog < Formula
  desc "Inline GitHub pull request and build companion"
  homepage "https://github.com/badenb/sled-dog"
  version "1.0.2"

  depends_on :macos => :sequoia

  on_macos do
    on_arm do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.2/sled-dog-macos-arm64.tar.gz"
      sha256 "f1e767ea1b6b1732a8b127b0c66edf772c3fe6de2b547604178a2a90b4a4f952"
    end
    on_intel do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.2/sled-dog-macos-x86_64.tar.gz"
      sha256 "90b33e3ceb4cf895c4c613f93b76f1e4d3bdde184a382b1b6b2f0a780fd4ef13"
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
    assert_match "Sled Dog 1.0.2", shell_output("#{bin}/sled-dog --version")
    assert_match '"standalone": true', shell_output("#{bin}/sled-dog doctor --json")
  end
end
