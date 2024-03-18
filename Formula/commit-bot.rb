class CommitBot < Formula
  desc "A PR writing tool for lazy developers using GPT."
  homepage "https://github.com/ElectricCactus/commit-bot"
  
  depends_on "oven-sh/bun/bun" => :build

  version "0.0.1"
  
  url "https://github.com/ElectricCactus/commit-bot/archive/refs/heads/main.zip"
  head "https://github.com/ElectricCactus/commit-bot.git", branch: "main"

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "compile"
    libexec.install Dir["bin"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/commit-bot", "--version"
  end
end
