class CommitBot < Formula
  desc "PR writing tool for lazy developers using GPT"
  homepage "https://github.com/ElectricCactus/commit-bot"
  url "https://github.com/ElectricCactus/commit-bot/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "ed062b222df9e76107ecf525dda9414395f73beb3d309f24d3284dabb9b7a887"

  head "https://github.com/ElectricCactus/commit-bot.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7f413892fd6d7ce34a433fce860545fc3910892f59df6230ff3cb32eac973ab8"
  end

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
