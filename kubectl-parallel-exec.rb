class KubectlParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/kubectl-parallel-exec"
  version "0.0.15"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-arm64.tgz"
      sha256 "46153b3ffe8ee972f37159e7cabe8b8a4f819cf211cfce94b2f5ace7b5503017"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-amd64.tgz"
      sha256 "79035187dd2cc587e43eccae76008ebe06a479dee7eb72cec6ad9cf4e830836f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-arm64.tgz"
      sha256 "46cc365638b992fe32eb459efda584a2114656165702f582ca62cd8fc32fd1de"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-amd64.tgz"
      sha256 "37720ec41a0aa827e1aae96526dcfafbc3be384803b489637bfe326f5737429f"
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
