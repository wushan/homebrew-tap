cask "session-master" do
  version "0.5.5"
  sha256 "b51626feeb3ef641ab67f47ee34c2bf522513c25b3ddfd7bf0a2eba027653031"

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
