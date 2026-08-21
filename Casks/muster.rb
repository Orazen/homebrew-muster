cask "muster" do
  version :latest
  sha256 :no_check

  url "https://github.com/Orazen/Muster/releases/latest/download/Muster.dmg"
  name "Muster"
  desc "Local-first roster of AI agents — bring your own Claude, Codex, Grok CLI"
  homepage "https://muster.orazen.online/"

  # No livecheck: it exists to track a real version number against
  # upstream releases, which is meaningless for `version :latest` (the URL
  # itself always resolves to the newest release) — `brew audit` flags the
  # combination as a style violation.

  depends_on macos: :big_sur

  app "Muster.app"

  # Belt-and-suspenders: Homebrew's app stanza already unquarantines what it
  # installs, but a broken/inconsistent ad-hoc signature (see the release
  # workflow's CSC_IDENTITY_AUTO_DISCOVERY fix for the real cause) can leave
  # Gatekeeper unhappy regardless of the quarantine flag. Strip it explicitly
  # so `brew install --cask muster` always ends in an openable app, with or
  # without a signed release.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Muster.app"],
                   sudo: false
  end

  zap trash: [
    "~/.muster",
    "~/Library/Application Support/Muster",
    "~/Library/Preferences/in.muster.app.plist",
    "~/Library/Saved Application State/in.muster.app.savedState",
  ]
end
