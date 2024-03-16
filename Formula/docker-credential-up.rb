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
  version 'v0.25.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '105e2032ee19c114adb2dffc1913d6c343350afba7032fda10bfc46e756a9b3e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '07b3c82a19c19e533af6f28512dcc3ed606e50192b5f85934aa95d4288a37b0a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'c677dfe367c342a0a75dcf8b1deeda72df4793d71dd854010b031a890fc8091f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '458bd1b616a42f5d9a28b88df7ec46de321b651a6c99371dd804f56f2c62ab2c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'c90ec7e5103615361aeca0e570438af5cfdfd30e81df809e428f24ba02423be6'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
