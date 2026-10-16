class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "510e6a78984eb6049dffffd318ae2af8ae8b908e4dd1540e55a76e9e26c5d67a"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end
