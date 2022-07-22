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
    version "v0.12.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/up/darwin_amd64.tar.gz"
      sha256 "46ad432d4529f15325c6ae593f46dcce2b5efabebd88630faa2afe5b8e89cc7a"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/up/darwin_arm64.tar.gz"
      sha256 "e3d69cf59be428dfb215d7a996a6550d241af112bbdb3226161d09cc2469f2bd"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/up/linux_amd64.tar.gz"
      sha256 "fa9817753a131f6b9f8c3be77c0c6f5b35e01925052b68ea32e64c88f0399db2"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/up/linux_arm.tar.gz"
      sha256 "8019a4ed7d702e6b02c66ae30e4fc18c1a1cb8046ba3f38490a7c8d651c434e8"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.12.0/bundle/up/linux_arm64.tar.gz"
      sha256 "21f69883b6f12b0aca618c6811779bfe1b52299ac3f9ae8bd587fdaee0c904a2"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
