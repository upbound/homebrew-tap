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
    version "v0.4.1"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.4.1/bundle/darwin_amd64.tar.gz"
      sha256 "ac47de3249a59df51dbf4ed671b9a8f5127c72c50e5007d4e42edea684ec4741"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.4.1/bundle/darwin_arm64.tar.gz"
      sha256 "8228f15af58c70ed0402a54d00144ce7c81d0074eccadc40cc9c9fde702e933f"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.4.1/bundle/linux_amd64.tar.gz"
      sha256 "59a96888ff307d5be5cede7417907bd849ef410216ab28ba2e03d8524f0154e8"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.4.1/bundle/linux_arm.tar.gz"
      sha256 "60e719ed151dbd5ae161848fa1951f70810391b3175918829e38772982a10fc4"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.4.1/bundle/linux_arm64.tar.gz"
      sha256 "0002bc8d6b520a0e1ae7a6105b0f8010a15fd4fcc0d09053ece1cc55340161f8"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
