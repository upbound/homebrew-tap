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
    version "v0.12.1"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/docker-credential-up/darwin_amd64.tar.gz"
      sha256 "e746eb13ea4ef84d46c3aef88f2c2a03ae892208bd4e2b29b78ddf9d6fdecc2c"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/docker-credential-up/darwin_arm64.tar.gz"
      sha256 "3fb01807f8c414a467d3fe9c65686b2103002e50930f6e678644db411f82dbb7"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/docker-credential-up/linux_amd64.tar.gz"
      sha256 "6fb929ef6fc345f23f98dc61583c2df5b581cdba39680dc83e57ec44eee2b4c1"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/docker-credential-up/linux_arm.tar.gz"
      sha256 "62b902e4fa3cc25e60cb2315744ae0d9a6db27b047ddbb73310613c1bfcbd92e"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.1/bundle/docker-credential-up/linux_arm64.tar.gz"
      sha256 "00cec226d1bad1407b7aa257d49c7732977df08d028b21347b80340d5b9457e5"
    end
  
    def install
      bin.install "docker-credential-up"
    end
  
    test do
      system "#{bin}/docker-credential-up -v"
    end
  end
