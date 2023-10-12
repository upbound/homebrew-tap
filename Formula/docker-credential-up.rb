# frozen_string_literal: true

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
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.21.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'e896be2c1af8418e136ceb5a6151c536d126abdbca5b446315250634a18765d4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '4a4eae22c124cead1ddf59e340fe10e035360701f01eeb9041aecde54a9455ec'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '444de42a80c2b45789478fd728b85ab7ce46961f9e39c20d9f52d0215192a26c'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '33391dca8a64ff0c6cff8d6dd207dafeb5b23ea04584beeef57e78b0a2419db2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.21.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '03a74f0b1d6020e533002b7f709c5db08ef96d8ef0b44e76e3fcb12e370360b5'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
