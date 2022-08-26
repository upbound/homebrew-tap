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
  version 'v0.13.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '079087de537edf4c9629e3c9e92ccccc9e6eaf87d507c9573af895c6e4023af9'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'c225730974304da493c056c200a88bbf268677610b00f0d0ecabd835d02c8082'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '283b2644a8860f87a662f352220e26a98d360283f8ae82a9e88bdb2fcd82e880'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '2e6876652b24403889a4935ee628ac23ff0ff16bd5923faea8d26cd3c27d236c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.13.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '9855b6c6911d25f1da04b12f123cd2f6c6f8306f6eec0c321495511936259a47'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
