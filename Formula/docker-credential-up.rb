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

class DockerCredentialUp < Formula
    desc "Upbound Docker credential helper"
    homepage "https://upbound.io"
    version "v0.11.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/docker-credential-up/darwin_amd64.tar.gz"
      sha256 "9b75ec19421c8ab9fcec4b26877ba95ffaf4172041339daaa8535b647619cf6d"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/docker-credential-up/darwin_arm64.tar.gz"
      sha256 "59a52a76214d6c954d6bcd34fc6d97493ff1d83e5171e1edef921f88b48f28f7"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/docker-credential-up/linux_amd64.tar.gz"
      sha256 "5f058752e64a488c6ae25e79e67628acc37d935ade887c41bef102e49178d025"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/docker-credential-up/linux_arm.tar.gz"
      sha256 "cbdcf846035343419689a55d76fa4df156c56d08758347111238af8c262fcc0a"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.11.0/bundle/docker-credential-up/linux_arm64.tar.gz"
      sha256 "0a8f9db6991fff354b16c0c93bc4024397be75794253211aa11198dc32926495"
    end
  
    def install
      bin.install "docker-credential-up"
    end
  
    test do
      system "#{bin}/docker-credential-up -v"
    end
  end
