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
    version "v0.12.2"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/docker-credential-up/darwin_amd64.tar.gz"
      sha256 "856f8d9fee3267d8857aed6da29b3890a2f8a9f4e13da4d225a4bcccb490583a"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/docker-credential-up/darwin_arm64.tar.gz"
      sha256 "4c4851417c21b5ce0f90b7eceda617a0cfa17865a7fe00375b41fbd5326f2da5"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/docker-credential-up/linux_amd64.tar.gz"
      sha256 "af0eebbb44837bb61a1641cb5140eff1980b7f729a2414619071ea046bf17f92"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/docker-credential-up/linux_arm.tar.gz"
      sha256 "50b4aa8bec48818eceb93d395a5824583494b543eec4e278f8bf98528d78935c"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/docker-credential-up/linux_arm64.tar.gz"
      sha256 "0f389f38bdf2b28aaa8f9472a05ad0f4ca419ef9d5190c8945e24325fd6ffd47"
    end
  
    def install
      bin.install "docker-credential-up"
    end
  
    test do
      system "#{bin}/docker-credential-up -v"
    end
  end
