class K8sParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/k8s-parallel-exec"
  version "0.0.9"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-arm64.tgz"
      sha256 "ab7b812bc0bdadc51030e5194bbf8cd94d68ce3ae27767eb345bf4f593e52e65"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-amd64.tgz"
      sha256 "16c91d926e1246d9f53e755f3d4001f798d3b42c6f0b59a90e50ec56827909bb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-arm64.tgz"
      sha256 "58b2ff3be85147fcfa967a0716b58ba18948e882b7f7ef91e38bc529cb6db320"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-amd64.tgz"
      sha256 "0dca01695376fbf045c3fccf05d549fc7f3b494d843b18682918ac7422ce9cd5"
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
