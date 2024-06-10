class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "961c892491f35b453ad596c7324ebe2d646797a75ff6b66c2aefa6ca439e8050"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
ˇ
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end