class CommitBot < Formula
  desc "PR writing tool for lazy developers using GPT"
  homepage "https://github.com/ElectricCactus/commit-bot"
  url "https://github.com/ElectricCactus/commit-bot/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "ed062b222df9e76107ecf525dda9414395f73beb3d309f24d3284dabb9b7a887"

  head "https://github.com/ElectricCactus/commit-bot.git", branch: "main"

  depends_on "oven-sh/bun/bun" => :build

  bottle do
  end

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
