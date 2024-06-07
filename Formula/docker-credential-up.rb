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
  version 'v0.31.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'fdc74b9ecbee2639e7fa5db9d14e3176d38da8172485e3709a002c64ec9949bf'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'dfed66c4cd56f6ce50d1bf3bedb232e6c708a509ae2c0ec8b06971a111fbf4a4'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '068b255cf92f19c9bd9a021d2b5ea25652d17e2044e38a2a2791390a68917c6f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '89a893b3c04bd10cf07b75de1e1d78eb786147dffbd18e42e675482221a20fd2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.31.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'a6523554677fe8c147c9ad32356e995e01a52f170bf5985721a14f245968a4a1'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
