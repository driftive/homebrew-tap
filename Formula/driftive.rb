class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "b87373cb9788520b736dcb711d78d42808a062adfaced1f23de2a7c20e133e60"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end
