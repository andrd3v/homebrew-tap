cask "melatonin" do
  version "1.5.5"
  sha256 "9b21d7e2a5f0087035567c559433a79420e18d81113f53a7a2bd79e05f55d3f5"

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
