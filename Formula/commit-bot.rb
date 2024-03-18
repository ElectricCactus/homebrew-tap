class CommitBot < Formula
  desc "PR writing tool for lazy developers using GPT"
  homepage "https://github.com/ElectricCactus/commit-bot"
  url "https://github.com/ElectricCactus/commit-bot/archive/refs/heads/main.tar.gz"
  version "0.0.1"
  sha256 "86b6e48ec51031451f35bfce2f428c2456225a55ea11a3cb56592c7ec0646a6a"

  head "https://github.com/ElectricCactus/commit-bot.git", branch: "main"

  depends_on "oven-sh/bun/bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "compile"
    libexec.install "bin"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/commit-bot", "--version"
  end
end
