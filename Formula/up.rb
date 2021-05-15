class Up < Formula
    desc "The official Upbound CLI"
    homepage "https://upbound.io"
    version "v0.0.0-164.ga79e695"
    license "Upbound Software License"
    bottle :unneeded
  
    # TODO(hasheddan): add sha256 digests for bundles for first stable release
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/main/v0.0.0-164.ga79e695/bundle/darwin_amd64.tar.gz"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/main/v0.0.0-164.ga79e695/bundle/darwin_arm64.tar.gz"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/main/v0.0.0-164.ga79e695/bundle/linux_amd64.tar.gz"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/main/v0.0.0-164.ga79e695/bundle/darwin_arm.tar.gz"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/main/v0.0.0-164.ga79e695/bundle/darwin_arm64.tar.gz"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
