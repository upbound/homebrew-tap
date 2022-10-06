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
  version 'v0.14.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '32d37475a7d8d2c3c52f2dd0fcf6a0a58b9254fc0464b6918af4bd19960ba066'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '88699453682c6a55b6d5f2d2eaa357677bb9014465586f3b1baf8d6f13edd8e9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'e4ce8742b3bda224af3de8253d5910999dbef836719efc88909f1525a7fd9131'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '204e83db57ecfd71d06fe4ca021fe444d50b8924bb375d241678773bdfc15f73'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.14.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '6574d830f6d28d779916d98c7ab82e5fb69bb267725c9a76efdd475dc499bc2f'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
