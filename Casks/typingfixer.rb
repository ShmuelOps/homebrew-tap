cask "typingfixer" do
  version "0.7.0"
  sha256 "e8d11cce233fc757cbf00237d78db2b963f94fd18e5735ffe2fa43222d9c014f"

  url "https://github.com/ShmuelOps/typingfixer/releases/download/v#{version}/TypingFixer-#{version}.dmg"
  name "TypingFixer"
  desc "Fixes Hebrew/English text typed in the wrong keyboard layout"
  homepage "https://github.com/ShmuelOps/typingfixer"

  depends_on macos: :ventura

  app "TypingFixer.app"

  # Self-signed, not notarized: clear quarantine so it opens, then point at the Accessibility pane.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/TypingFixer.app"]
    system_command "/usr/bin/open", args: ["x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"]
  end

  uninstall quit: "io.github.shmuelops.typingfixer"

  zap trash: "~/Library/Preferences/io.github.shmuelops.typingfixer.plist"

  caveats "Enable TypingFixer in System Settings → Privacy & Security → Accessibility."
end
