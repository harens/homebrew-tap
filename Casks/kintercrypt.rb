cask "kintercrypt" do
  version "0.2"
  sha256 "db0f572229c5ff884a2689e936a7a59c774fb0404cddc96cd8ffa3dfdfca6a51"

  url "https://github.com/harens/kintercrypt/releases/download/v#{version}/kintercrypt.dmg"
  appcast "https://github.com/harens/kintercrypt/releases.atom"
  name "kintercrypt"
  desc "Easy-to-use encryption program, built from the ground up"
  homepage "https://github.com/harens/kintercrypt"

  app "kintercrypt.app"
end
