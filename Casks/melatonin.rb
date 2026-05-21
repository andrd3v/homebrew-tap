cask "melatonin" do
  version "1.5.8"
  sha256 "cb00ced2401c57e9fe0e92bc25d62ddac6855e000482ac1b12ac941f5f701086"

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
