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
    version "v0.4.0"
    license "Upbound Software License"
    bottle :unneeded
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.4.0/bundle/darwin_amd64.tar.gz"
      sha256 "c089f6d1b5956ebb692b8e4c8cf6fc81cdc0223c9ccddfaaa4dfa5e437f2d660"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.4.0/bundle/darwin_arm64.tar.gz"
      sha256 "69bfd8b10128bd959841ff76b94e49700556fa43d08e1c288b6839b92123b92f"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.4.0/bundle/linux_amd64.tar.gz"
      sha256 "2ad844bb4877a1afea889e1344282993c536a4012e0293f9dfa5d2fd2aaf2cef"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.4.0/bundle/linux_arm.tar.gz"
      sha256 "dd5ac38a2d147c4c363e46a1826f354a8d31152798d1670a842a8babd23d55b3"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.4.0/bundle/linux_arm64.tar.gz"
      sha256 "72fb332aaa2950ac684023731c9c083d447f3e6c5ea76922f45eff09406921ff"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
