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
    version "v0.9.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.9.0/bundle/darwin_amd64.tar.gz"
      sha256 "dae0c8ced1a70bf63406799f08fd0d519eff771640daee941b47c9487383f77b"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.9.0/bundle/darwin_arm64.tar.gz"
      sha256 "7462e0e9b304bc3c1bb16ec86aa9b3715f4d7c2287a1c93ef37ced76a5f1d2b0"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.9.0/bundle/linux_amd64.tar.gz"
      sha256 "e05f96dd7f739c36486edfce7e1625464e11f304c583bfaa15440cebcea910ec"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.9.0/bundle/linux_arm.tar.gz"
      sha256 "ab7f1f9f80274bb289d614139f6b62c053dd22733bd59cb13779982f25b311e7"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.9.0/bundle/linux_arm64.tar.gz"
      sha256 "9d20a2f627837410825652cea8b237848bd9f73b7bc71c86157ec001c7ce0854"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
