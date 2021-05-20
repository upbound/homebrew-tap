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
    version "v0.1.1"
    license "Upbound Software License"
    bottle :unneeded
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.1.1/bundle/darwin_amd64.tar.gz"
      sha256 "8e75b29b7aff1e188c6e43979a18f908e9ba64c49bc604af30f0966c3042a7c0"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.1.1/bundle/darwin_arm64.tar.gz"
      sha256 "cd7f936388691afa1c2cbf4de99c712580afd02d686c7c3d843103df32db6b69"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.1.1/bundle/linux_amd64.tar.gz"
      sha256 "8ede0eea56a144b186827cd3912dbb515eefda511a884a2a7c2683d8c04a81d6"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.1.1/bundle/linux_arm.tar.gz"
      sha256 "bea502758c71f50a7e9a1b6a6ac872b86e2303369ba8eec42f6a241834258ef0"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.1.1/bundle/linux_arm64.tar.gz"
      sha256 "6de74c30ab41857a7c3f11833d0167f5fbd182fa4c7bb88ecbdd0c4f29a665a9"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
