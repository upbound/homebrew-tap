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
    version "v0.5.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.5.0/bundle/darwin_amd64.tar.gz"
      sha256 "21232e6c1dc8ffb61b862c22d81475ab495655463158eda20a55681d15407ab4"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.5.0/bundle/darwin_arm64.tar.gz"
      sha256 "f1bffe052e9bb3c3be24e8cfc0c42bfdd871a6f6ee45b6bf7b6d818532a13026"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.5.0/bundle/linux_amd64.tar.gz"
      sha256 "fe8d2af24d41757d27afe7c2eea9caa3ec5575f2d0619a9233bb2a37362cc571"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.5.0/bundle/linux_arm.tar.gz"
      sha256 "deb1b7fe4fe5a5865c250fce81e41f05feed767c34126864ae45ef4ba0de707d"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.5.0/bundle/linux_arm64.tar.gz"
      sha256 "536479ad7a8ffb9adf57de1003573a74382a3cb2e972f7e7b12adb3626bf28ac"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
