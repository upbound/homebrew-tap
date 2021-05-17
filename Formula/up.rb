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
    version "v0.1.0"
    license "Upbound Software License"
    bottle :unneeded
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.1.0/bundle/darwin_amd64.tar.gz"
      sha256 "e78e6af9e62e6bd1a6fe92830dbdbeb267cebb8ae28780ecd8a0204b734d3105"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.1.0/bundle/darwin_arm64.tar.gz"
      sha256 "55f79f4403b485be61f0b8929d377bb5f785cba7021954bede87a20da24b891f"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.1.0/bundle/linux_amd64.tar.gz"
      sha256 "2e67177ad232c802f7f6ba7e7a03d794316df1c2bb7566066aacae0896535e2f"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.1.0/bundle/linux_arm.tar.gz"
      sha256 "8851b2aeb5986472d2ce8b1d0b51547c9691ddc9ce652c5b169e72d6fb44b91f"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.1.0/bundle/linux_arm64.tar.gz"
      sha256 "2e44b844dc3077867b9761522dd27ed5ce0f09a045b1fa8ad4483203111a2b47"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
