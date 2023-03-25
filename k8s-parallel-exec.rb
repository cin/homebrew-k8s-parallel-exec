class K8sParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/k8s-parallel-exec"
  version "0.0.11"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-arm64.tgz"
      sha256 "e7ffdc635f2089975d55e278e3347015dec3b3e3db023e60ab7b09666204e787"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-amd64.tgz"
      sha256 "2f0f7cd43e4f3065756fde62876d9733567fc49689f96895dd406bdc97473c74"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-arm64.tgz"
      sha256 "06bde9fdf90db8c3bae5446a298d19546b23689411cd51ddd4e84df97c433cca"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-amd64.tgz"
      sha256 "270edc09e111a40b9817b989c560ba89264d70130fd4fd283cf5ce997935f53c"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "k8s-parallel-exec-darwin-arm64" => "k8s-parallel-exec"
      else
        bin.install "k8s-parallel-exec-darwin-amd64" => "k8s-parallel-exec"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "k8s-parallel-exec-linux-arm64" => "k8s-parallel-exec"
      else
        bin.install "k8s-parallel-exec-linux-amd64" => "k8s-parallel-exec"
      end
    end
  end

  test do
    system "#{bin}/k8s-parallel-exec", "--version"
  end
end
