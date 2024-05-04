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
  version 'v0.29.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '191aba70d970c00b16ba5051f400d4c98d0c8e795636426e330576f479490452'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'da6afcfc8cdf8f31c0f383c04a3d783020e5f21a0e02fb124a36928a1faf95bf'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '1d326705c52bc20f66c649cb36d8d67fc53cec2e219459515af7ba423d55acda'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'b52981848b58d9aa225c7028e374e113ed38b506d0a860167e83973fa3416845'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.29.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'bd3bb7cbf2e0c568032b167047a04bb08d9ff58d2a785a3ec713b769e0b4071f'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
