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
    version "v0.3.0"
    license "Upbound Software License"
    bottle :unneeded
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.3.0/bundle/darwin_amd64.tar.gz"
      sha256 "b9d233c9bc4e2c91b2eeaa37ee89a17fbff22b5bf54f70002f56314d5fd4e9e7"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.3.0/bundle/darwin_arm64.tar.gz"
      sha256 "bbf0f3ec31dc7b1ab6277c2d5d75044d3b6be119b8b3ffa8b5d7b70e676c97ae"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.3.0/bundle/linux_amd64.tar.gz"
      sha256 "5cd9b880701563966cdc90f2ba95a689881ffedf6f855643ca78fa9b2cb77b36"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.3.0/bundle/linux_arm.tar.gz"
      sha256 "4b99e297a46477747569b8ef23df1016defe2694fcf00f9e167bdb6ed4c75d48"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.3.0/bundle/linux_arm64.tar.gz"
      sha256 "20511cd8590f6955989bbfb7c2441c2d78eb0b8ba334047dab5ad815c26733e8"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
