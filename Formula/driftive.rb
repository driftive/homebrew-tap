class Driftive < Formula
  desc "Driftive detects state drifts in Terragrunt projects"
  homepage "https://github.com/driftive/driftive"
  url "https://github.com/driftive/driftive/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "6ffce571757ce1479dec447ab6bed1fd08a4ca25a337360df85fa0a97a1d3e73"
  license "MIT"
  head "https://github.com/driftive/driftive.git", branch: "main"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"driftive"), "./main.go"
  end

end
