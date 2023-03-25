class K8sParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/k8s-parallel-exec"
  version "0.0.8"
  license "mit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-arm64"
      sha256 "10f810e82f1bd925fe184f1931a839488714ec5aba06285cc09c3cb789fb825e"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-amd64"
      sha256 "b421fcefe27d945042bc5d97aa74f53cdb69a19fad532f09f44e334d3966daa2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-arm64"
      sha256 "6d44d919dfa2dfdaef73b14669074e8bd579f68bc6ffe800be3abec89e3fb72c"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-amd64"
      sha256 "d9e88f5d06e1b6c2d82d5c3e84940559a5ae068fbe07c92afd7c51ea668d48d5"
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
