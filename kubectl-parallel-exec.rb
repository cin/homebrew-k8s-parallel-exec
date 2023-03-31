class KubectlParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/kubectl-parallel-exec"
  version "0.0.14"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-arm64.tgz"
      sha256 "8a914f31a9f1d7cc1e1c4abadf4128460466a35e75d434f9569a3f2539d0506f"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-amd64.tgz"
      sha256 "0153d05ef3a7b303923cb5e88b4c8384c05657a8b1b865ee4b60c799c303e045"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-arm64.tgz"
      sha256 "418d99458caedc4cb818aa98e31385f8f17530eda8ce867c573a4d07ad956404"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-amd64.tgz"
      sha256 "f2335fca51fb654eb19bdec73b8037b431994a17e115c63b24043b1030af016c"
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
