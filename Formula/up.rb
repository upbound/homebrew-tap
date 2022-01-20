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
    version "v0.6.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.6.0/bundle/darwin_amd64.tar.gz"
      sha256 "feaedc5370b81d4d9f67b4914059a000547eaca3bb9fae0548b265b0a14c86e0"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.6.0/bundle/darwin_arm64.tar.gz"
      sha256 "9c674a7d215d4f132c16f222c43e5dda6691f8cd8d99b944418e203b3ccf236b"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.6.0/bundle/linux_amd64.tar.gz"
      sha256 "969213b4f75e93c656aeea5e474f80bce8cc4dae65eaf2dcde3f41934313e1d2"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.6.0/bundle/linux_arm.tar.gz"
      sha256 "5b2a8ea30dbf4c29eb818c55f788af39be7b910561ece0b69980fe4c297e0f09"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.6.0/bundle/linux_arm64.tar.gz"
      sha256 "ddf29c9b38acb0ea41a01b6bf0c6f0b7234b3460b7e942813e4bc37bb7a3ae7d"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
