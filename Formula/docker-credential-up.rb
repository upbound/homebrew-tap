# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
    desc "Upbound Docker credential helper"
    homepage "https://upbound.io"
    version "v0.12.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/docker-credential-up/darwin_amd64.tar.gz"
      sha256 "1c7b3452b683a39b93672af27203371041e1d778f31749c1880bc9810229253f"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/docker-credential-up/darwin_arm64.tar.gz"
      sha256 "1627da3d005a1f131d719ca1606617a7f2b899f5759c151fe10cb0e77d7bb344"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/docker-credential-up/linux_amd64.tar.gz"
      sha256 "a45dfe511fc88a6ea3cacf498cf7b027ae2c3d5c880edc672f9f282fa5044008"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/docker-credential-up/linux_arm.tar.gz"
      sha256 "c862d97acc7cde4ff613ec1e167decc5e67e7c716ca0a84cb4f06ef02a777e79"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/docker-credential-up/linux_arm64.tar.gz"
      sha256 "c4545bfe1cf7177dbc9dd0e4042da43d3c81f1dd6a4b8ac45281a2d984b90031"
    end
  
    def install
      bin.install "docker-credential-up"
    end
  
    test do
      system "#{bin}/docker-credential-up -v"
    end
  end
