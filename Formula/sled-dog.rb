class SledDog < Formula
  desc "Inline GitHub pull request and build companion"
  homepage "https://github.com/badenb/sled-dog"
  version "1.0.0"

  depends_on :macos => :sequoia

  on_macos do
    on_arm do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.0/sled-dog-macos-arm64.tar.gz"
      sha256 "67af540d89e74522f555dbb1b553676898778c29bec858f574619807d4edccbf"
    end
    on_intel do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.0/sled-dog-macos-x86_64.tar.gz"
      sha256 "f00ccdc15e3cccce0eeae9268c9f0d8fcfcf13f11137295ccc3ea25effc8d78c"
    end
  end

  def install
    bin.install "sled-dog"
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
    assert_match "Sled Dog 1.0.0", shell_output("#{bin}/sled-dog --version")
    assert_match '"standalone": true', shell_output("#{bin}/sled-dog doctor --json")
  end
end
