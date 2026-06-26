cask "session-master" do
  version "0.3.4"
  sha256 "9f1b985034448b00e9b600ea70d4adce2499bc869b92e5d4d78ba92764575a73"

  url "https://github.com/wushan/session-master/releases/download/v#{version}/SessionMaster-#{version}.dmg"
  name "SessionMaster"
  desc "Menu-bar console for Claude Code & Codex sessions"
  homepage "https://github.com/wushan/session-master"

  depends_on macos: :sonoma

  app "SessionMaster.app"

  postflight do
    # Self-signed (not notarized): drop the download quarantine so it launches cleanly.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SessionMaster.app"]
  end

  caveats <<~EOS
    On first launch, open the menu-bar icon -> Dashboard and grant Accessibility
    (System Settings -> Privacy & Security -> Accessibility) so SessionMaster can
    focus and move terminal windows.
  EOS
end
