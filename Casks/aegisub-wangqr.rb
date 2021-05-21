cask "aegisub-wangqr" do
  version "r9198,20210418"
  sha256 "284643ba458a61f80fea138a7820015999bcfac11fbaf36de1b16a0ae590ed34"

  url "https://ftp.wangqr.tk/aegisub/aegisub-macos-#{version.after_comma}-#{version.before_comma}.dmg",
      verified: "ftp.wangqr.tk/aegisub/"
  name "Aegisub (wangqr)"
  desc "Wangqr Aegisub, #{version.before_comma}"
  homepage "https://github.com/wangqr/Aegisub"

  app "Aegisub.app"
end
