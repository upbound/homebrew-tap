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
    version "v0.8.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.8.0/bundle/darwin_amd64.tar.gz"
      sha256 "1cee8346e021b542b0c90e6e75475fd1a0a613aa2316dc3618ca3fff2be1e0fa"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.8.0/bundle/darwin_arm64.tar.gz"
      sha256 "49915d7df75a719720ceb0f3e7e935fafcaa4d4cacc0b00db7e4f0da70463535"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.8.0/bundle/linux_amd64.tar.gz"
      sha256 "a57eecca2a9f8affd1637e2afc6e054c976f44bb57d3a611ec9b62b138cc15fc"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.8.0/bundle/linux_arm.tar.gz"
      sha256 "3de3090ceb4de346a2a2581e769655c4a068eb790d089f06264168dd461f2f1c"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.8.0/bundle/linux_arm64.tar.gz"
      sha256 "0b9c4dbcb031bdd5e2eff032568b620ad77d08c497c8d22595479b39ce6cb768"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
