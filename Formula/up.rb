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
    version "v0.11.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/up/darwin_amd64.tar.gz"
      sha256 "329adb068d0d5807f3ed6864533fa78527545c0ab0dd6f0f430b20f13d145f7a"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/up/darwin_arm64.tar.gz"
      sha256 "39f44ec6e7be8a8dc99ab81d546d376ab5517d8115735791ea487a90ff2c074a"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/up/linux_amd64.tar.gz"
      sha256 "a45fb73624d1ba6ad6e45d772061152c254f1766cffdf34f407656fc962babd7"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/up/linux_arm.tar.gz"
      sha256 "e6e5e556ed9a15a5deb6c8cab0ffd472572678eee07c4f6fa37a13e1b646707f"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/up/linux_arm64.tar.gz"
      sha256 "5762be0cf3bd05ded0b5c98b54a4737cddaa4886425b93a0b4243aafb3743604"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
