# Copyright 2021 Upbound Inc
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
    version "v0.10.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.10.0/bundle/darwin_amd64.tar.gz"
      sha256 "4686503b87b6a2a62d7a40172045031cd8bd8fccc6543568ed6ae4bcd14e6e25"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.10.0/bundle/darwin_arm64.tar.gz"
      sha256 "cdd2d45b24d374ecb68452ed7aa58fc2ec4e28827a2e7513b28b5c222c5c6954"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.10.0/bundle/linux_amd64.tar.gz"
      sha256 "2d1a9c2b0c5ecbcc76fd242453cf235548ea835e02c962c6fb37de91e27eceda"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.10.0/bundle/linux_arm.tar.gz"
      sha256 "eaca79316f163bbdd086d93d2bd5c3de5682a7357ecf1c7c49d782b3b6308f31"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.10.0/bundle/linux_arm64.tar.gz"
      sha256 "d8d1bf4945ec01e34775674f074ff34a60caf48f92c8a05ec62423adf001c3b5"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
