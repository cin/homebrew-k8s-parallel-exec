class K8sParallelExec < Formula
  desc "Execute commands on Kubernetes pods in parallel"
  homepage "https://github.com/cin/k8s-parallel-exec"
  version "0.0.10"
  license "mit"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-arm64.tgz"
      sha256 "44c562a94d016d1c76c78ea59b0840f3387ee3e2ffda00ed25e325f8ddc4559c"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-darwin-amd64.tgz"
      sha256 "b781cc52417b85f8b7425863febae094444d63403a4948aa4c35d974be50babe"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-arm64.tgz"
      sha256 "22934c4cc734822af585b3b5994d325fadbbb8767605774ae08ccf51d12a3670"
    else
      url "https://github.com/cin/k8s-parallel-exec/releases/download/#{version}/k8s-parallel-exec-linux-amd64.tgz"
      sha256 "d8c24e81ec9620ff9bfa7c21087a4b9f0803eb3191d8eb69affebb5169a9faad"
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
