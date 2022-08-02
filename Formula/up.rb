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

class Up < Formula
    desc "The official Upbound CLI"
    homepage "https://upbound.io"
    version "v0.12.1"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/up/darwin_amd64.tar.gz"
      sha256 "9e3a7d0c8a906a30a3821d7667d90f67685c7efc01e9db7b3b2dd782fee52fbc"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/up/darwin_arm64.tar.gz"
      sha256 "3d2a3c2d4bc897d948e92da2cc52bc243ef6b8217021b67c6094d30a7f2f2515"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/up/linux_amd64.tar.gz"
      sha256 "fa9817753a131f6b9f8c3be77c0c6f5b35e01925052b68ea32e64c88f0399db2"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/up/linux_arm.tar.gz"
      sha256 "3d85466fa4e39ccb0a224690c061e69d207531cc23aa1a1696ac7880bf4b198c"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/up/linux_arm64.tar.gz"
      sha256 "abb980283399b1f5c1567f75cfc00447caf7fa7973a2c027b8bf3bdd19c58d34"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
