class K8sParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/k8s-parallel-exec"
  version "0.0.6"
  license "mit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-arm64"
      sha256 "58fca51f9600a8c7b0a3f01cf539c02c5237c5de41434008df8dc6b326c911b5"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-amd64"
      sha256 "2371d53abb31b023c91b58423cc9b827ba1d66d6036a6436892d0865da3ac6c2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-arm64"
      sha256 "228c36603ffac510fb00cfb66b2a1dcac5e6b587b7e067a7b28b5c072d516ce6"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-amd64"
      sha256 "58bef79bb27d2c41bc12945ba9581c83c54a1a8a98eace7db4a09ee7eed528b6"
    end
  end

  def install
    bin.install "k8s-parallel-exec"
  end

  test do
    system "#{bin}/k8s-parallel-exec", "--version"
  end
end
