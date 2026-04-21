class Pulse < Formula
  desc "System health monitoring and cache cleanup for macOS developers"
  homepage "https://github.com/kin0kaze23/pulse"
  url "https://github.com/kin0kaze23/pulse.git",
      branch: "phase0-hardening",
      revision: "8fe119f14ef72b4ced0a1e0e3c45d866dc0319e5"
  license "MIT"
  head "https://github.com/kin0kaze23/pulse.git", branch: "main"

  depends_on xcode: ["15.0", :build]

  def install
    # Build PulseCore and PulseCLI targets only (avoid Pulse app target)
    system "swift", "build",
           "--target", "PulseCore",
           "--target", "PulseCLI",
           "-c", "release",
           "--build-path", buildpath/".build"

    # Find the binary
    bin.install buildpath/".build/release/PulseCLI" => "pulse"

    # Install shell completions
    (zsh_completion/"_pulse").write Utils.safe_popen_read(bin/"pulse", "completion", "zsh")
    (bash_completion/"pulse").write Utils.safe_popen_read(bin/"pulse", "completion", "bash")
  end

  def caveats
    <<~EOS
      Pulse CLI is installed. Run `pulse doctor` to verify your setup.

      For shell completion, add to your shell config:
        Zsh:  fpath+=#{zsh_completion} && compinit
        Bash: source #{bash_completion}/pulse
    EOS
  end

  test do
    assert_match "Pulse CLI", shell_output("#{bin}/pulse --version")
    assert_match "analyze", shell_output("#{bin}/pulse --help")
  end
end
