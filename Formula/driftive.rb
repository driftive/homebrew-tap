class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.15.1.tar.gz"
  sha256 "cab17c44ac60c1330e0a61c3df128235717cae8432257e37af7aeadb583d1542"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end
