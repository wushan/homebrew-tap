cask "session-master" do
  version "0.2.5"
  sha256 "ea1ca3d38734e5d8924c738f5d74815b70c93a568163d0929df18923c8bff69b"

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
