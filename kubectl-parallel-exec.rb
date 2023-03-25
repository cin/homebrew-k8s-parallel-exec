class KubectlParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/kubectl-parallel-exec"
  version "0.0.12"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-arm64.tgz"
      sha256 "d152c34f474010147ae2fba632fe9d60379a5c5deaff2df1bbfa83b8a5bf1aee"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-darwin-amd64.tgz"
      sha256 "c93ecc01340de940fd69f9abfecad4197da1dfedb76d52b12837f2cbcbfc3b43"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-arm64.tgz"
      sha256 "ffc10f967c62887557485554b9fba4fbf5e088a2c2bf8c6342a47f5cd6ec0b17"
    else
      url "https://github.com/cin/kubectl-parallel-exec/releases/download/#{version}/kubectl-parallel-exec-linux-amd64.tgz"
      sha256 "88ee074adc8cf252a15afe6f268e545ca7725c58f2d4afbb2316f81911444d55"
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
