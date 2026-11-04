class SledDog < Formula
  desc "Inline GitHub pull request and build companion"
  homepage "https://github.com/badenb/sled-dog"
  version "1.0.1"

  depends_on :macos => :sequoia

  on_macos do
    on_arm do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.1/sled-dog-macos-arm64.tar.gz"
      sha256 "d52c9b2bb63185f71a45e2cecf911ce36696ab75799e8da4edb5bc5c8c2abeab"
    end
    on_intel do
      url "https://github.com/badenb/sled-dog/releases/download/v1.0.1/sled-dog-macos-x86_64.tar.gz"
      sha256 "7991f48abb7a80ee0c2c833385d942908b7fdbe983f7ca5853cd5db0177c80ef"
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
    assert_match "Sled Dog 1.0.1", shell_output("#{bin}/sled-dog --version")
    assert_match '"standalone": true', shell_output("#{bin}/sled-dog doctor --json")
  end
end
