cask "aegisub-wangqr" do
  # HACK: Actual version numbers are overrated. :REWdako:
  version "r9198,20210418"

  # FIXME: Add sha256
  url "https://ftp.wangqr.tk/aegisub/aegisub-macos-#{version.after_comma}-#{version.before_comma}.dmg",
      verified: "ftp.wangqr.tk/aegisub/"
  name "Aegisub (wangqr)"
  desc "Wangqr Aegisub, #{version.before_comma}"
  homepage "https://github.com/wangqr/Aegisub"

  app "Aegisub.app"
end
