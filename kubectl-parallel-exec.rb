class KubectlParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/kubectl-parallel-exec"
  version "0.0.13"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-arm64.tgz"
      sha256 "7a5a2c47b5e234ed4d9f78dc7a4b6458d0691e5b3f116ff471cdfbccb2a3ded0"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-amd64.tgz"
      sha256 "94791742e54ab6ed5d220547306971849843d65829002a65ce24329ee14fa55f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-arm64.tgz"
      sha256 "2b317ac6c69fbf8ed6a1468e099e9ace014895d34f68e15b48270bf48a880f13"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-amd64.tgz"
      sha256 "8350c1bec77aeda9979398c39c8aa1e89eb1022fefeadb3d28362e5f87276d89"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "kubectl-parallel-exec-darwin-arm64" => "kubectl-parallel-exec"
      else
        bin.install "kubectl-parallel-exec-darwin-amd64" => "kubectl-parallel-exec"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "kubectl-parallel-exec-linux-arm64" => "kubectl-parallel-exec"
      else
        bin.install "kubectl-parallel-exec-linux-amd64" => "kubectl-parallel-exec"
      end
    end
  end

  test do
    system "#{bin}/kubectl-parallel-exec", "--version"
  end
end
