cask "trader-workstation@stable" do
  arch arm: "-arm", intel: "x-x64"

  version "10.45.1j"
  sha256 "86c1c568afda4ae866d585663bdf890e5fd83d5ac095701f251eb6cd13ec404c"

  url "https://download2.interactivebrokers.com/installers/tws/stable/tws-stable-macos#{arch}.dmg"
  name "Trader Workstation (Stable)"
  desc "Trading software"
  homepage "https://www.interactivebrokers.com/"

  livecheck do
    url "https://download2.interactivebrokers.com/installers/tws/stable/version.json"
    regex(/"buildVersion"\s*:\s*"([^"]+)"/i)
  end

  auto_updates true
  conflicts_with cask: "trader-workstation"
  depends_on :macos

  installer script: {
    executable: "#{staged_path}/Trader Workstation Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       [
      "-dir", "#{appdir}/Trader Workstation",
      "-q"
    ],
  }

  uninstall_preflight do
    ohai "Stopping all running instances of Trader Workstation prior to uninstall"
    system_command "/usr/bin/pkill", args: ["-f", "#{appdir}/Trader Workstation/Trader Workstation.app"]
  rescue RuntimeError
    ohai "No running instances of Trader Workstation found"
  end

  uninstall quit:   "com.install4j.5889-6375-8446-2021",
            script: {
              executable: "#{appdir}/Trader Workstation/Trader Workstation Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  zap trash: [
    "#{appdir}/Trader Workstation",
    "~/Applications/Trader Workstation",
    "~/Jts",
    "~/Library/Application Support/Trader Workstation",
  ]
end
