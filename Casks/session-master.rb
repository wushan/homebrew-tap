cask "session-master" do
  version "0.2.0"
  sha256 "ae2ffb0c7bae8f33cbac0cb99e3ae6329ed6d0856cb3424c69ac98fc6b54d9f8"

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
