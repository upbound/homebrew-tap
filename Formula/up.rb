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
    version "v0.12.2"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/up/darwin_amd64.tar.gz"
      sha256 "68be95d945089e67c5ab60e7a5ea3f0e4443892140a9d140c76a1a1e05f00c94"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/up/darwin_arm64.tar.gz"
      sha256 "01f0d1094d9dabafe006eb2f5ba1d39e8a6598f29b88f0ad0d0ab48bf3c7bd0d"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/up/linux_amd64.tar.gz"
      sha256 "fa9817753a131f6b9f8c3be77c0c6f5b35e01925052b68ea32e64c88f0399db2"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/up/linux_arm.tar.gz"
      sha256 "1db5fa70be70c64f81fe0ef5845a73234d503b0df97efb4bb94c0caafd300152"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.2/bundle/up/linux_arm64.tar.gz"
      sha256 "0686562379e7ce2734964d75643273983907f430cfd0e51386b76d39a9f2715a"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
