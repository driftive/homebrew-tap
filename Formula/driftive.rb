class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "84f4900029fbd722d7c6dad57eb3e7c823db2cee04f1825f3e3fc0c4e687de45"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end
