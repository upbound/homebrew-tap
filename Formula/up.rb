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
    version "v0.2.0"
    license "Upbound Software License"
    bottle :unneeded
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.2.0/bundle/darwin_amd64.tar.gz"
      sha256 "50e721c1dd8e92b184b629922413f9aaf6dcedc4d8e544d8e57209cae27e1408"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.2.0/bundle/darwin_arm64.tar.gz"
      sha256 "5cb6b48022899139c7fe0726098acee31b4873481ed79fadb3ea67abc9fea69f"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.2.0/bundle/linux_amd64.tar.gz"
      sha256 "729d5a6efdb85ad6ca3fd003870f10d11c4baaa378de69c1c73d95858d38d964"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.2.0/bundle/linux_arm.tar.gz"
      sha256 "e5901bef1dd1caaae242fbfa73df6d0689b862a31641634b9d6125ee9bd338d9"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.2.0/bundle/linux_arm64.tar.gz"
      sha256 "e9ff54ed972e9470d91ae6358de8672203dc77662345f725b55f4029f0d3469c"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
