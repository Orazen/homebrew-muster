cask "muster" do
  version :latest
  sha256 :no_check

  url "https://github.com/Orazen/Muster/releases/latest/download/Muster.dmg"
  name "Muster"
  desc "Local-first roster of AI agents — bring your own Claude, Codex, Grok CLI"
  homepage "https://muster.orazen.online"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Muster.app"

  zap trash: [
    "~/Library/Application Support/Muster",
    "~/Library/Preferences/in.muster.app.plist",
    "~/Library/Saved Application State/in.muster.app.savedState",
    "~/.muster",
  ]
end
