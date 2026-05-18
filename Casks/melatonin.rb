cask "melatonin" do
  version "1.5.6"
  sha256 "7c4490e726d3a8f26ba60053a5eec07d6d13d351e379ee1758f393a308ae218f"

  url "https://github.com/andrd3v/Melatonin/releases/download/v#{version}/Melatonin.pkg"
  name "Melatonin"
  desc "Fix overnight battery drain on macOS"
  homepage "https://github.com/andrd3v/Melatonin"

  depends_on macos: ">= :ventura"

  pkg "Melatonin.pkg"

  uninstall launchctl: "com.melatonin.daemon",
            quit:      "com.melatonin.helper",
            pkgutil:   [
              "com.melatonin.app",
              "com.melatonin.daemon",
            ],
            delete:    [
              "/Applications/Melatonin.app",
              "/Applications/Uninstall Melatonin.app",
            ]

  zap trash: [
    "~/Library/Preferences/com.melatonin.app.plist",
    "~/Library/Preferences/com.melatonin.helper.plist",
    "~/Library/Preferences/com.melatonin.daemon.plist",
    "/Library/Application Support/Melatonin",
  ]
end
